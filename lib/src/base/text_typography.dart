import 'package:flutter/material.dart';

// https://stackoverflow.com/a/63068152/644571
double _pxHeight2LineHeight(int pxHeight, int fontSize) => pxHeight / fontSize;

class NextUiTypography {

  
  static TextStyle baseTextStyle = TextStyle(
    fontStyle: FontStyle.normal,
  );

  /// bold  TextStyle styles
  static TextStyle h1Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  static TextStyle h2Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  static TextStyle h3Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  static TextStyle h4Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h5Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h6Bold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  static TextStyle paragraphBold({Color? textColor, TextOverflow? overflow}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 15,
        overflow: overflow,
        height: _pxHeight2LineHeight(21, 15),
      );

  static TextStyle descriptionBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: _pxHeight2LineHeight(19, 14),
      );

  static TextStyle captionBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  static TextStyle subHeadingBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  static TextStyle xsmBold({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );

  /// medium  TextStyle styles
  static TextStyle h1Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  static TextStyle h2Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  static TextStyle h3Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  static TextStyle h4Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h5Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h6Medium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  static TextStyle paragraphMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: _pxHeight2LineHeight(21, 15),
      );

  static TextStyle descriptionMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: _pxHeight2LineHeight(19, 14),
      );

  static TextStyle captionMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  static TextStyle subHeadingMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  static TextStyle xsmMedium({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );

  /// regular  TextStyle styles
  static TextStyle h1Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 40,
        height: _pxHeight2LineHeight(48, 40),
      );

  static TextStyle h2Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 34,
        height: _pxHeight2LineHeight(48, 34),
      );

  static TextStyle h3Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: _pxHeight2LineHeight(33, 24),
      );

  static TextStyle h4Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h5Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: _pxHeight2LineHeight(26, 20),
      );

  static TextStyle h6Regular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: _pxHeight2LineHeight(23, 18),
      );

  static TextStyle paragraphRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: _pxHeight2LineHeight(21, 15),
      );

  static TextStyle descriptionRegular({Color? textColor, TextOverflow? overflow}) =>
      baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        overflow: overflow,
        height: _pxHeight2LineHeight(19, 14),
      );

  static TextStyle captionRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: _pxHeight2LineHeight(17, 12),
      );

  static TextStyle subHeadingRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: _pxHeight2LineHeight(18, 12),
        letterSpacing: 0.06,
      );

  static TextStyle xsmRegular({Color? textColor}) => baseTextStyle.copyWith(
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 11,
        height: _pxHeight2LineHeight(13, 11),
      );
}
