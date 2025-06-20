import 'package:flutter/material.dart';
import 'package:next_ui/src/base/colors.dart';
import 'package:next_ui/src/base/enums.dart';

/// A customizable checkbox widget following HeroUI design principles.
///
/// Checkboxes allow users to select multiple items from a list of
/// individual items, or to mark one individual item as selected.
///
/// Example:
/// ```dart
/// NextCheckbox(
///   children: Text('Accept terms and conditions'),
///   onValueChange: (bool? value) {
///     print('Checkbox value: $value');
///   },
/// )
/// ```
class NextCheckbox extends StatefulWidget {
  /// Creates a Next UI checkbox component
  const NextCheckbox({
    super.key,
    this.children,
    this.icon,
    this.value,
    this.name,
    this.size = CheckboxSize.md,
    this.color = CheckboxColor.primary,
    this.radius = CheckboxRadius.sm,
    this.lineThrough = false,
    this.isSelected,
    this.defaultSelected,
    this.isRequired = false,
    this.isReadOnly = false,
    this.isDisabled = false,
    this.isIndeterminate = false,
    this.isInvalid = false,
    this.validationState,
    this.disableAnimation = false,
    this.classNames,
    this.onValueChange,
    this.onChanged,
  });

  /// The content to display next to the checkbox
  final Widget? children;

  /// Custom icon widget for the checkbox
  final Widget? icon;

  /// The value of the checkbox when used in forms
  final String? value;

  /// The name of the checkbox when used in forms
  final String? name;

  /// The size of the checkbox
  final CheckboxSize size;

  /// The color theme of the checkbox
  final CheckboxColor color;

  /// The border radius of the checkbox
  final CheckboxRadius radius;

  /// Whether to show line through when checked
  final bool lineThrough;

  /// Whether the checkbox is currently selected
  final bool? isSelected;

  /// The default selected state (uncontrolled)
  final bool? defaultSelected;

  /// Whether the checkbox is required
  final bool isRequired;

  /// Whether the checkbox is read-only
  final bool isReadOnly;

  /// Whether the checkbox is disabled
  final bool isDisabled;

  /// Whether the checkbox is in indeterminate state
  final bool isIndeterminate;

  /// Whether the checkbox is invalid
  final bool isInvalid;

  /// The validation state of the checkbox
  final ValidationState? validationState;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Custom CSS classes for different parts of the checkbox
  final Map<String, String>? classNames;

  /// Callback when the checkbox value changes (React-style)
  final ValueChanged<bool>? onValueChange;

  /// Callback when the checkbox value changes (Flutter-style)
  final ValueChanged<bool?>? onChanged;

  @override
  State<NextCheckbox> createState() => _NextCheckboxState();
}

class _NextCheckboxState extends State<NextCheckbox>
    with TickerProviderStateMixin {
  late bool _isSelected;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected ?? widget.defaultSelected ?? false;

    _animationController = AnimationController(
      duration: widget.disableAnimation
          ? Duration.zero
          : const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (_isSelected || widget.isIndeterminate) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(NextCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected != null && widget.isSelected != _isSelected) {
      _isSelected = widget.isSelected!;
      if (_isSelected || widget.isIndeterminate) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleValueChange(bool? value) {
    if (widget.isDisabled || widget.isReadOnly) return;

    final newValue = value ?? false;
    if (widget.isSelected == null) {
      setState(() {
        _isSelected = newValue;
      });
    }

    if (newValue || widget.isIndeterminate) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    widget.onValueChange?.call(newValue);
    widget.onChanged?.call(newValue);
  }

  MaterialColor _getColorScheme() {
    switch (widget.color) {
      case CheckboxColor.primary:
        return NextUiColors.primary;
      case CheckboxColor.secondary:
        return NextUiColors.secondary;
      case CheckboxColor.success:
        return NextUiColors.success;
      case CheckboxColor.warning:
        return NextUiColors.warning;
      case CheckboxColor.danger:
        return NextUiColors.danger;
      case CheckboxColor.defaultColor:
        return NextUiColors.primary;
    }
  }

  double _getSizeValue() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return 16;
      case CheckboxSize.md:
        return 20;
      case CheckboxSize.lg:
        return 24;
    }
  }

  BorderRadius _getBorderRadius() {
    final radiusValue = switch (widget.radius) {
      CheckboxRadius.none => 0.0,
      CheckboxRadius.sm => 4.0,
      CheckboxRadius.md => 6.0,
      CheckboxRadius.lg => 8.0,
      CheckboxRadius.full => _getSizeValue() / 2,
    };
    return BorderRadius.circular(radiusValue);
  }

  Widget _buildCheckIcon() {
    if (widget.icon != null) {
      return widget.icon!;
    }

    if (widget.isIndeterminate) {
      return Container(
        width: _getSizeValue() * 0.6,
        height: 2,
        decoration: BoxDecoration(
          color: widget.isDisabled ? Colors.grey.shade400 : Colors.white,
          borderRadius: BorderRadius.circular(1),
        ),
      );
    }

    return Icon(
      Icons.check,
      size: _getSizeValue() * 0.8,
      color: widget.isDisabled ? Colors.grey.shade400 : Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme();
    final size = _getSizeValue();
    final isChecked = _isSelected || widget.isIndeterminate;
    final isInvalid =
        widget.isInvalid || widget.validationState == ValidationState.invalid;

    return MouseRegion(
      cursor: widget.isDisabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _handleValueChange(!_isSelected),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox wrapper
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: isChecked
                    ? (widget.isDisabled
                        ? Colors.grey.shade300
                        : colorScheme.shade500)
                    : Colors.transparent,
                border: Border.all(
                  color: isInvalid
                      ? NextUiColors.danger.shade500
                      : isChecked
                          ? (widget.isDisabled
                              ? Colors.grey.shade300
                              : colorScheme.shade500)
                          : (widget.isDisabled
                              ? Colors.grey.shade300
                              : Colors.grey.shade400),
                  width: 2,
                ),
                borderRadius: _getBorderRadius(),
              ),
              child: isChecked
                  ? AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Opacity(
                            opacity: _opacityAnimation.value,
                            child: _buildCheckIcon(),
                          ),
                        );
                      },
                    )
                  : null,
            ),

            // Label
            if (widget.children != null) ...[
              const SizedBox(width: 8),
              Flexible(
                child: DefaultTextStyle(
                  style: TextStyle(
                    decoration: widget.lineThrough && isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: widget.isDisabled
                        ? Colors.grey.shade400
                        : isInvalid
                            ? NextUiColors.danger.shade500
                            : null,
                  ),
                  child: widget.children!,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Extension to provide data attributes information for styling and testing
extension NextCheckboxDataAttributes on NextCheckbox {
  /// Data attributes that would be present on the checkbox element
  Map<String, bool> get dataAttributes => {
        'data-selected': isSelected ?? defaultSelected ?? false,
        'data-invalid': isInvalid || validationState == ValidationState.invalid,
        'data-readonly': isReadOnly,
        'data-indeterminate': isIndeterminate,
        'data-disabled': isDisabled,
        'data-required': isRequired,
      };
}
