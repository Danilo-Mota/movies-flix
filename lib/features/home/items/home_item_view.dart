import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import '../../../support/utils/constants.dart';

abstract class HomeItemViewModelProtocol {
  String get title;
  String get posterPath;
}

class HomeItemView extends StatelessWidget {
  final HomeItemViewModelProtocol viewModel;

  const HomeItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                '${Constants.imageBaseURL}${viewModel.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          viewModel.title,
          style: AppFonts.nunitoSemiBold(16, AppColors.white),
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
