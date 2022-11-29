import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle montserratSemibold(double size, Color color) {
    return GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle nunitoSemiBold(double size, Color color) {
    return GoogleFonts.nunito(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }
}
