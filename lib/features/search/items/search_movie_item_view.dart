import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../support/style/app_colors.dart';
import '../../../support/style/app_fonts.dart';
import '../../../support/style/app_image.dart';

abstract class SearchMovieItemViewModelProtocol {
  String get title;
  String get posterPath;
  String get popularity;
  String get voteCount;
  String get rating;
  String get releaseDate;
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
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          ),
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
                padding: const EdgeInsets.only(top: 8, right: 12, left: 8),
                child: Text(
                  viewModel.title,
                  style: AppFonts.nunitoBold(14, AppColors.white),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 16),
                child: _regularText(viewModel.voteCount),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: _regularText(viewModel.popularity),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: _roundedContainer(
                      child: Text(
                        viewModel.releaseDate,
                        style: AppFonts.montserratRegular(12, AppColors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _roundedContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: SvgPicture.asset(
                              AppImage.icStarPath,
                              color: AppColors.yellow,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            flex: 4,
                            child: Text(
                              viewModel.rating,
                              style: AppFonts.montserratRegular(12, AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _regularText(String content) {
    return Text(
      content,
      style: AppFonts.nunitoRegular(12, AppColors.white),
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _roundedContainer({required Widget child}) {
    return Container(
      width: 80,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.blackLight,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
