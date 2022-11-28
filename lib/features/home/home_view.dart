import 'package:flutter/material.dart';

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
          body: SafeArea(
            child: Column(
              children: [
                _popularMovies(context)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _popularMovies(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 278.5,
      ),
      child: SizedBox(
        height: width / 1.4,
        child: ListView.builder(
          itemCount: viewModel.popularMovies.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 153.5,
                ),
                child: SizedBox(
                  width: width / 2.54,
                  child: HomeItemView(viewModel: viewModel.popularMovies[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
