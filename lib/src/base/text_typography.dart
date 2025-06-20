import 'package:flutter/material.dart';

// https://stackoverflow.com/a/63068152/644571
double _pxHeight2LineHeight(int pxHeight, int fontSize) => pxHeight / fontSize;

/// Typography system for Next UI components.
///
/// Provides a comprehensive set of text styles organized
///  by weight (bold, medium, regular)
/// and semantic meaning (h1-h6, paragraph, description, caption, etc.).
class NextUiTypography {
  /// Base text style used as foundation for all typography styles.
  static TextStyle baseTextStyle = const TextStyle(
    fontStyle: FontStyle.normal,
  );

  // Bold Text Styles

  /// Returns bold H1 heading text style (40sp, w700).
  static TextStyle h1Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  /// Returns bold H2 heading text style (34sp, w700).
  static TextStyle h2Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  /// Returns bold H3 heading text style (24sp, w700).
  static TextStyle h3Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  /// Returns bold H4 heading text style (20sp, w700).
  static TextStyle h4Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns bold H5 heading text style (20sp, w700).
  static TextStyle h5Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns bold H6 heading text style (18sp, w700).
  static TextStyle h6Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  /// Returns bold paragraph text style (15sp, w700).
  static TextStyle paragraphBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        height: _pxHeight2LineHeight(21, 15),
      );

  /// Returns bold description text style (14sp, w700).
  static TextStyle descriptionBold({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: _pxHeight2LineHeight(19, 14),
      );

  /// Returns bold caption text style (12sp, w700).
  static TextStyle captionBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  /// Returns bold subheading text style (12sp, w700, letter spacing).
  static TextStyle subHeadingBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  /// Returns bold extra small text style (11sp, w700).
  static TextStyle xsmBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );

  // Medium Text Styles

  /// Returns medium H1 heading text style (40sp, w500).
  static TextStyle h1Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  /// Returns medium H2 heading text style (34sp, w500).
  static TextStyle h2Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  /// Returns medium H3 heading text style (24sp, w500).
  static TextStyle h3Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  /// Returns medium H4 heading text style (20sp, w500).
  static TextStyle h4Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns medium H5 heading text style (20sp, w500).
  static TextStyle h5Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns medium H6 heading text style (18sp, w500).
  static TextStyle h6Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  /// Returns medium paragraph text style (15sp, w500).
  static TextStyle paragraphMedium({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: _pxHeight2LineHeight(21, 15),
      );

  /// Returns medium description text style (14sp, w500).
  static TextStyle descriptionMedium({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: _pxHeight2LineHeight(19, 14),
      );

  /// Returns medium caption text style (12sp, w500).
  static TextStyle captionMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  /// Returns medium subheading text style (12sp, w500, letter spacing).
  static TextStyle subHeadingMedium({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  /// Returns medium extra small text style (11sp, w500).
  static TextStyle xsmMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );

  // Regular Text Styles

  /// Returns regular H1 heading text style (40sp, w400).
  static TextStyle h1Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  /// Returns regular H2 heading text style (34sp, w400).
  static TextStyle h2Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  /// Returns regular H3 heading text style (24sp, w400).
  static TextStyle h3Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  /// Returns regular H4 heading text style (20sp, w400).
  static TextStyle h4Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns regular H5 heading text style (20sp, w400).
  static TextStyle h5Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  /// Returns regular H6 heading text style (18sp, w400).
  static TextStyle h6Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  /// Returns regular paragraph text style (15sp, w400).
  static TextStyle paragraphRegular({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: _pxHeight2LineHeight(21, 15),
      );

  /// Returns regular description text style (14sp, w400).
  static TextStyle descriptionRegular({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: _pxHeight2LineHeight(19, 14),
      );

  /// Returns regular caption text style (12sp, w400).
  static TextStyle captionRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  /// Returns regular subheading text style (12sp, w400, letter spacing).
  static TextStyle subHeadingRegular({Color? textColor}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  /// Returns regular extra small text style (11sp, w400).
  static TextStyle xsmRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );
}
