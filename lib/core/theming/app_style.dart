import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';

abstract class AppStyle {
  static TextStyle styleBold26(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.primary);
  }

  static TextStyle styleBold18(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: AppColors.primary);
  }

  static TextStyle styleBold30(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        color: Colors.black);
  }

  static TextStyle styleRegular16Grey(context) {
    return TextStyle(
      fontFamily: 'Poppins',
      height: 2,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle styleBold50(context) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        fontSize: getResponsiveFontSize(context, fontSize: 50),
        color: Colors.white);
  }

  static TextStyle stylerBold20(context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
