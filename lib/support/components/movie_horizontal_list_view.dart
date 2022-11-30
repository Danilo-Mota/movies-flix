import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';
import 'movies_item/movie_item_view.dart';

class MovieHorizontalList extends StatelessWidget {
  final String sectionTitle;
  final List<MovieItemViewModelProtocol> movies;

  const MovieHorizontalList({
    super.key,
    required this.movies,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 32),
            child: Text(
              sectionTitle,
              style: AppFonts.montserratSemibold(20, AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: width / 1.4,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 154,
                    ),
                    child: SizedBox(
                      width: width / 2.5,
                      child: MovieItemView(viewModel: movies[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
