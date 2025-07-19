import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_ui/src/base/enums.dart';

/// A Material Design-inspired input field component with customizable variants, colors, and sizes.
class NextInput extends StatefulWidget {
  /// Creates a NextInput.
  const NextInput({
    super.key,
    this.controller,
    this.value,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
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
    this.maxLines = 1,
    this.keyboardType,
  });

  /// Text editing controller
  final TextEditingController? controller;

  /// Initial text value
  final String? value;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the text
  final ValueChanged<String>? onSubmitted;

  /// Called when the clear button is pressed
  final VoidCallback? onClear;

  /// Visual style variant
  final InputVariant variant;

  /// Color theme
  final InputColor color;

  /// Input field size
  final InputSize size;

  /// Border radius
  final InputRadius radius;

  /// Label position
  final LabelPlacement labelPlacement;

  /// Label text
  final String? label;

  /// Placeholder text
  final String? placeholder;

  /// Helper description
  final String? description;

  /// Error message
  final String? errorMessage;

  /// Leading widget
  final Widget? startContent;

  /// Trailing widget
  final Widget? endContent;

  /// Required field indicator
  final bool isRequired;

  /// Disabled state
  final bool isDisabled;

  /// Read-only state
  final bool isReadOnly;

  /// Invalid state
  final bool isInvalid;

  /// Show clear button
  final bool isClearable;

  /// Password mode
  final bool obscureText;

  /// Maximum lines
  final int? maxLines;

  /// Keyboard type
  final TextInputType? keyboardType;

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
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  Color _getColorForState(ThemeData theme) {
    if (widget.isDisabled) {
      return theme.colorScheme.onSurface.withOpacity(0.38);
    }
    if (widget.isInvalid) {
      return theme.colorScheme.error;
    }
    if (_isFocused) {
      return _getThemeColor(theme);
    }
    return theme.colorScheme.onSurface.withOpacity(0.6);
  }

  Color _getThemeColor(ThemeData theme) {
    switch (widget.color) {
      case InputColor.primary:
        return theme.colorScheme.primary;
      case InputColor.secondary:
        return theme.colorScheme.secondary;
      case InputColor.success:
        return const Color(0xFF4CAF50);
      case InputColor.warning:
        return const Color(0xFFFF9800);
      case InputColor.danger:
        return theme.colorScheme.error;
      case InputColor.defaultColor:
        return theme.colorScheme.primary;
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

  InputDecoration _buildDecoration(ThemeData theme) {
    final color = _getColorForState(theme);
    final borderRadius = _getBorderRadius();

    InputBorder getBorder(Color borderColor, {double width = 1.0}) {
      switch (widget.variant) {
        case InputVariant.flat:
          return OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide.none,
          );
        case InputVariant.bordered:
          return OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: borderColor, width: width),
          );
        case InputVariant.faded:
          return OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide.none,
          );
        case InputVariant.underlined:
          return UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: width),
          );
      }
    }

    Color? fillColor;
    switch (widget.variant) {
      case InputVariant.flat:
        fillColor = theme.colorScheme.surfaceContainerHighest.withOpacity(0.6);
      case InputVariant.faded:
        fillColor = _getThemeColor(theme).withOpacity(0.1);
      case InputVariant.bordered:
      case InputVariant.underlined:
        fillColor = Colors.transparent;
    }

    final suffixIcons = <Widget>[];

    if (widget.isClearable &&
        _controller.text.isNotEmpty &&
        !widget.isReadOnly) {
      suffixIcons.add(
        IconButton(
          icon: const Icon(Icons.clear, size: 16),
          onPressed: () {
            _controller.clear();
            widget.onChanged?.call('');
            widget.onClear?.call();
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      );
    }

    if (widget.obscureText) {
      suffixIcons.add(
        IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              size: 16),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        ),
      );
    }

    if (widget.endContent != null) {
      suffixIcons.add(widget.endContent!);
    }

    return InputDecoration(
      labelText: widget.labelPlacement == LabelPlacement.inside
          ? (widget.label != null
              ? widget.label! + (widget.isRequired ? ' *' : '')
              : null)
          : null,
      hintText: widget.placeholder,
      helperText: widget.description,
      errorText: widget.isInvalid ? widget.errorMessage : null,
      prefixIcon: widget.startContent,
      suffixIcon: suffixIcons.isNotEmpty
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: suffixIcons,
            )
          : null,
      filled: true,
      fillColor: fillColor,
      border: getBorder(color),
      enabledBorder: getBorder(theme.colorScheme.outline.withOpacity(0.5)),
      focusedBorder: getBorder(_getThemeColor(theme), width: 2),
      errorBorder: getBorder(theme.colorScheme.error),
      focusedErrorBorder: getBorder(theme.colorScheme.error, width: 2),
      disabledBorder: getBorder(theme.colorScheme.onSurface.withOpacity(0.12)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: widget.size == InputSize.sm
            ? 6
            : (widget.size == InputSize.lg ? 12 : 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget input = SizedBox(
      height: widget.maxLines == 1 ? _getInputHeight() : null,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        enabled: !widget.isDisabled,
        readOnly: widget.isReadOnly,
        obscureText: widget.obscureText && _obscureText,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        decoration: _buildDecoration(theme),
      ),
    );

    if (widget.labelPlacement == LabelPlacement.outside &&
        widget.label != null) {
      input = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label! + (widget.isRequired ? ' *' : ''),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          input,
        ],
      );
    } else if (widget.labelPlacement == LabelPlacement.outsideLeft &&
        widget.label != null) {
      input = Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              widget.label! + (widget.isRequired ? ' *' : ''),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: input),
        ],
      );
    }

    return input;
  }
}

/// An OTP (One-Time Password) input component with customizable length and styling.
class NextInputOTP extends StatefulWidget {
  /// Creates a NextInputOTP.
  const NextInputOTP({
    required this.length,
    super.key,
    this.onChanged,
    this.onCompleted,
    this.separator,
    this.size = InputSize.md,
    this.color = InputColor.defaultColor,
    this.spacing = 8.0,
    this.isDisabled = false,
    this.isInvalid = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
  });

  /// Number of OTP digits
  final int length;

  /// Called when the OTP value changes
  final ValueChanged<String>? onChanged;

  /// Called when the OTP is completed
  final ValueChanged<String>? onCompleted;

  /// Custom separator widget between fields
  final Widget? separator;

  /// Input field size
  final InputSize size;

  /// Color theme
  final InputColor color;

  /// Spacing between fields
  final double spacing;

  /// Disabled state
  final bool isDisabled;

  /// Invalid state
  final bool isInvalid;

  /// Hide input text
  final bool obscureText;

  /// Keyboard type
  final TextInputType keyboardType;

  @override
  State<NextInputOTP> createState() => _NextInputOTPState();
}

class _NextInputOTPState extends State<NextInputOTP> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _otpValue = '';

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
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

  void _updateOTPValue() {
    final newValue = _controllers.map((c) => c.text).join();
    if (newValue != _otpValue) {
      _otpValue = newValue;
      widget.onChanged?.call(_otpValue);

      if (_otpValue.length == widget.length) {
        widget.onCompleted?.call(_otpValue);
      }
    }
  }

  Color _getThemeColor(ThemeData theme) {
    switch (widget.color) {
      case InputColor.primary:
        return theme.colorScheme.primary;
      case InputColor.secondary:
        return theme.colorScheme.secondary;
      case InputColor.success:
        return const Color(0xFF4CAF50);
      case InputColor.warning:
        return const Color(0xFFFF9800);
      case InputColor.danger:
        return theme.colorScheme.error;
      case InputColor.defaultColor:
        return theme.colorScheme.primary;
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
    final theme = Theme.of(context);
    final fieldSize = _getFieldSize();

    final fields = <Widget>[];

    for (var i = 0; i < widget.length; i++) {
      if (i > 0 && widget.separator != null) {
        fields.add(widget.separator!);
      }

      fields.add(
        SizedBox(
          width: fieldSize,
          height: fieldSize,
          child: TextField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            enabled: !widget.isDisabled,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')), // No spaces
            ],
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (i < widget.length - 1) {
                  _focusNodes[i + 1].requestFocus();
                } else {
                  _focusNodes[i].unfocus();
                }
              } else if (value.isEmpty && i > 0) {
                _focusNodes[i - 1].requestFocus();
              }
              _updateOTPValue();
            },
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: widget.isInvalid
                      ? theme.colorScheme.error
                      : theme.colorScheme.outline.withOpacity(0.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: widget.isInvalid
                      ? theme.colorScheme.error
                      : _getThemeColor(theme),
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: theme.colorScheme.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: theme.colorScheme.error, width: 2),
              ),
              filled: true,
              fillColor: widget.isDisabled
                  ? theme.colorScheme.onSurface.withOpacity(0.05)
                  : theme.colorScheme.surface,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      );

      if (i < widget.length - 1 && widget.separator == null) {
        fields.add(SizedBox(width: widget.spacing));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: fields,
    );
  }
}
