import 'package:flutter/material.dart';
import 'package:next_ui/src/base/enums.dart';

/// A customizable switch component for toggling between states.
///
/// Based on HeroUI Switch component design.
class NextSwitch extends StatefulWidget {
  /// Creates a switch component.
  const NextSwitch({
    super.key,
    this.value,
    this.isSelected,
    this.defaultSelected = false,
    this.onChanged,
    this.onValueChange,
    this.size = SwitchSize.md,
    this.color = SwitchColor.primary,
    this.label,
    this.startContent,
    this.endContent,
    this.thumbIcon,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.disableAnimation = false,
    this.name,
    this.autofocus = false,
    this.focusNode,
    this.margin,
    this.padding,
  });

  /// The value of the switch for form handling
  final String? value;

  /// Whether the switch is selected
  final bool? isSelected;

  /// Default selected state when uncontrolled
  final bool defaultSelected;

  /// Called when the switch state changes
  final ValueChanged<bool>? onChanged;

  /// Called when the switch value changes
  final ValueChanged<bool>? onValueChange;

  /// Size of the switch
  final SwitchSize size;

  /// Color theme of the switch
  final SwitchColor color;

  /// Label widget displayed next to the switch
  final Widget? label;

  /// Widget displayed at the start of the switch
  final Widget? startContent;

  /// Widget displayed at the end of the switch
  final Widget? endContent;

  /// Icon displayed inside the thumb
  final Widget? thumbIcon;

  /// Whether the switch is disabled
  final bool isDisabled;

  /// Whether the switch is read-only
  final bool isReadOnly;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Form field name
  final String? name;

  /// Whether to auto-focus the switch
  final bool autofocus;

  /// Focus node for the switch
  final FocusNode? focusNode;

  /// External margin
  final EdgeInsetsGeometry? margin;

  /// Internal padding
  final EdgeInsetsGeometry? padding;

  @override
  State<NextSwitch> createState() => _NextSwitchState();

  /// Creates a small switch
  static NextSwitch small({
    Key? key,
    bool? isSelected,
    bool defaultSelected = false,
    ValueChanged<bool>? onChanged,
    ValueChanged<bool>? onValueChange,
    SwitchColor color = SwitchColor.primary,
    Widget? label,
    Widget? startContent,
    Widget? endContent,
    Widget? thumbIcon,
    bool isDisabled = false,
    bool isReadOnly = false,
    String? value,
    String? name,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return NextSwitch(
      key: key,
      isSelected: isSelected,
      defaultSelected: defaultSelected,
      onChanged: onChanged,
      onValueChange: onValueChange,
      size: SwitchSize.sm,
      color: color,
      label: label,
      startContent: startContent,
      endContent: endContent,
      thumbIcon: thumbIcon,
      isDisabled: isDisabled,
      isReadOnly: isReadOnly,
      value: value,
      name: name,
      margin: margin,
      padding: padding,
    );
  }

  /// Creates a medium switch (default)
  static NextSwitch medium({
    Key? key,
    bool? isSelected,
    bool defaultSelected = false,
    ValueChanged<bool>? onChanged,
    ValueChanged<bool>? onValueChange,
    SwitchColor color = SwitchColor.primary,
    Widget? label,
    Widget? startContent,
    Widget? endContent,
    Widget? thumbIcon,
    bool isDisabled = false,
    bool isReadOnly = false,
    String? value,
    String? name,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return NextSwitch(
      key: key,
      isSelected: isSelected,
      defaultSelected: defaultSelected,
      onChanged: onChanged,
      onValueChange: onValueChange,
      color: color,
      label: label,
      startContent: startContent,
      endContent: endContent,
      thumbIcon: thumbIcon,
      isDisabled: isDisabled,
      isReadOnly: isReadOnly,
      value: value,
      name: name,
      margin: margin,
      padding: padding,
    );
  }

  /// Creates a large switch
  static NextSwitch large({
    Key? key,
    bool? isSelected,
    bool defaultSelected = false,
    ValueChanged<bool>? onChanged,
    ValueChanged<bool>? onValueChange,
    SwitchColor color = SwitchColor.primary,
    Widget? label,
    Widget? startContent,
    Widget? endContent,
    Widget? thumbIcon,
    bool isDisabled = false,
    bool isReadOnly = false,
    String? value,
    String? name,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return NextSwitch(
      key: key,
      isSelected: isSelected,
      defaultSelected: defaultSelected,
      onChanged: onChanged,
      onValueChange: onValueChange,
      size: SwitchSize.lg,
      color: color,
      label: label,
      startContent: startContent,
      endContent: endContent,
      thumbIcon: thumbIcon,
      isDisabled: isDisabled,
      isReadOnly: isReadOnly,
      value: value,
      name: name,
      margin: margin,
      padding: padding,
    );
  }
}

class _NextSwitchState extends State<NextSwitch> {
  late bool _isSelected;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected ?? widget.defaultSelected;
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(NextSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != null && widget.isSelected != _isSelected) {
      _isSelected = widget.isSelected!;
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(bool value) {
    if (widget.isDisabled || widget.isReadOnly) return;

    setState(() {
      _isSelected = value;
    });

    widget.onChanged?.call(value);
    widget.onValueChange?.call(value);
  }

  Color _getActiveColor(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (widget.color) {
      case SwitchColor.defaultColor:
        return colorScheme.outline;
      case SwitchColor.primary:
        return colorScheme.primary;
      case SwitchColor.secondary:
        return colorScheme.secondary;
      case SwitchColor.success:
        return Colors.green;
      case SwitchColor.warning:
        return Colors.orange;
      case SwitchColor.danger:
        return colorScheme.error;
    }
  }

  double _getSwitchScale() {
    switch (widget.size) {
      case SwitchSize.sm:
        return 0.8;
      case SwitchSize.md:
        return 1;
      case SwitchSize.lg:
        return 1.2;
    }
  }

  EdgeInsetsGeometry _getContentPadding() {
    switch (widget.size) {
      case SwitchSize.sm:
        return const EdgeInsets.all(4);
      case SwitchSize.md:
        return const EdgeInsets.all(6);
      case SwitchSize.lg:
        return const EdgeInsets.all(8);
    }
  }

  Widget _buildSwitch(BuildContext context) {
    final activeColor = _getActiveColor(context);
    final switchScale = _getSwitchScale();

    Widget switchWidget = Transform.scale(
      scale: switchScale,
      child: Switch(
        value: _isSelected,
        onChanged:
            widget.isDisabled || widget.isReadOnly ? null : _handleChanged,
        activeColor: activeColor,
        activeTrackColor: activeColor.withValues(alpha: 0.5),
        inactiveThumbColor: Theme.of(context).colorScheme.outline,
        inactiveTrackColor:
            Theme.of(context).colorScheme.surfaceContainerHighest,
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );

    // Add thumb icon if provided
    if (widget.thumbIcon != null) {
      switchWidget = Stack(
        alignment: Alignment.center,
        children: [
          switchWidget,
          if (_isSelected)
            Positioned(
              right: switchScale * 4,
              child: IgnorePointer(
                child: Transform.scale(
                  scale: switchScale * 0.6,
                  child: widget.thumbIcon,
                ),
              ),
            )
          else
            Positioned(
              left: switchScale * 4,
              child: IgnorePointer(
                child: Transform.scale(
                  scale: switchScale * 0.6,
                  child: widget.thumbIcon,
                ),
              ),
            ),
        ],
      );
    }

    return switchWidget;
  }

  @override
  Widget build(BuildContext context) {
    final switch_ = _buildSwitch(context);

    // If no additional content, return just the switch
    if (widget.label == null &&
        widget.startContent == null &&
        widget.endContent == null) {
      return Container(
        margin: widget.margin,
        padding: widget.padding,
        child: switch_,
      );
    }

    // Build complete switch with content
    final children = <Widget>[];

    // Add start content
    if (widget.startContent != null) {
      children
        ..add(widget.startContent!)
        ..add(SizedBox(width: _getContentPadding().horizontal / 2));
    }

    // Add the switch
    children.add(switch_);

    // Add spacing if there's a label or end content
    if (widget.label != null || widget.endContent != null) {
      children.add(SizedBox(width: _getContentPadding().horizontal / 2));
    }

    // Add label
    if (widget.label != null) {
      children.add(
        Expanded(
          child: GestureDetector(
            onTap: widget.isDisabled || widget.isReadOnly
                ? null
                : () => _handleChanged(!_isSelected),
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.isDisabled
                        ? Theme.of(context).disabledColor
                        : null,
                  ),
              child: widget.label!,
            ),
          ),
        ),
      );
    }

    // Add end content
    if (widget.endContent != null) {
      if (widget.label == null) {
        children.add(SizedBox(width: _getContentPadding().horizontal / 2));
      }
      children.add(widget.endContent!);
    }

    return Container(
      margin: widget.margin,
      padding: widget.padding ?? _getContentPadding(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
