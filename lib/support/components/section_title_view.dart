import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class SectionTitleView extends StatelessWidget {
  final String title;

  const SectionTitleView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 28),
      child: Text(
        title,
        style: AppFonts.montserratSemibold(16, AppColors.white),
        textAlign: TextAlign.start,
      ),
    );
  }
}
