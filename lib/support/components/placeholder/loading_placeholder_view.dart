import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class LoadingPlaceholderView extends StatelessWidget {
  const LoadingPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          color: AppColors.white,
        ),
      ),
    );
  }
}
