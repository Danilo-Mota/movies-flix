import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/style/app_image.dart';
import '../../support/utils/localize.dart';
import 'items/genres_item_view.dart';

abstract class DetailsViewModelProtocol with ChangeNotifier {
  String get title;
  String get rating;
  String get overview;
  String get posterPath;
  List<GenresViewModelProtocol> get genres;
  List<MovieItemViewModelProtocol> get similarMovies;

  bool get hasError;
  bool get isLoading;
  String get errorMessage;

  void didTapBack();
}

class DetailsView extends StatelessWidget {
  final DetailsViewModelProtocol viewModel;

  const DetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return _detailsWidgets();
        },
      ),
    );
  }

  Widget _detailsWidgets() {
    final l10n = Localize.instance.l10n;

    if (viewModel.isLoading) return const LoadingPlaceholderView();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Stack(
              children: [
                Image.network(
                  viewModel.posterPath,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 32,
                  top: 64,
                  child: InkWell(
                    onTap: viewModel.didTapBack,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(AppImage.icArrowPath),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 28),
            decoration: const BoxDecoration(color: AppColors.blackLight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Text(
                    viewModel.title,
                    style: AppFonts.montserratBold(20, AppColors.white),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        l10n.authorNameLabel,
                        style: AppFonts.montserratRegular(14, AppColors.white),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        viewModel.rating,
                        style: AppFonts.montserratRegular(14, AppColors.white),
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: 36,
                  child: ListView.builder(
                    itemCount: viewModel.genres.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return GenresItemView(viewModel: viewModel.genres[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Text(
              l10n.synopsisLabel,
              style: AppFonts.montserratBold(14, AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 8),
          _roundedGreenContainer(width: 20, height: 4),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              viewModel.overview,
              style: AppFonts.nunitoRegular(14, AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8, left: 16),
                child: _roundedGreenContainer(width: 4, height: 20),
              ),
              Text(
                l10n.similarItemsLabel,
                style: AppFonts.montserratBold(14, AppColors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(height: 16),
          MovieHorizontalList(movies: viewModel.similarMovies)
        ],
      ),
    );
  }

  Container _roundedGreenContainer({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.darkGreen,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
