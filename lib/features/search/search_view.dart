import 'package:flutter/material.dart';

import '../../support/components/placeholder/error_placeholder_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';
import 'items/search_movie_item_view.dart';

abstract class SearchViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String? get errorMessage;
  List<SearchMovieItemViewModelProtocol> get searchMovies;

  void getSearchedMovies(String text);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _searchFieldWidget(),
            const SizedBox(height: 12),
            AnimatedBuilder(
              animation: viewModel,
              builder: (_, __) {
                return _researchedMovies();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchFieldWidget() {
    final l10n = Localize.instance.l10n;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onSubmitted: (text) {
          viewModel.getSearchedMovies(text);
        },
        style: AppFonts.nunitoBold(16, AppColors.black),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: l10n.searchMovieLabel,
          hintStyle: AppFonts.nunitoRegular(16, AppColors.gray),
        ),
      ),
    );
  }

  Widget _researchedMovies() {
    if (viewModel.isLoading) return const Expanded(child: LoadingPlaceholderView());
    if (viewModel.errorMessage != null) {
      return Expanded(child: ErrorPlaceholderView(errorMessage: viewModel.errorMessage));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.searchMovies.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return SizedBox(
            width: 180,
            height: 220,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SearchMovieItemView(
                viewModel: viewModel.searchMovies[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
