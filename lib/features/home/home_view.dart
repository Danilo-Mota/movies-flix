import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/placeholder/error_placeholder_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/components/section_title_view.dart';
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
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: viewModel,
            builder: (_, __) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _carouselMoviesWidget(context),
                  const SizedBox(height: 16),
                  SectionTitleView(title: l10n.topRatedMoviesLabel),
                  _topRatedMoviesWidget(),
                   const SizedBox(height: 16),
                  SectionTitleView(title: l10n.popularMoviesLabel),
                   _popularMoviesWidget(),
                  const SizedBox(height: 16),
                   SectionTitleView(title: l10n.upcomingMoviesLabel),
                   _upcomingMoviesWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _carouselMoviesWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (viewModel.popularMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.popularMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.popularMoviesErrorMessage);
    }

    return CarouselSlider(
      options: CarouselOptions(
        //height: height * 0.55,
        aspectRatio: 0.68,
        viewportFraction: 1.0,
        autoPlay: true,
      ),
      items: viewModel.popularMovies.map(
        (carouselMovies) {
          return MovieItemView(
            viewModel: carouselMovies,
            itemTypeIsCarousel: true,
          );
        },
      ).toList(),
    );
  }

  Widget _popularMoviesWidget() {
    if (viewModel.popularMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.popularMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.popularMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.popularMovies);
  }

  Widget _topRatedMoviesWidget() {
    if (viewModel.topRatedMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.topRatedMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.topRatedMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.topRatedMovies);
  }

  Widget _upcomingMoviesWidget() {
    if (viewModel.upcomingMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.upcomingMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.upcomingMoviesErrorMessage);
    }

    return MovieHorizontalList(movies: viewModel.upcomingMovies);
  }
}
