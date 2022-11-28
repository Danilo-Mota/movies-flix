import 'package:flutter/material.dart';

import '../../support/components/movie_horizontal_list_view.dart';
import 'items/home_item_view.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  List<HomeItemViewModelProtocol> get popularMovies;
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
                  children: [
                    const SizedBox(height: 27),
                    _popularMovies()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _popularMovies() {
    return MovieHorizontalList(popularMovies: viewModel.popularMovies);
  }
}
