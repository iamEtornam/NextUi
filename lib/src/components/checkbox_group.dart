import 'package:flutter/material.dart';
import 'package:next_ui/src/base/colors.dart';
import 'package:next_ui/src/base/enums.dart';
import 'package:next_ui/src/components/checkbox.dart';

/// A validation error type for checkbox groups
class ValidationError {
  /// Creates a validation error with the given message
  const ValidationError(this.message);

  /// The error message
  final String message;
}

/// A validation result containing either an error or success
class ValidationResult {
  /// Creates a validation result
  const ValidationResult({this.error, this.isValid = true});

  /// Creates a validation result with an error
  factory ValidationResult.error(String message) =>
      ValidationResult(error: ValidationError(message), isValid: false);

  /// Creates a successful validation result
  factory ValidationResult.success() => const ValidationResult();

  /// The validation error if any
  final ValidationError? error;

  /// Whether the validation passed
  final bool isValid;
}

/// A checkbox group widget that allows users to select one or more items
/// from a list of choices.
///
/// The CheckboxGroup component provides a convenient way to group related
/// checkboxes together with shared styling, validation, and state management.
///
/// Example:
/// ```dart
/// NextCheckboxGroup(
///   label: 'Select your interests',
///   children: [
///     NextCheckbox(
///       value: 'sports',
///       children: Text('Sports'),
///     ),
///     NextCheckbox(
///       value: 'music',
///       children: Text('Music'),
///     ),
///   ],
///   onValueChange: (List<String> values) {
///     print('Selected values: $values');
///   },
/// )
/// ```
class NextCheckboxGroup extends StatefulWidget {
  /// Creates a Next UI checkbox group component
  const NextCheckboxGroup({
    required this.children,
    super.key,
    this.orientation = CheckboxGroupOrientation.vertical,
    this.color = CheckboxColor.primary,
    this.size = CheckboxSize.md,
    this.radius = CheckboxRadius.sm,
    this.name,
    this.label,
    this.value,
    this.lineThrough = false,
    this.defaultValue,
    this.isInvalid = false,
    this.validationState,
    this.description,
    this.errorMessage,
    this.validate,
    this.validationBehavior = ValidationBehavior.native,
    this.isDisabled = false,
    this.isRequired = false,
    this.isReadOnly = false,
    this.disableAnimation = false,
    this.classNames,
    this.onValueChange,
    this.onChange,
  });

  /// The list of checkbox widgets to display
  final List<Widget> children;

  /// The orientation of the checkbox group
  final CheckboxGroupOrientation orientation;

  /// The color theme for all checkboxes in the group
  final CheckboxColor color;

  /// The size for all checkboxes in the group
  final CheckboxSize size;

  /// The border radius for all checkboxes in the group
  final CheckboxRadius radius;

  /// The name attribute for form submission
  final String? name;

  /// The label text for the checkbox group
  final String? label;

  /// The current selected values (controlled)
  final List<String>? value;

  /// Whether to show line through on checked items
  final bool lineThrough;

  /// The default selected values (uncontrolled)
  final List<String>? defaultValue;

  /// Whether the checkbox group is invalid
  final bool isInvalid;

  /// The validation state of the checkbox group
  final ValidationState? validationState;

  /// Description text to show below the label
  final Widget? description;

  /// Error message to show when validation fails
  final Widget? errorMessage;

  /// Function to validate the current selection
  final ValidationResult Function(List<String>)? validate;

  /// Validation behavior for the checkbox group
  final ValidationBehavior validationBehavior;

  /// Whether the entire group is disabled
  final bool isDisabled;

  /// Whether the checkbox group is required
  final bool isRequired;

  /// Whether the checkbox group is read-only
  final bool isReadOnly;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Custom CSS classes for different parts of the checkbox group
  final Map<String, String>? classNames;

  /// Callback when the selection changes (React-style)
  final ValueChanged<List<String>>? onValueChange;

  /// Callback when the selection changes (Flutter-style)
  final ValueChanged<List<String>>? onChange;

  @override
  State<NextCheckboxGroup> createState() => _NextCheckboxGroupState();
}

class _NextCheckboxGroupState extends State<NextCheckboxGroup> {
  late List<String> _selectedValues;
  ValidationResult? _validationResult;

  @override
  void initState() {
    super.initState();
    _selectedValues = List.from(widget.value ?? widget.defaultValue ?? []);
    _validateSelection();
  }

  @override
  void didUpdateWidget(NextCheckboxGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null && widget.value != _selectedValues) {
      _selectedValues = List.from(widget.value!);
      _validateSelection();
    }
  }

  void _validateSelection() {
    if (widget.validate != null) {
      _validationResult = widget.validate!(_selectedValues);
    } else {
      _validationResult = ValidationResult.success();
    }
  }

  void _handleValueChange(String checkboxValue, {required bool isSelected}) {
    if (widget.isDisabled || widget.isReadOnly) return;

    setState(() {
      if (isSelected) {
        if (!_selectedValues.contains(checkboxValue)) {
          _selectedValues.add(checkboxValue);
        }
      } else {
        _selectedValues.remove(checkboxValue);
      }
    });

    _validateSelection();
    widget.onValueChange?.call(_selectedValues);
    widget.onChange?.call(_selectedValues);
  }

  bool _isInvalid() {
    return widget.isInvalid ||
        widget.validationState == ValidationState.invalid ||
        (_validationResult?.isValid == false);
  }

  Widget _buildCheckboxes() {
    return _CheckboxGroupInheritance(
      selectedValues: _selectedValues,
      color: widget.color,
      size: widget.size,
      radius: widget.radius,
      lineThrough: widget.lineThrough,
      isDisabled: widget.isDisabled,
      isReadOnly: widget.isReadOnly,
      disableAnimation: widget.disableAnimation,
      isInvalid: _isInvalid(),
      onValueChange: _handleValueChange,
      child: widget.orientation == CheckboxGroupOrientation.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            )
          : Wrap(
              spacing: 16,
              runSpacing: 8,
              children: widget.children,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isInvalid = _isInvalid();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isInvalid
                  ? NextUiColors.danger.shade500
                  : widget.isDisabled
                      ? Colors.grey.shade400
                      : null,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Description
        if (widget.description != null) ...[
          DefaultTextStyle(
            style: theme.textTheme.bodySmall?.copyWith(
                  color: widget.isDisabled
                      ? Colors.grey.shade400
                      : Colors.grey.shade600,
                ) ??
                const TextStyle(),
            child: widget.description!,
          ),
          const SizedBox(height: 12),
        ],

        // Checkboxes
        _buildCheckboxes(),

        // Error Message
        if (isInvalid &&
            (widget.errorMessage != null ||
                _validationResult?.error != null)) ...[
          const SizedBox(height: 8),
          DefaultTextStyle(
            style: theme.textTheme.bodySmall?.copyWith(
                  color: NextUiColors.danger.shade500,
                ) ??
                const TextStyle(),
            child: widget.errorMessage ??
                Text(
                  _validationResult?.error?.message ?? 'Invalid selection',
                ),
          ),
        ],
      ],
    );
  }
}

/// Inherited widget to share checkbox group properties with child checkboxes
class _CheckboxGroupInheritance extends InheritedWidget {
  /// Creates a checkbox group inheritance widget
  const _CheckboxGroupInheritance({
    required this.selectedValues,
    required this.color,
    required this.size,
    required this.radius,
    required this.lineThrough,
    required this.isDisabled,
    required this.isReadOnly,
    required this.disableAnimation,
    required this.isInvalid,
    required this.onValueChange,
    required super.child,
  });

  /// The currently selected values
  final List<String> selectedValues;

  /// The color theme for checkboxes
  final CheckboxColor color;

  /// The size for checkboxes
  final CheckboxSize size;

  /// The border radius for checkboxes
  final CheckboxRadius radius;

  /// Whether to show line through when checked
  final bool lineThrough;

  /// Whether checkboxes are disabled
  final bool isDisabled;

  /// Whether checkboxes are read-only
  final bool isReadOnly;

  /// Whether animations are disabled
  final bool disableAnimation;

  /// Whether the group is in an invalid state
  final bool isInvalid;

  /// Callback when a checkbox value changes
  final void Function(String value, {required bool isSelected}) onValueChange;

  /// Gets the nearest checkbox group inheritance data
  static _CheckboxGroupInheritance? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_CheckboxGroupInheritance>();
  }

  @override
  bool updateShouldNotify(_CheckboxGroupInheritance oldWidget) {
    return selectedValues != oldWidget.selectedValues ||
        color != oldWidget.color ||
        size != oldWidget.size ||
        radius != oldWidget.radius ||
        lineThrough != oldWidget.lineThrough ||
        isDisabled != oldWidget.isDisabled ||
        isReadOnly != oldWidget.isReadOnly ||
        disableAnimation != oldWidget.disableAnimation ||
        isInvalid != oldWidget.isInvalid;
  }
}

/// A checkbox widget that automatically integrates with NextCheckboxGroup
class NextGroupCheckbox extends StatelessWidget {
  /// Creates a checkbox that integrates with a checkbox group
  const NextGroupCheckbox({
    required this.value,
    super.key,
    this.children,
    this.icon,
    this.isDisabled,
    this.isReadOnly,
    this.description,
  });

  /// The value of this checkbox
  final String value;

  /// The content to display next to the checkbox
  final Widget? children;

  /// Custom icon widget for the checkbox
  final Widget? icon;

  /// Whether this specific checkbox is disabled
  final bool? isDisabled;

  /// Whether this specific checkbox is read-only
  final bool? isReadOnly;

  /// Description text for this checkbox
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    final groupData = _CheckboxGroupInheritance.of(context);

    if (groupData == null) {
      // If not in a group, render as a regular checkbox
      return NextCheckbox(
        value: value,
        icon: icon,
        isDisabled: isDisabled ?? false,
        isReadOnly: isReadOnly ?? false,
        children: children,
      );
    }

    final isSelected = groupData.selectedValues.contains(value);
    final isCheckboxDisabled = isDisabled ?? groupData.isDisabled;
    final isCheckboxReadOnly = isReadOnly ?? groupData.isReadOnly;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NextCheckbox(
          value: value,
          icon: icon,
          isSelected: isSelected,
          color: groupData.color,
          size: groupData.size,
          radius: groupData.radius,
          lineThrough: groupData.lineThrough,
          isDisabled: isCheckboxDisabled,
          isReadOnly: isCheckboxReadOnly,
          disableAnimation: groupData.disableAnimation,
          isInvalid: groupData.isInvalid,
          onValueChange: (bool newValue) {
            groupData.onValueChange(value, isSelected: newValue);
          },
          children: children,
        ),
        if (description != null) ...[
          const SizedBox(height: 4),
          Padding(
            padding:
                const EdgeInsets.only(left: 28), // Align with checkbox text
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isCheckboxDisabled
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ) ??
                  const TextStyle(),
              child: description!,
            ),
          ),
        ],
      ],
    );
  }
}
