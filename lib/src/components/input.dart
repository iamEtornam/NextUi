import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_ui/src/base/enums.dart';

/// A customizable input component for text entry.
///
/// Based on HeroUI Input component design.
class NextInput extends StatefulWidget {
  /// Creates an input component.
  const NextInput({
    super.key,
    this.controller,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onTapOutside,
    this.onClear,
    this.focusNode,
    this.variant = InputVariant.flat,
    this.color = InputColor.defaultColor,
    this.size = InputSize.md,
    this.radius = InputRadius.md,
    this.labelPlacement = LabelPlacement.inside,
    this.label,
    this.placeholder,
    this.description,
    this.errorMessage,
    this.startContent,
    this.endContent,
    this.isRequired = false,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isInvalid = false,
    this.isClearable = false,
    this.obscureText = false,
    this.fullWidth = true,
    this.disableAnimation = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textAlignVertical,
    this.expands = false,
    this.padding,
    this.margin,
    this.width,
    this.height,
  });

  /// Text editing controller
  final TextEditingController? controller;

  /// Current text value
  final String? value;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the text
  final ValueChanged<String>? onSubmitted;

  /// Called when the input is tapped
  final VoidCallback? onTap;

  /// Called when tapped outside the input
  final TapRegionCallback? onTapOutside;

  /// Called when clear button is pressed
  final VoidCallback? onClear;

  /// Focus node for the input
  final FocusNode? focusNode;

  /// Visual variant of the input
  final InputVariant variant;

  /// Color theme of the input
  final InputColor color;

  /// Size of the input
  final InputSize size;

  /// Border radius of the input
  final InputRadius radius;

  /// Placement of the label
  final LabelPlacement labelPlacement;

  /// Label text
  final String? label;

  /// Placeholder text
  final String? placeholder;

  /// Description text below the input
  final String? description;

  /// Error message text
  final String? errorMessage;

  /// Widget at the start of the input
  final Widget? startContent;

  /// Widget at the end of the input
  final Widget? endContent;

  /// Whether the input is required
  final bool isRequired;

  /// Whether the input is disabled
  final bool isDisabled;

  /// Whether the input is read-only
  final bool isReadOnly;

  /// Whether the input is in an invalid state
  final bool isInvalid;

  /// Whether to show a clear button
  final bool isClearable;

  /// Whether to obscure the text (for passwords)
  final bool obscureText;

  /// Whether the input should take full width
  final bool fullWidth;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum character length
  final int? maxLength;

  /// Type of action button on the keyboard
  final TextInputAction? textInputAction;

  /// Type of keyboard to display
  final TextInputType? keyboardType;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Text capitalization behavior
  final TextCapitalization textCapitalization;

  /// Text alignment
  final TextAlign textAlign;

  /// Whether to focus automatically
  final bool autofocus;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  /// Vertical alignment of text
  final TextAlignVertical? textAlignVertical;

  /// Whether the input expands to fill its parent
  final bool expands;

  /// Internal padding
  final EdgeInsetsGeometry? padding;

  /// External margin
  final EdgeInsetsGeometry? margin;

  /// Fixed width
  final double? width;

  /// Fixed height
  final double? height;

  @override
  State<NextInput> createState() => _NextInputState();
}

class _NextInputState extends State<NextInput> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscureText;

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  void _onClear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
  }

  Color _getColorTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (widget.isInvalid) return colorScheme.error;

    switch (widget.color) {
      case InputColor.defaultColor:
        return colorScheme.outline;
      case InputColor.primary:
        return colorScheme.primary;
      case InputColor.secondary:
        return colorScheme.secondary;
      case InputColor.success:
        return Colors.green;
      case InputColor.warning:
        return Colors.orange;
      case InputColor.danger:
        return colorScheme.error;
    }
  }

  double _getInputHeight() {
    switch (widget.size) {
      case InputSize.sm:
        return 32;
      case InputSize.md:
        return 40;
      case InputSize.lg:
        return 48;
    }
  }

  double _getInputPadding() {
    switch (widget.size) {
      case InputSize.sm:
        return 8;
      case InputSize.md:
        return 12;
      case InputSize.lg:
        return 16;
    }
  }

  BorderRadius _getBorderRadius() {
    switch (widget.radius) {
      case InputRadius.none:
        return BorderRadius.zero;
      case InputRadius.sm:
        return BorderRadius.circular(4);
      case InputRadius.md:
        return BorderRadius.circular(8);
      case InputRadius.lg:
        return BorderRadius.circular(12);
      case InputRadius.full:
        return BorderRadius.circular(999);
    }
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colorTheme = _getColorTheme(context);

    String? labelText;
    Widget? label;

    if (widget.label != null) {
      labelText = widget.isRequired ? '${widget.label} *' : widget.label;
      if (widget.labelPlacement == LabelPlacement.inside) {
        label = Text(labelText!);
      }
    }

    Widget? suffixIcon;
    final suffixWidgets = <Widget>[];

    if (widget.isClearable &&
        _controller.text.isNotEmpty &&
        !widget.isReadOnly) {
      suffixWidgets.add(
        IconButton(
          icon: const Icon(Icons.clear, size: 16),
          onPressed: _onClear,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      );
    }

    if (widget.obscureText) {
      suffixWidgets.add(
        IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              size: 16),
          onPressed: () => setState(() => _obscureText = !_obscureText),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      );
    }

    if (widget.endContent != null) {
      suffixWidgets.add(widget.endContent!);
    }

    if (suffixWidgets.isNotEmpty) {
      suffixIcon = Row(
        mainAxisSize: MainAxisSize.min,
        children: suffixWidgets,
      );
    }

    final borderColor = widget.isInvalid ? colorScheme.error : colorTheme;
    var fillColor = colorScheme.surface;

    switch (widget.variant) {
      case InputVariant.flat:
        fillColor = colorScheme.surfaceContainerHighest.withValues(alpha: 0.5);
      case InputVariant.faded:
        fillColor = colorTheme.withValues(alpha: 0.1);
      case InputVariant.bordered:
      case InputVariant.underlined:
        fillColor = Colors.transparent;
    }

    InputBorder border;
    switch (widget.variant) {
      case InputVariant.flat:
      case InputVariant.faded:
        border = OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide.none,
        );
      case InputVariant.bordered:
        border = OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(color: borderColor),
        );
      case InputVariant.underlined:
        border = UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        );
    }

    InputBorder focusedBorder;
    switch (widget.variant) {
      case InputVariant.flat:
      case InputVariant.faded:
        focusedBorder = OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(color: colorTheme, width: 2),
        );
      case InputVariant.bordered:
        focusedBorder = OutlineInputBorder(
          borderRadius: _getBorderRadius(),
          borderSide: BorderSide(color: colorTheme, width: 2),
        );
      case InputVariant.underlined:
        focusedBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: colorTheme, width: 2),
        );
    }

    return InputDecoration(
      labelText:
          widget.labelPlacement == LabelPlacement.inside ? labelText : null,
      hintText: widget.placeholder,
      helperText: widget.description,
      errorText: widget.isInvalid ? widget.errorMessage : null,
      prefixIcon: widget.startContent,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fillColor,
      border: border,
      enabledBorder: border,
      focusedBorder: focusedBorder,
      errorBorder: widget.variant == InputVariant.underlined
          ? UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error))
          : OutlineInputBorder(
              borderRadius: _getBorderRadius(),
              borderSide: BorderSide(color: colorScheme.error),
            ),
      focusedErrorBorder: widget.variant == InputVariant.underlined
          ? UnderlineInputBorder(
              borderSide: BorderSide(color: colorScheme.error, width: 2))
          : OutlineInputBorder(
              borderRadius: _getBorderRadius(),
              borderSide: BorderSide(color: colorScheme.error, width: 2),
            ),
      contentPadding: EdgeInsets.all(_getInputPadding()),
      isDense: widget.size == InputSize.sm,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget inputField = TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      decoration: _buildDecoration(context),
      enabled: !widget.isDisabled,
      readOnly: widget.isReadOnly,
      obscureText: _obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      textAlignVertical: widget.textAlignVertical,
      expands: widget.expands,
    );

    if (widget.labelPlacement == LabelPlacement.outside ||
        widget.labelPlacement == LabelPlacement.outsideLeft) {
      Widget? labelWidget;
      if (widget.label != null) {
        final labelText =
            widget.isRequired ? '${widget.label} *' : widget.label!;
        labelWidget = Text(
          labelText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        );
      }

      if (widget.labelPlacement == LabelPlacement.outsideLeft) {
        inputField = Row(
          children: [
            if (labelWidget != null) ...[
              labelWidget,
              const SizedBox(width: 12),
            ],
            Expanded(child: inputField),
          ],
        );
      } else {
        inputField = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (labelWidget != null) ...[
              labelWidget,
              const SizedBox(height: 8),
            ],
            inputField,
          ],
        );
      }
    }

    return Container(
      margin: widget.margin,
      width: widget.fullWidth ? double.infinity : widget.width,
      height: widget.height,
      child: inputField,
    );
  }
}

/// A specialized input for One-Time Passwords (OTP)
class NextInputOTP extends StatefulWidget {
  /// Creates an OTP input component.
  const NextInputOTP({
    super.key,
    this.length = 6,
    this.onChanged,
    this.onCompleted,
    this.separator,
    this.size = InputSize.md,
    this.color = InputColor.primary,
    this.isDisabled = false,
    this.isInvalid = false,
    this.autoFocus = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
    this.inputFormatters,
    this.spacing = 8.0,
    this.width,
    this.height,
  });

  /// Number of OTP digits
  final int length;

  /// Called when any digit changes
  final ValueChanged<String>? onChanged;

  /// Called when all digits are entered
  final ValueChanged<String>? onCompleted;

  /// Widget to display between input fields
  final Widget? separator;

  /// Size of the input fields
  final InputSize size;

  /// Color theme
  final InputColor color;

  /// Whether the inputs are disabled
  final bool isDisabled;

  /// Whether the inputs are in an invalid state
  final bool isInvalid;

  /// Whether to auto-focus the first field
  final bool autoFocus;

  /// Whether to obscure the text
  final bool obscureText;

  /// Keyboard type
  final TextInputType keyboardType;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Spacing between input fields
  final double spacing;

  /// Fixed width
  final double? width;

  /// Fixed height
  final double? height;

  @override
  State<NextInputOTP> createState() => _NextInputOTPState();
}

class _NextInputOTPState extends State<NextInputOTP> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _value = '';

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());

    // Auto focus first field
    if (widget.autoFocus && _focusNodes.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      // Handle pasted content
      final chars = value.split('');
      for (var i = 0; i < chars.length && (index + i) < widget.length; i++) {
        _controllers[index + i].text = chars[i];
      }
      // Focus the next empty field or the last field
      final nextIndex = (index + chars.length).clamp(0, widget.length - 1);
      _focusNodes[nextIndex].requestFocus();
    } else if (value.isNotEmpty) {
      // Move to next field
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    }

    _updateValue();
  }

  void _onKeyPressed(int index, String value) {
    if (value.isEmpty && index > 0) {
      // Move to previous field on backspace
      _focusNodes[index - 1].requestFocus();
    }
    _updateValue();
  }

  void _updateValue() {
    final newValue = _controllers.map((c) => c.text).join();
    if (newValue != _value) {
      _value = newValue;
      widget.onChanged?.call(_value);

      if (_value.length == widget.length) {
        widget.onCompleted?.call(_value);
      }
    }
  }

  double _getFieldSize() {
    switch (widget.size) {
      case InputSize.sm:
        return 40;
      case InputSize.md:
        return 48;
      case InputSize.lg:
        return 56;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fieldSize = _getFieldSize();

    final children = <Widget>[];
    for (var i = 0; i < widget.length; i++) {
      children.add(
        SizedBox(
          width: fieldSize,
          height: fieldSize,
          child: NextInput(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            onChanged: (value) => _onChanged(i, value),
            textAlign: TextAlign.center,
            keyboardType: widget.keyboardType,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              ...?widget.inputFormatters,
            ],
            isDisabled: widget.isDisabled,
            isInvalid: widget.isInvalid,
            obscureText: widget.obscureText,
            color: widget.color,
            size: widget.size,
            fullWidth: false,
          ),
        ),
      );

      if (i < widget.length - 1) {
        if (widget.separator != null) {
          children.add(widget.separator!);
        } else {
          children.add(SizedBox(width: widget.spacing));
        }
      }
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
