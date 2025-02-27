import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'package:projeto_ajudar/common/constants/app_colors.dart';


//Define estilos de texto e fontes que foram instaladas
class AppTextStyles{
  AppTextStyles._();

  static TextStyle splashText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 50.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle mediumText = TextStyle(
    fontFamily: 'Abellaice',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle smallTextBlack = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

}