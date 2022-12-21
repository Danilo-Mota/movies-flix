
import 'package:flutter/material.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../../style/app_image.dart';

class ErrorPlaceholderView extends StatelessWidget {
  final String? errorMessage;

  const ErrorPlaceholderView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              AppImage.icErrorPath,
              width: 52,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage ?? '',
            textAlign: TextAlign.center,
            style: AppFonts.nunitoSemiBold(16, AppColors.white),
          )
        ],
      ),
    );
  }
}
