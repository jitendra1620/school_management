// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  Color indigo01 = Color(0xFFEDF1FF);
  Color indigo02 = Color(0xFFC4D0FF);
  Color indigo03 = Color(0xFF7A86FF);
  Color indigo04 = Color(0xFF483DEE);
  Color indigo05 = Color(0xFF3129AA);
  Color indigo06 = Color(0xFF1C184E);
  Color indigo07 = Color(0xFF3141D7);
  Color indigo08 = Color(0xFF5E6DFF);
  Color indigo09 = Color(0xFFF5F6FF);
  Color indigo10 = Color(0xFFA0A9FA);
  Color indigo11 = Color(0xFFCCD1FF);

  Color teal01 = Color(0xFFECFDF7);
  Color teal02 = Color(0xFFA6F4D7);
  Color teal03 = Color(0xFF6DE8C3);
  Color teal04 = Color(0xFF0FBA91);
  Color teal05 = Color(0xFF037962);
  Color teal06 = Color(0xFF022C26);
  Color teal07 = Color(0xFF53CFB8);
  Color teal08 = Color(0xFF0E938B);
  Color teal09 = Color(0xFF0FBAB0);
  Color teal10 = Color(0xFF0E938B);
  Color teal11 = Color(0xFFE3FFF7);
  Color teal12 = Color(0xFF53CFB8);
  Color teal13 = Color(0xFF0FBAAF);

  Color purple01 = Color(0xFFE6DBFF);
  Color purple02 = Color(0xFF8E69FF);

  Color peach01 = Color(0xFFFFF6EC);
  Color peach02 = Color(0xFFFFFBF6);
  Color peach03 = Color(0xFFFFEFDC);

  Color red01 = Color(0xFFFFF1F1);
  Color red02 = Color(0xFFFFC8C8);
  Color red03 = Color(0xFFFE6161);
  Color red04 = Color(0xFFFD6161);

  Color orange01 = Color(0xFFFFF1E6);
  Color orange02 = Color(0xFFEB7214);
  Color orange03 = Color(0xFFFF9260);
  Color orange04 = Color(0xFFEA7114);
  Color orange05 = Color(0xFFFF9260);
  Color orange06 = Color(0xFFFFF0E5);

  Color grey01 = Color(0xFFF6F6F6);
  Color grey02 = Color(0xFFEEEEEE);
  Color grey03 = Color(0xFFB0B0B0);
  Color grey04 = Color(0xFF6D6D6D);
  Color grey05 = Color(0xFF4F4F4F);
  Color grey06 = Color(0xFF3D3D3D);
  Color grey07 = Color(0xFF1B1B1B);
  Color grey08 = Color(0xFF4C4C4C);
  Color grey09 = Color(0x66666666);
  Color grey10 = Color(0xFF1B1B1B);
  Color grey11 = Color(0xFFDADADA);
  Color grey12 = Color(0xFFA5A5A5);
  Color grey13 = Color(0xFFF7F7F7);
  Color grey14 = Color(0xFF6E6F71);
  Color grey15 = Color(0xFF383838);

  Color white = Color(0xFFFFFFFF);

  Color transparent = Colors.transparent;

  Color black01 = Color(0xFF000000);
  Color black02 = Color(0xFF1B1B1B);
  Color black03 = Color(0xFF666666);

  // String primaryFont = "Onest";
  // String secondaryFont = "Phudu";
  // String tertiaryFont = "SF_Pro_Rounded";

  @override
  ThemeExtension<AppTheme> copyWith() {
    return this;
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    return other ?? this;
  }
}
