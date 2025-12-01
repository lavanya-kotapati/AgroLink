import 'package:flutter/material.dart';
import '../global_responsive_functions.dart';

class textStyleUtility {
  TextStyle regular(BuildContext context, double fontSize, Color color) {
    return TextStyle(
      fontSize: buildFontSize(context, fontSize),
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  TextStyle bold(BuildContext context, double fontSize, Color color) {
    return TextStyle(
      fontSize: buildFontSize(context, fontSize),
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  TextStyle semiBold(BuildContext context, double fontSize, Color color) {
    return TextStyle(
      fontSize: buildFontSize(context, fontSize),
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
}
