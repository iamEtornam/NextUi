import 'package:flutter/material.dart';
import 'package:next_ui/src/base/text_typography.dart';

/// Contains all text styles used in Next UI
class NextUiText {
  
  /// bold text
  static Text h1Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h1Bold(textColor: textColor),
      );

  static Text h2Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h2Bold(textColor: textColor),
      );

  static Text h3Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h3Bold(textColor: textColor),
      );

  static Text h4Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h4Bold(textColor: textColor),
      );

  static Text h5Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h5Bold(textColor: textColor),
      );

  static Text h6Bold(String text, {Color? textColor, TextAlign? textAlign}) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h6Bold(textColor: textColor),
      );

  static Text paragraphBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.paragraphBold(textColor: textColor),
      );

  /// A static method that takes a string 'text' and optional parameters 'textColor' of type Color and 'textAlign' of type TextAlign. It returns a Text widget with the provided 'text', 'textColor', and 'textAlign'.
  static Text descriptionBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.descriptionBold(textColor: textColor),
      );

  static Text captionBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.captionBold(textColor: textColor),
      );

  static Text subHeadingBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.subHeadingBold(textColor: textColor),
      );

  static Text xsmBold(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.xsmBold(textColor: textColor),
      );

  /// medium text
  static Text h1Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h1Medium(textColor: textColor),
      );

  static Text h2Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h2Medium(textColor: textColor),
      );

  static Text h3Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h3Medium(textColor: textColor),
      );

  static Text h4Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h4Medium(textColor: textColor),
      );

  static Text h5Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h5Medium(textColor: textColor),
      );

  static Text h6Medium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h6Medium(textColor: textColor),
      );

  static Text paragraphMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.paragraphMedium(textColor: textColor),
      );

  static Text descriptionMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.descriptionMedium(textColor: textColor),
      );

  static Text captionMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.captionMedium(textColor: textColor),
      );

  static Text subHeadingMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.subHeadingMedium(textColor: textColor),
      );

  static Text xsmMedium(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.xsmMedium(textColor: textColor),
      );

  /// regular text
  static Text h1Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h1Regular(textColor: textColor),
      );

  static Text h2Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h2Regular(textColor: textColor),
      );

  static Text h3Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h3Regular(textColor: textColor),
      );

  static Text h4Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h4Regular(textColor: textColor),
      );

  static Text h5Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h5Regular(textColor: textColor),
      );

  static Text h6Regular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.h6Regular(textColor: textColor),
      );

  static Text paragraphRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.paragraphRegular(textColor: textColor),
      );

  static Text descriptionRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.descriptionRegular(textColor: textColor),
      );

  static Text captionRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.captionRegular(textColor: textColor),
      );

  static Text subHeadingRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.subHeadingRegular(textColor: textColor),
      );

  static Text xsmRegular(
    String text, {
    Color? textColor,
    TextAlign? textAlign,
  }) =>
      Text(
        text,
        textAlign: textAlign,
        style: NextUiTypography.xsmRegular(textColor: textColor),
      );
}
