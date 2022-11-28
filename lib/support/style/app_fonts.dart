import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
    static TextStyle regular(double size, Color color) {
    return GoogleFonts.montserrat(
      color: AppColors.white,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }
}
