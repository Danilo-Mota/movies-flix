import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

abstract class GenresViewModelProtocol {
  String get genreName;
}

class GenresItemView extends StatelessWidget {
  final GenresViewModelProtocol viewModel;

  const GenresItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.green,
      ),
      child: Text(
        viewModel.genreName,
        style: AppFonts.montserratRegular(12, AppColors.white),
        maxLines: 1,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
