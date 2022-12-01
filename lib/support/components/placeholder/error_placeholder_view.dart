import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';

class ErrorPlaceholderView extends StatelessWidget {
  final String errorMessage;

  const ErrorPlaceholderView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppFonts.montserratSemibold(16, AppColors.white),
      ),
    );
  }
}
