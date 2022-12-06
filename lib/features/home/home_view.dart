import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import '../../support/components/movies_item/movie_item_view.dart';
import '../../support/components/placeholder/error_placeholder_view.dart';
import '../../support/components/placeholder/loading_placeholder_view.dart';
import '../../support/components/section_title_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
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
                  _carouselMovies(context),
                  const SizedBox(height: 16),
                  SectionTitleView(title: l10n.topRatedMoviesLabel),
                  _topRatedMovies(),
                  const SizedBox(height: 20),
                  SectionTitleView(title: 'Sugestões para você'),
                  _suggestedMovies(),
                  const SizedBox(height: 32),
                  SectionTitleView(title: l10n.popularMoviesLabel),
                  _popularMovies(),
                  const SizedBox(height: 20),
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

  Widget _carouselMovies(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (viewModel.popularMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.popularMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.popularMoviesErrorMessage);
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.55,
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

  Widget _suggestedMovies() {
    if (viewModel.upcomingMoviesIsLoading) return const LoadingPlaceholderView();
    if (viewModel.upcomingMoviesHasError) {
      return ErrorPlaceholderView(errorMessage: viewModel.upcomingMoviesErrorMessage);
    }

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: viewModel.upcomingMovies.map(
        (upcomingMoviesSlider) {
          return Stack(
            children: [
              Container(decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(6))),
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image(
                    image: CachedNetworkImageProvider('${Constants.imageBaseURL}${upcomingMoviesSlider.posterPath}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ); // child:
        },
      ).toList(),
    );
  }
}
