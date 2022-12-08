import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'movies_item/movie_item_view.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<MovieItemViewModelProtocol> movies;

  const MovieHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.3,
      child: ListView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return SizedBox(
            width: width * 0.4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: MovieItemView(
                viewModel: movies[index],
                itemType: Constants.movieItemType,
              ),
            ),
          );
        },
      ),
    );
  }
}
