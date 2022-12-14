import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';

abstract class GenresViewModelProtocol {}

class GenresItemView extends StatelessWidget {
  final GenresViewModelProtocol viewModel;

  const GenresItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColors.green,
      ),
    );
  }
}
