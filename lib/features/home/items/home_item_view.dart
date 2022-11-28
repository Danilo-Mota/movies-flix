import 'package:flutter/material.dart';

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
          child: Stack(
            children: [
              Positioned.fill(
                child: InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network('${Constants.imageBaseURL}${viewModel.posterPath}'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          viewModel.title,
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
