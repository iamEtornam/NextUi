import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Dropdown component
///
/// Displays a list of actions or options that a user can choose.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextDropdown(
///   trigger: NextDropdownTrigger(
///     child: Button.solid(
///       child: Text('Actions'),
///     ),
///   ),
///   menu: NextDropdownMenu(
///     children: [
///       NextDropdownItem(
///         key: ValueKey('new'),
///         child: Text('New file'),
///       ),
///       NextDropdownItem(
///         key: ValueKey('copy'),
///         child: Text('Copy link'),
///       ),
///       NextDropdownItem(
///         key: ValueKey('edit'),
///         child: Text('Edit file'),
///       ),
///     ],
///   ),
/// )
/// ```
class NextDropdown extends StatefulWidget {
  /// Creates a Next UI Dropdown
  const NextDropdown({
    required this.trigger,
    required this.menu,
    super.key,
    this.triggerType = DropdownTrigger.press,
    this.isDisabled = false,
    this.closeOnSelect = true,
    this.shouldBlockScroll = true,
    this.onOpenChange,
    this.onClose,
  });

  /// The trigger widget that opens the dropdown
  final NextDropdownTrigger trigger;

  /// The dropdown menu
  final NextDropdownMenu menu;

  /// How the dropdown is triggered
  final DropdownTrigger triggerType;

  /// Whether the dropdown is disabled
  final bool isDisabled;

  /// Whether to close dropdown when an item is selected
  final bool closeOnSelect;

  /// Whether to block scrolling when dropdown is open
  final bool shouldBlockScroll;

  /// Called when dropdown open state changes
  final ValueChanged<bool>? onOpenChange;

  /// Called when dropdown closes
  final VoidCallback? onClose;

  @override
  State<NextDropdown> createState() => _NextDropdownState();
}

class _NextDropdownState extends State<NextDropdown> {
  bool _isOpen = false;

  void _toggleDropdown() {
    if (widget.isDisabled) return;

    setState(() {
      _isOpen = !_isOpen;
      widget.onOpenChange?.call(_isOpen);
      if (!_isOpen) {
        widget.onClose?.call();
      }
    });
  }

  void _closeDropdown() {
    setState(() {
      _isOpen = false;
      widget.onOpenChange?.call(false);
      widget.onClose?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.triggerType == DropdownTrigger.press
              ? _toggleDropdown
              : null,
          onLongPress: widget.triggerType == DropdownTrigger.longPress
              ? _toggleDropdown
              : null,
          child: widget.trigger.child,
        ),
        if (_isOpen)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: _DropdownMenuWrapper(
              menu: widget.menu,
              onItemSelected: (key) {
                if (widget.closeOnSelect) {
                  _closeDropdown();
                }
              },
              onClose: _closeDropdown,
            ),
          ),
      ],
    );
  }
}

/// Dropdown trigger component
class NextDropdownTrigger extends StatelessWidget {
  /// Creates a dropdown trigger
  const NextDropdownTrigger({
    required this.child,
    super.key,
  });

  /// The trigger widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

/// Wrapper for the dropdown menu in overlay
class _DropdownMenuWrapper extends StatefulWidget {
  const _DropdownMenuWrapper({
    required this.menu,
    required this.onItemSelected,
    required this.onClose,
  });

  final NextDropdownMenu menu;
  final ValueChanged<String> onItemSelected;
  final VoidCallback onClose;

  @override
  State<_DropdownMenuWrapper> createState() => _DropdownMenuWrapperState();
}

class _DropdownMenuWrapperState extends State<_DropdownMenuWrapper> {
  late Set<String> _selectedKeys;

  @override
  void initState() {
    super.initState();
    _selectedKeys = Set.from(widget.menu.selectedKeys);
  }

  void _handleItemTap(String key) {
    if (widget.menu.disabledKeys.contains(key)) return;

    widget.onItemSelected(key);
    widget.menu.onAction?.call(key);

    if (widget.menu.selectionMode == DropdownSelectionMode.single) {
      setState(() {
        _selectedKeys = {key};
      });
      widget.menu.onSelectionChange?.call(_selectedKeys);
    } else if (widget.menu.selectionMode == DropdownSelectionMode.multiple) {
      setState(() {
        if (_selectedKeys.contains(key)) {
          _selectedKeys.remove(key);
        } else {
          _selectedKeys.add(key);
        }
      });
      widget.menu.onSelectionChange?.call(_selectedKeys);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 300,
        maxHeight: 400,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.menu.children.map((child) {
                if (child is NextDropdownItem) {
                  final key = child.itemKey;
                  final isSelected = key != null && _selectedKeys.contains(key);
                  final isDisabled =
                      key != null && widget.menu.disabledKeys.contains(key);

                  return _DropdownItemWrapper(
                    itemKey: child.itemKey,
                    title: child.title,
                    description: child.description,
                    shortcut: child.shortcut,
                    startContent: child.startContent,
                    endContent: child.endContent,
                    showDivider: child.showDivider,
                    isSelected: isSelected,
                    isDisabled: isDisabled,
                    hideSelectedIcon: widget.menu.hideSelectedIcon,
                    variant: widget.menu.variant,
                    color: widget.menu.color,
                    onTap: () {
                      if (key != null) {
                        _handleItemTap(key);
                      }
                      child.onTap?.call();
                    },
                    child: child.child,
                  );
                } else if (child is NextDropdownSection) {
                  return child;
                }
                return child;
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dropdown menu component
class NextDropdownMenu extends StatelessWidget {
  /// Creates a dropdown menu
  const NextDropdownMenu({
    required this.children,
    super.key,
    this.variant = DropdownVariant.solid,
    this.color = DropdownColor.defaultColor,
    this.selectionMode = DropdownSelectionMode.none,
    this.selectedKeys = const {},
    this.disabledKeys = const {},
    this.hideSelectedIcon = false,
    this.disableAnimation = false,
    this.onAction,
    this.onSelectionChange,
    this.onClose,
  });

  /// Menu items
  final List<Widget> children;

  /// Menu variant
  final DropdownVariant variant;

  /// Menu color
  final DropdownColor color;

  /// Selection mode
  final DropdownSelectionMode selectionMode;

  /// Selected item keys
  final Set<String> selectedKeys;

  /// Disabled item keys
  final Set<String> disabledKeys;

  /// Whether to hide selected icon
  final bool hideSelectedIcon;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Called when an item is selected
  final ValueChanged<String>? onAction;

  /// Called when selection changes
  final ValueChanged<Set<String>>? onSelectionChange;

  /// Called when menu closes
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    // This is just a props container widget
    // Actual rendering happens in _DropdownMenuWrapper
    return const SizedBox.shrink();
  }
}

/// Internal wrapper for dropdown items within the menu
class _DropdownItemWrapper extends StatefulWidget {
  const _DropdownItemWrapper({
    this.itemKey,
    this.title,
    this.description,
    this.shortcut,
    this.startContent,
    this.endContent,
    this.showDivider = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.hideSelectedIcon = false,
    this.variant = DropdownVariant.solid,
    this.color = DropdownColor.defaultColor,
    this.onTap,
    this.child,
  });

  final String? itemKey;
  final String? title;
  final String? description;
  final String? shortcut;
  final Widget? startContent;
  final Widget? endContent;
  final bool showDivider;
  final bool isSelected;
  final bool isDisabled;
  final bool hideSelectedIcon;
  final DropdownVariant variant;
  final DropdownColor color;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  State<_DropdownItemWrapper> createState() => _DropdownItemWrapperState();
}

class _DropdownItemWrapperState extends State<_DropdownItemWrapper> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: InkWell(
            onTap: widget.isDisabled ? null : widget.onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _getBackgroundColor(theme),
              ),
              child: Row(
                children: [
                  if (widget.startContent != null) ...[
                    IconTheme(
                      data: IconThemeData(
                        color: _getContentColor(theme),
                        size: 20,
                      ),
                      child: widget.startContent!,
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: widget.child ??
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.title != null)
                              DefaultTextStyle(
                                style: theme.textTheme.bodyMedium?.copyWith(
                                      color: _getContentColor(theme),
                                      fontWeight: FontWeight.w500,
                                    ) ??
                                    const TextStyle(),
                                child: Text(widget.title!),
                              ),
                            if (widget.description != null) ...[
                              const SizedBox(height: 2),
                              DefaultTextStyle(
                                style: theme.textTheme.bodySmall?.copyWith(
                                      color: _getContentColor(theme)
                                          .withValues(alpha: 0.7),
                                    ) ??
                                    const TextStyle(),
                                child: Text(widget.description!),
                              ),
                            ],
                          ],
                        ),
                  ),
                  if (widget.shortcut != null) ...[
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest
                            .withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.shortcut!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: _getContentColor(theme).withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ],
                  if (widget.endContent != null) ...[
                    const SizedBox(width: 12),
                    IconTheme(
                      data: IconThemeData(
                        color: _getContentColor(theme),
                        size: 20,
                      ),
                      child: widget.endContent!,
                    ),
                  ],
                  if (widget.isSelected && !widget.hideSelectedIcon) ...[
                    const SizedBox(width: 12),
                    Icon(
                      Icons.check,
                      size: 16,
                      color: _getContentColor(theme),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (widget.showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Divider(height: 1),
          ),
      ],
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (widget.isDisabled) {
      return Colors.transparent;
    }

    if (_isHovered || widget.isSelected) {
      final baseColor = _getBaseColor();

      switch (widget.variant) {
        case DropdownVariant.solid:
          return baseColor.withValues(alpha: 0.1);
        case DropdownVariant.bordered:
          return baseColor.withValues(alpha: 0.05);
        case DropdownVariant.light:
          return baseColor.withValues(alpha: 0.15);
        case DropdownVariant.flat:
          return baseColor.withValues(alpha: 0.1);
        case DropdownVariant.faded:
          return baseColor.withValues(alpha: 0.08);
        case DropdownVariant.shadow:
          return baseColor.withValues(alpha: 0.1);
      }
    }

    return Colors.transparent;
  }

  Color _getContentColor(ThemeData theme) {
    if (widget.isDisabled) {
      return theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.4) ??
          Colors.grey;
    }

    if (_isHovered || widget.isSelected) {
      return _getBaseColor();
    }

    return theme.textTheme.bodyMedium?.color ?? Colors.black;
  }

  Color _getBaseColor() {
    switch (widget.color) {
      case DropdownColor.defaultColor:
        return const Color(0xFF71717a);
      case DropdownColor.primary:
        return NextUiColors.primary;
      case DropdownColor.secondary:
        return NextUiColors.secondary;
      case DropdownColor.success:
        return NextUiColors.success;
      case DropdownColor.warning:
        return NextUiColors.warning;
      case DropdownColor.danger:
        return NextUiColors.danger;
    }
  }
}

/// Dropdown section component
class NextDropdownSection extends StatelessWidget {
  /// Creates a dropdown section
  const NextDropdownSection({
    required this.children,
    super.key,
    this.title,
    this.showDivider = false,
  });

  /// Section title
  final String? title;

  /// Section items
  final List<Widget> children;

  /// Whether to show divider after section
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.color
                        ?.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ...children,
        if (showDivider)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Divider(height: 1),
          ),
      ],
    );
  }
}

/// Dropdown item component
class NextDropdownItem extends StatelessWidget {
  /// Creates a dropdown item
  const NextDropdownItem({
    super.key,
    this.itemKey,
    this.title,
    this.description,
    this.shortcut,
    this.startContent,
    this.endContent,
    this.showDivider = false,
    this.isSelected = false,
    this.isDisabled = false,
    this.hideSelectedIcon = false,
    this.variant = DropdownVariant.solid,
    this.color = DropdownColor.defaultColor,
    this.onTap,
    this.child,
  });

  /// Unique key for the item
  final String? itemKey;

  /// Item title
  final String? title;

  /// Item description
  final String? description;

  /// Keyboard shortcut hint
  final String? shortcut;

  /// Leading widget
  final Widget? startContent;

  /// Trailing widget
  final Widget? endContent;

  /// Whether to show divider after item
  final bool showDivider;

  /// Whether item is selected
  final bool isSelected;

  /// Whether item is disabled
  final bool isDisabled;

  /// Whether to hide selected icon
  final bool hideSelectedIcon;

  /// Item variant
  final DropdownVariant variant;

  /// Item color
  final DropdownColor color;

  /// Called when item is tapped
  final VoidCallback? onTap;

  /// Custom child widget
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // This is just a marker widget used to pass props
    // The actual rendering happens in _DropdownItemWrapper
    return const SizedBox.shrink();
  }
}
