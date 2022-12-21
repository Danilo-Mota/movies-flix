import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';

abstract class SearchMovieItemViewModelProtocol {
  String get title;
  String get posterPath;
}

class SearchMovieItemView extends StatelessWidget {
  final SearchMovieItemViewModelProtocol viewModel;

  const SearchMovieItemView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
          child: Image(
            image: CachedNetworkImageProvider(viewModel.posterPath),
            fit: BoxFit.cover,
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, right: 12, left: 8),
                child: Text(
                  viewModel.title,
                  style: AppFonts.nunitoBold(14, AppColors.white),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
