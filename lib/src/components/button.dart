import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Button
class Button extends StatelessWidget {
  /// Next UI Button params
  const Button({
    required this.label,
    this.borderRadius = 8,
    super.key,
    this.height = 56,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.labelAlign,
    this.labelColor,
    this.onPressed,
  });

  /// Button height. Default is 56
  final double height;

  /// Button leading widget
  final Widget? leading;

  /// Button label. Required
  final String label;

  /// Button trailing widget
  final Widget? trailing;

  /// Button background color
  final Color? backgroundColor;

  /// Button border radius
  final double borderRadius;

  /// Button text alignment
  final TextAlign? labelAlign;

  /// Button label color
  final Color? labelColor;

  /// Button on press
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: backgroundColor ?? NextUiColors.primary,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          children: [
            if (leading != null) leading!,
            const SizedBox(
              width: 12,
            ),
            NextUiText.paragraphRegular(
              label,
              textAlign: labelAlign,
              textColor: labelColor,
            ),
            const SizedBox(
              width: 12,
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
