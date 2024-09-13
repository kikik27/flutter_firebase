import 'package:firebase_learn/core/colors/color_data.dart';
import 'package:flutter/widgets.dart';

class AppTheme {
  static const colors = ColorData;
  static const textStyle = _AppFont();
}

class _AppFont {
  const _AppFont();
  TextStyle get _fontInter => const TextStyle(
        fontFamily: 'Inter',
      );
  TextStyle get _fontNunito => const TextStyle(fontFamily: 'Nunito');
  TextStyle get dlay2xlRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 72,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlay2xlMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 72,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlay2xlSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 72,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlay2xlBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 72,
        fontWeight: FontWeight.w900,
      );

  TextStyle get dlayXLRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 60,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlayXLMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 60,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlayXLSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 60,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlayXLBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 60,
        fontWeight: FontWeight.w900,
      );

  TextStyle get dlayLGRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlayLGMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 48,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlayLGSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 48,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlayLGBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 48,
        fontWeight: FontWeight.w900,
      );
  TextStyle get dlayMDRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlayMDMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 36,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlayMDSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 36,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlayMDBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 36,
        fontWeight: FontWeight.w900,
      );

  TextStyle get dlaySMRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 30,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlaySMMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlaySMSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 30,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlaySMBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 30,
        fontWeight: FontWeight.w900,
      );

  TextStyle get dlaySMMediumItalic => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get dlayXSRegular => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  TextStyle get dlayXSMedium => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );

  TextStyle get dlayXSSemibold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  TextStyle get dlayXSBold => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );

  TextStyle get dlayXSMediumItalic => _fontNunito.copyWith(
        color: ColorData.baseBlack,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textXLRegular => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

  TextStyle get textXLMedium => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textXLSemibold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textXLBold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w900,
      );

  TextStyle get textXLRegularItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textXLMediumItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textXLSemiboldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textXLBoldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textXLRegularUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      );

  TextStyle get textLGRegular => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );

  TextStyle get textLGMedium => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textLGSemibold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textLGBold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      );

  TextStyle get textLGRegularItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textLGMediumItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textLGSemiboldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textLGBoldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textLGRegularUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      );

  TextStyle get textLGMediumUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );

  TextStyle get textMDRegular => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get textMDMedium => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textMDSemibold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textMDBold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w900,
      );

  TextStyle get textMDRegularItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textMDMediumItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textMDSemiboldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textMDBoldItalic => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      );

  TextStyle get textMDRegularUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      );

  TextStyle get textMDMediumUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );

  TextStyle get textSMRegular => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  TextStyle get textSMMedium => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textSMSemibold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textSMBold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w900,
      );

  TextStyle get textSMRegularUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline,
      );

  TextStyle get textSMMediumUnderlined => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      );

  TextStyle get textXSRegular => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get textXSMedium => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textXSSemibold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  TextStyle get textXSBold => _fontInter.copyWith(
        color: ColorData.grey500,
        fontSize: 12,
        fontWeight: FontWeight.w900,
      );
}
