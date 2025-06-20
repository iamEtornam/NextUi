import 'package:flutter/material.dart';
import 'package:next_ui/src/base/text_typography.dart';

/// Next UI Text component
///
/// A comprehensive text widget that provides both traditional heading styles
/// (h1-h6) and Material Design 3 typography scale.
///
/// ## Traditional Heading Usage
///
/// ```dart
/// NextText.h1Bold('Large Heading');
/// NextText.h2Medium('Subtitle');
/// NextText.paragraphRegular('Body text content');
/// ```
///
/// ## Material Design 3 Usage
///
/// ```dart
/// NextText.displayLarge('Display Text');
/// NextText.headlineMedium('Headline');
/// NextText.titleLarge('Title');
/// NextText.bodyLarge('Body text');
/// NextText.labelMedium('Label');
/// ```
///
/// ## Custom Colors
///
/// ```dart
/// NextText.h1Bold('Colored Text', textColor: Colors.blue);
/// NextText.bodyLarge('Custom Color', textColor: Colors.green);
/// ```
class NextText extends StatelessWidget {
  /// Creates a Next UI Text widget
  const NextText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textColor,
    this.maxLines,
    this.overflow,
  });

  /// The text to display
  final String text;

  /// Text style to apply
  final TextStyle? style;

  /// Text alignment
  final TextAlign? textAlign;

  /// Text color override
  final Color? textColor;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(color: textColor) ?? TextStyle(color: textColor),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // ========================================================================
  // MATERIAL DESIGN 3 TYPOGRAPHY SCALE
  // ========================================================================

  /// Display Large - Largest text on screen (57sp)
  static NextText displayLarge(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h1Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Display Medium - Large text (45sp)
  static NextText displayMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h1Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Display Small - Medium-large text (36sp)
  static NextText displaySmall(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h2Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Headline Large - High-emphasis text (32sp)
  static NextText headlineLarge(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h2Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Headline Medium - High-emphasis text (28sp)
  static NextText headlineMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h3Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Headline Small - High-emphasis text (24sp)
  static NextText headlineSmall(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h3Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Title Large - Medium-emphasis text (22sp)
  static NextText titleLarge(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h4Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Title Medium - Medium-emphasis text (16sp)
  static NextText titleMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h5Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Title Small - Medium-emphasis text (14sp)
  static NextText titleSmall(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h6Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Body Large - Regular body text (16sp)
  static NextText bodyLarge(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.paragraphRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Body Medium - Regular body text (14sp)
  static NextText bodyMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.descriptionRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Body Small - Regular body text (12sp)
  static NextText bodySmall(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.captionRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Label Large - Call-to-action text (14sp)
  static NextText labelLarge(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.descriptionMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Label Medium - Call-to-action text (12sp)
  static NextText labelMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.captionMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Label Small - Call-to-action text (11sp)
  static NextText labelSmall(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.xsmMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  // ========================================================================
  // TRADITIONAL HEADING STYLES (H1-H6) - BOLD
  // ========================================================================

  /// H1 Bold heading (40sp)
  static NextText h1Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h1Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H2 Bold heading (34sp)
  static NextText h2Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h2Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H3 Bold heading (24sp)
  static NextText h3Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h3Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H4 Bold heading (20sp)
  static NextText h4Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h4Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H5 Bold heading (20sp)
  static NextText h5Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h5Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H6 Bold heading (18sp)
  static NextText h6Bold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h6Bold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  // ========================================================================
  // TRADITIONAL HEADING STYLES (H1-H6) - MEDIUM
  // ========================================================================

  /// H1 Medium heading (40sp)
  static NextText h1Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h1Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H2 Medium heading (34sp)
  static NextText h2Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h2Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H3 Medium heading (24sp)
  static NextText h3Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h3Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H4 Medium heading (20sp)
  static NextText h4Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h4Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H5 Medium heading (20sp)
  static NextText h5Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h5Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H6 Medium heading (18sp)
  static NextText h6Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h6Medium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  // ========================================================================
  // TRADITIONAL HEADING STYLES (H1-H6) - REGULAR
  // ========================================================================

  /// H1 Regular heading (40sp)
  static NextText h1Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h1Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H2 Regular heading (34sp)
  static NextText h2Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h2Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H3 Regular heading (24sp)
  static NextText h3Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h3Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H4 Regular heading (20sp)
  static NextText h4Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h4Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H5 Regular heading (20sp)
  static NextText h5Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h5Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// H6 Regular heading (18sp)
  static NextText h6Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.h6Regular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  // ========================================================================
  // BODY TEXT STYLES
  // ========================================================================

  /// Paragraph Bold text (15sp)
  static NextText paragraphBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.paragraphBold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Paragraph Medium text (15sp)
  static NextText paragraphMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.paragraphMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Paragraph Regular text (15sp)
  static NextText paragraphRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.paragraphRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Description Bold text (14sp)
  static NextText descriptionBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.descriptionBold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Description Medium text (14sp)
  static NextText descriptionMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.descriptionMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Description Regular text (14sp)
  static NextText descriptionRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.descriptionRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Caption Bold text (12sp)
  static NextText captionBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.captionBold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Caption Medium text (12sp)
  static NextText captionMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.captionMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Caption Regular text (12sp)
  static NextText captionRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.captionRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Subheading Bold text (12sp)
  static NextText subHeadingBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.subHeadingBold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Subheading Medium text (12sp)
  static NextText subHeadingMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.subHeadingMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Subheading Regular text (12sp)
  static NextText subHeadingRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.subHeadingRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Extra Small Bold text (11sp)
  static NextText xsmBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.xsmBold(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Extra Small Medium text (11sp)
  static NextText xsmMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.xsmMedium(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );

  /// Extra Small Regular text (11sp)
  static NextText xsmRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      NextText(
        text,
        style: NextUiTypography.xsmRegular(textColor: textColor),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      );
}

/// Legacy alias for backward compatibility
/// @deprecated Use NextText instead
typedef NextUiText = NextText;
