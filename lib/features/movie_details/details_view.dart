import 'package:flutter/material.dart';

import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'items/genres_item_view.dart';

abstract class DetailsViewModelProtocol with ChangeNotifier {
  String get title;
  String get rating;
  String get overview;
  String get posterPath;
  bool get hasDetailsError;
  bool get isDetailsLoading;
  String get detailsErrorMessage;
  List<GenresViewModelProtocol> get genres;
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

    if (viewModel.isDetailsLoading) return const LoadingPlaceholderView();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Image.network(
              viewModel.posterPath,
              fit: BoxFit.fill,
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
          Text(
            'Sinopse',
            style: AppFonts.montserratBold(14, AppColors.white),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.overview,
            style: AppFonts.nunitoRegular(14, AppColors.white),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
