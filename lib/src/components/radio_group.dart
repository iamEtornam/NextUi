import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI RadioGroup component
///
/// Radio Groups allow users to select a single option from a list of mutually exclusive options.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// RadioGroup(
///   children: [
///     NextRadio(value: 'option1', child: Text('Option 1')),
///     NextRadio(value: 'option2', child: Text('Option 2')),
///     NextRadio(value: 'option3', child: Text('Option 3')),
///   ],
/// )
/// ```
///
/// ## With Label and Description
///
/// ```dart
/// RadioGroup(
///   label: Text('Select your favorite framework'),
///   description: Text('Choose the one you like most'),
///   children: [
///     NextRadio(
///       value: 'react',
///       label: Text('React'),
///       description: Text('A JavaScript library for building user interfaces'),
///     ),
///     NextRadio(
///       value: 'vue',
///       label: Text('Vue'),
///       description: Text('The progressive JavaScript framework'),
///     ),
///   ],
/// )
/// ```
///
/// ## Controlled
///
/// ```dart
/// RadioGroup(
///   value: selectedValue,
///   onValueChange: (value) => setState(() => selectedValue = value),
///   children: [
///     NextRadio(value: 'option1', child: Text('Option 1')),
///     NextRadio(value: 'option2', child: Text('Option 2')),
///   ],
/// )
/// ```
///
/// ## Horizontal Layout
///
/// ```dart
/// RadioGroup(
///   orientation: RadioGroupOrientation.horizontal,
///   children: [
///     NextRadio(value: 'yes', child: Text('Yes')),
///     NextRadio(value: 'no', child: Text('No')),
///   ],
/// )
/// ```
///
/// ## Colors and Sizes
///
/// ```dart
/// RadioGroup(
///   color: RadioColor.primary,
///   size: RadioSize.lg,
///   children: [
///     NextRadio(value: 'option1', child: Text('Large Primary')),
///     NextRadio(value: 'option2', child: Text('Another Option')),
///   ],
/// )
/// ```
class RadioGroup extends StatefulWidget {
  /// Creates a Next UI RadioGroup
  const RadioGroup({
    required this.children,
    super.key,
    this.label,
    this.description,
    this.errorMessage,
    this.value,
    this.defaultValue,
    this.onValueChange,
    this.onChange,
    this.size = RadioSize.md,
    this.color = RadioColor.primary,
    this.orientation = RadioGroupOrientation.vertical,
    this.name,
    this.isDisabled = false,
    this.isRequired = false,
    this.isReadOnly = false,
    this.isInvalid = false,
    this.validationState,
    this.disableAnimation = false,
  });

  /// List of NextRadio widgets
  final List<NextRadio> children;

  /// Label for the radio group
  final Widget? label;

  /// Description text for the radio group
  final Widget? description;

  /// Error message for validation
  final Widget? errorMessage;

  /// Current selected value (controlled)
  final String? value;

  /// Default selected value (uncontrolled)
  final String? defaultValue;

  /// Callback when value changes
  final ValueChanged<String?>? onValueChange;

  /// Native change event callback
  final ValueChanged<String?>? onChange;

  /// Size of radio buttons
  final RadioSize size;

  /// Color theme for radio buttons
  final RadioColor color;

  /// Layout orientation
  final RadioGroupOrientation orientation;

  /// Name attribute for form integration
  final String? name;

  /// Whether the entire group is disabled
  final bool isDisabled;

  /// Whether selection is required
  final bool isRequired;

  /// Whether the group is read-only
  final bool isReadOnly;

  /// Whether the group is in invalid state
  final bool isInvalid;

  /// Explicit validation state
  final ValidationState? validationState;

  /// Whether to disable animations
  final bool disableAnimation;

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String? _internalValue;

  String? get _currentValue => widget.value ?? _internalValue;

  @override
  void initState() {
    super.initState();
    _internalValue = widget.defaultValue;
  }

  void _handleValueChange(String? newValue) {
    if (widget.isDisabled || widget.isReadOnly) return;

    if (widget.value == null) {
      setState(() {
        _internalValue = newValue;
      });
    }

    widget.onValueChange?.call(newValue);
    widget.onChange?.call(newValue);
  }

  bool get _isInvalid {
    return widget.isInvalid ||
        widget.validationState == ValidationState.invalid;
  }

  @override
  Widget build(BuildContext context) {
    final isHorizontal = widget.orientation == RadioGroupOrientation.horizontal;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          DefaultTextStyle(
            style: TextStyle(
              fontSize: _getLabelFontSize(),
              fontWeight: FontWeight.w500,
              color: widget.isDisabled ? Colors.grey : Colors.black87,
            ),
            child: widget.label!,
          ),
          const SizedBox(height: 8),
        ],

        // Radio buttons container
        if (isHorizontal)
          Row(
            children: _buildRadioChildren(),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildRadioChildren(),
          ),

        // Description
        if (widget.description != null) ...[
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: _getDescriptionFontSize(),
              color: widget.isDisabled ? Colors.grey : Colors.black54,
            ),
            child: widget.description!,
          ),
        ],

        // Error message
        if (widget.errorMessage != null && _isInvalid) ...[
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: _getDescriptionFontSize(),
              color: NextUiColors.danger,
            ),
            child: widget.errorMessage!,
          ),
        ],
      ],
    );
  }

  List<Widget> _buildRadioChildren() {
    final isHorizontal = widget.orientation == RadioGroupOrientation.horizontal;
    final children = <Widget>[];

    for (var i = 0; i < widget.children.length; i++) {
      final radio = widget.children[i];

      children.add(
        _RadioInheritance(
          groupValue: _currentValue,
          onChanged: _handleValueChange,
          size: widget.size,
          color: widget.color,
          isGroupDisabled: widget.isDisabled,
          isGroupReadOnly: widget.isReadOnly,
          isGroupInvalid: _isInvalid,
          disableAnimation: widget.disableAnimation,
          name: widget.name,
          child: radio,
        ),
      );

      // Add spacing between radio buttons
      if (i < widget.children.length - 1) {
        children.add(
          SizedBox(
            width: isHorizontal ? _getSpacing() : 0,
            height: isHorizontal ? 0 : _getSpacing(),
          ),
        );
      }
    }

    return children;
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case RadioSize.sm:
        return 14;
      case RadioSize.md:
        return 16;
      case RadioSize.lg:
        return 18;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case RadioSize.sm:
        return 12;
      case RadioSize.md:
        return 14;
      case RadioSize.lg:
        return 16;
    }
  }

  double _getSpacing() {
    switch (widget.size) {
      case RadioSize.sm:
        return 8;
      case RadioSize.md:
        return 12;
      case RadioSize.lg:
        return 16;
    }
  }
}

/// Next UI Radio component
///
/// Individual radio button that must be used within a RadioGroup.
class NextRadio extends StatelessWidget {
  /// Creates a Next UI Radio
  const NextRadio({
    required this.value,
    super.key,
    this.child,
    this.label,
    this.description,
    this.isDisabled = false,
    this.isRequired = false,
    this.isReadOnly = false,
    this.isInvalid = false,
    this.disableAnimation = false,
  });

  /// Value that this radio represents
  final String value;

  /// Main content (typically text)
  final Widget? child;

  /// Alternative to child - explicit label
  final Widget? label;

  /// Description text below the radio
  final Widget? description;

  /// Whether this radio is disabled
  final bool isDisabled;

  /// Whether this radio is required
  final bool isRequired;

  /// Whether this radio is read-only
  final bool isReadOnly;

  /// Whether this radio is in invalid state
  final bool isInvalid;

  /// Whether to disable animations
  final bool disableAnimation;

  @override
  Widget build(BuildContext context) {
    final inheritance = _RadioInheritance.of(context);
    if (inheritance == null) {
      throw FlutterError(
        'Radio must be used within a RadioGroup.\n'
        'Make sure this Radio widget is a child of a RadioGroup widget.',
      );
    }

    final isSelected = inheritance.groupValue == value;
    final effectiveDisabled = isDisabled || inheritance.isGroupDisabled;
    final effectiveReadOnly = isReadOnly || inheritance.isGroupReadOnly;
    final effectiveInvalid = isInvalid || inheritance.isGroupInvalid;

    return GestureDetector(
      onTap: (effectiveDisabled || effectiveReadOnly)
          ? null
          : () => inheritance.onChanged(value),
      child: MouseRegion(
        cursor: (effectiveDisabled || effectiveReadOnly)
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio control
            Container(
              width: _getControlSize(inheritance.size),
              height: _getControlSize(inheritance.size),
              margin:
                  EdgeInsets.only(top: _getControlMarginTop(inheritance.size)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getBorderColor(
                    isSelected,
                    effectiveDisabled,
                    effectiveInvalid,
                    inheritance.color,
                  ),
                  width: isSelected ? 2 : 1,
                ),
                color: isSelected
                    ? _getSelectedColor(effectiveDisabled, inheritance.color)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: _getInnerDotSize(inheritance.size),
                        height: _getInnerDotSize(inheritance.size),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getInnerDotColor(effectiveDisabled),
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 8),

            // Label and description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Main label
                  if (child != null || label != null)
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: _getLabelFontSize(inheritance.size),
                        fontWeight: FontWeight.w400,
                        color: effectiveDisabled ? Colors.grey : Colors.black87,
                      ),
                      child: child ?? label!,
                    ),

                  // Description
                  if (description != null) ...[
                    const SizedBox(height: 2),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: _getDescriptionFontSize(inheritance.size),
                        color: effectiveDisabled ? Colors.grey : Colors.black54,
                      ),
                      child: description!,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getControlSize(RadioSize size) {
    switch (size) {
      case RadioSize.sm:
        return 16;
      case RadioSize.md:
        return 20;
      case RadioSize.lg:
        return 24;
    }
  }

  double _getControlMarginTop(RadioSize size) {
    switch (size) {
      case RadioSize.sm:
        return 1;
      case RadioSize.md:
        return 2;
      case RadioSize.lg:
        return 3;
    }
  }

  double _getInnerDotSize(RadioSize size) {
    switch (size) {
      case RadioSize.sm:
        return 6;
      case RadioSize.md:
        return 8;
      case RadioSize.lg:
        return 10;
    }
  }

  double _getLabelFontSize(RadioSize size) {
    switch (size) {
      case RadioSize.sm:
        return 14;
      case RadioSize.md:
        return 16;
      case RadioSize.lg:
        return 18;
    }
  }

  double _getDescriptionFontSize(RadioSize size) {
    switch (size) {
      case RadioSize.sm:
        return 12;
      case RadioSize.md:
        return 14;
      case RadioSize.lg:
        return 16;
    }
  }

  Color _getBorderColor(
    bool isSelected,
    bool isDisabled,
    bool isInvalid,
    RadioColor color,
  ) {
    if (isDisabled) {
      return Colors.grey.shade300;
    }

    if (isInvalid) {
      return NextUiColors.danger;
    }

    if (isSelected) {
      return _getBaseColor(color);
    }

    return Colors.grey.shade400;
  }

  Color _getSelectedColor(bool isDisabled, RadioColor color) {
    if (isDisabled) {
      return Colors.grey.shade300;
    }

    return _getBaseColor(color);
  }

  Color _getInnerDotColor(bool isDisabled) {
    return isDisabled ? Colors.grey.shade500 : Colors.white;
  }

  Color _getBaseColor(RadioColor color) {
    switch (color) {
      case RadioColor.defaultColor:
        return const Color(0xFF71717a); // zinc-500
      case RadioColor.primary:
        return NextUiColors.primary;
      case RadioColor.secondary:
        return NextUiColors.secondary;
      case RadioColor.success:
        return NextUiColors.success;
      case RadioColor.warning:
        return NextUiColors.warning;
      case RadioColor.danger:
        return NextUiColors.danger;
    }
  }
}

/// InheritedWidget for passing RadioGroup properties to Radio children
class _RadioInheritance extends InheritedWidget {
  const _RadioInheritance({
    required this.groupValue,
    required this.onChanged,
    required this.size,
    required this.color,
    required this.isGroupDisabled,
    required this.isGroupReadOnly,
    required this.isGroupInvalid,
    required this.disableAnimation,
    required this.name,
    required super.child,
  });

  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final RadioSize size;
  final RadioColor color;
  final bool isGroupDisabled;
  final bool isGroupReadOnly;
  final bool isGroupInvalid;
  final bool disableAnimation;
  final String? name;

  static _RadioInheritance? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_RadioInheritance>();
  }

  @override
  bool updateShouldNotify(_RadioInheritance oldWidget) {
    return groupValue != oldWidget.groupValue ||
        size != oldWidget.size ||
        color != oldWidget.color ||
        isGroupDisabled != oldWidget.isGroupDisabled ||
        isGroupReadOnly != oldWidget.isGroupReadOnly ||
        isGroupInvalid != oldWidget.isGroupInvalid ||
        disableAnimation != oldWidget.disableAnimation ||
        name != oldWidget.name;
  }
}
