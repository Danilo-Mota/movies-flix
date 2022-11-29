import 'dart:math';

import 'package:flutter/material.dart';

import '../../support/components/movies_item/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get hasError;
  bool get isLoading;
  String get errorMessage;
  List<MovieItemViewModelProtocol> get popularMovies;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const SizedBox(height: 28), _popularMovies(l10n.popularMoviesLabel)],
                ),
              ),
            ),
          );
        });
  }

  Widget _popularMovies(String sectionTitle) {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.white,
        ),
      );
    } else if (viewModel.hasError) {
      return Center(
        child: Text(
          viewModel.errorMessage,
          style: AppFonts.montserratSemibold(16, AppColors.white),
        ),
      );
    }
    return MovieHorizontalList(
      movies: viewModel.popularMovies,
      sectionTitle: sectionTitle,
    );
  }
}
