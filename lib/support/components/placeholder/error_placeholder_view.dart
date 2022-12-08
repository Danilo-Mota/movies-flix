import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../../style/app_image.dart';

class ErrorPlaceholderView extends StatelessWidget {
  final String errorMessage;

  const ErrorPlaceholderView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              AppImage.icErrorPath,
              width: width * 0.15,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: AppFonts.nunitoSemiBold(16, AppColors.white),
            ),
          )
        ],
      ),
    );
  }
}
