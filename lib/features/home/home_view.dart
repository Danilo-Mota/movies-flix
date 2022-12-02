import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/placeholder/error_placeholder_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/components/section_title_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/utils/constants.dart';
import '../../support/utils/localize.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get popularMoviesHasError;
  bool get popularMoviesIsLoading;
  String get popularMoviesErrorMessage;
  List<MovieItemViewModelProtocol> get popularMovies;

  bool get topRatedMoviesHasError;
  bool get topRatedMoviesIsLoading;
  String get topRatedMoviesErrorMessage;
  List<MovieItemViewModelProtocol> get topRatedMovies;

  bool get upcomingMoviesHasError;
  bool get upcomingMoviesIsLoading;
  String get upcomingMoviesErrorMessage;
  List<MovieItemViewModelProtocol> get upcomingMovies;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topMoviesSlider(context),
                  const SizedBox(height: 16),
                  SectionTitleView(title: l10n.topRatedMoviesLabel),
                  _topRatedMovies(),
                  const SizedBox(height: 16),
                  SectionTitleView(title: l10n.popularMoviesLabel),
                  _popularMovies(),
                  const SizedBox(height: 16),
                  SectionTitleView(title: l10n.upcomingMoviesLabel),
                  _upcomingMovies(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _topMoviesSlider(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.55,
        viewportFraction: 1.0,
        autoPlay: true,
      ),
      items: viewModel.popularMovies.map(
        (viewModel) {
          return Container(
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
                '${Constants.imageBaseURL}${viewModel.posterPath}',
                fit: BoxFit.fill,
                width: width,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  Widget _popularMovies() {
    if (viewModel.popularMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.popularMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.popularMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.popularMovies);
  }

  Widget _topRatedMovies() {
    if (viewModel.topRatedMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.topRatedMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.topRatedMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.topRatedMovies);
  }

  Widget _upcomingMovies() {
    if (viewModel.upcomingMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.upcomingMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.upcomingMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.upcomingMovies);
  }
}
