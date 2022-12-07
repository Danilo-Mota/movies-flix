import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/placeholder/error_placeholder_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/components/section_title_view.dart';
import '../../support/utils/localize.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  bool get moviesHasError;
  bool get moviesIsLoading;
  String get moviesErrorMessage;
  List<MovieItemViewModelProtocol> get popularMovies;
  List<MovieItemViewModelProtocol> get topRatedMovies;
  List<MovieItemViewModelProtocol> get upcomingMovies;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return _handleMoviesStateWidget(context);
        },
      ),
    );
  }

  Widget _handleMoviesStateWidget(BuildContext context) {
    final l10n = Localize.instance.l10n;

    if (viewModel.moviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.moviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.moviesErrorMessage);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _carouselMoviesWidget(context),
            const SizedBox(height: 16),
            SectionTitleView(title: l10n.topRatedMoviesLabel),
            MovieHorizontalList(movies: viewModel.topRatedMovies),
            const SizedBox(height: 16),
            SectionTitleView(title: l10n.popularMoviesLabel),
            MovieHorizontalList(movies: viewModel.popularMovies),
            const SizedBox(height: 16),
            SectionTitleView(title: l10n.upcomingMoviesLabel),
            MovieHorizontalList(movies: viewModel.upcomingMovies),
          ],
        ),
      ),
    );
  }

  Widget _carouselMoviesWidget(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
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
}
