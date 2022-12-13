import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../enums/movie_item_type.dart';
import '../../style/app_colors.dart';
import '../../style/app_fonts.dart';
import '../../utils/localize.dart';

abstract class MovieItemViewModelProtocol {
  String get title;
  String get rating;
  String get voteCount;
  String get posterPath;
  String get popularity;
  String get releaseDate;
  bool get isRatingVisible;
}

class MovieItemView extends StatelessWidget {
  final MovieItemViewModelProtocol viewModel;
  final Enum itemType;

  const MovieItemView({super.key, required this.viewModel, required this.itemType});

  @override
  Widget build(BuildContext context) {
    switch (itemType) {
      case MovieItemType.movieItem:
        return _movieItemWidget();
      case MovieItemType.carouselItem:
        return _carouselMovieItemWidget(context);
      case MovieItemType.suggestedItem:
        return _suggestedMovieItemWidget();
      default:
        return _movieItemWidget();
    }
  }

  Widget _movieItemWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image(
                    image: CachedNetworkImageProvider(viewModel.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: Visibility(
                  visible: viewModel.isRatingVisible,
                  child: _movieRatingWidget(viewModel.rating),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          viewModel.title,
          style: AppFonts.nunitoSemiBold(12, AppColors.white),
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _carouselMovieItemWidget(BuildContext context) {
    final l10n = Localize.instance.l10n;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          child: Container(
            foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.black],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
            child: Center(
              child: Image.network(
                viewModel.posterPath,
                fit: BoxFit.fill,
                width: width,
              ),
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 160,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              viewModel.rating,
              style: AppFonts.nunitoBold(16, AppColors.white),
            ),
          ),
        ),
        Positioned(
          right: 24,
          bottom: 108,
          child: Container(
            width: 136,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              l10n.learnMoreLabel,
              style: AppFonts.nunitoBold(16, AppColors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _suggestedMovieItemWidget() {
    return Row(
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
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
                    child: Text(
                      viewModel.title,
                      style: AppFonts.nunitoBold(14, AppColors.black),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: _suggestedMovieDetailsText(viewModel.releaseDate)),
                  Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                      child: _suggestedMovieDetailsText(viewModel.voteCount)),
                  Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: _suggestedMovieDetailsText(viewModel.popularity)),
                  Padding(
                      padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
                      child: _movieRatingWidget(viewModel.rating)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _suggestedMovieDetailsText(String data) {
    return Text(
      data,
      style: AppFonts.nunitoRegular(12, AppColors.black),
      maxLines: 1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _movieRatingWidget(String rating) {
    return Container(
      width: 80,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        rating,
        style: AppFonts.nunitoBold(12, AppColors.white),
      ),
    );
  }
}
