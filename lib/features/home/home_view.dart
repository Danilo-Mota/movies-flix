import 'package:flutter/material.dart';

import '../../support/components/movies_item/movie_horizontal_list_view.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/components/movies_item/movie_item_view.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  String get errorMessage;
  bool get isLoading;
  bool get hasError;
  List<MovieItemViewHolderProtocol> get popularMovies;
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const SizedBox(height: 28), _popularMovies()],
                ),
              ),
            ),
          );
        });
  }

  Widget _popularMovies() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.white,
        ),
      );
    } else if(viewModel.hasError) {
        return Center(
        child: Text(
         viewModel.errorMessage,
         style: AppFonts.montserratSemibold(14, AppColors.white),
        ),
      );
    }
    return MovieHorizontalList(movies: viewModel.popularMovies);
  }
}
