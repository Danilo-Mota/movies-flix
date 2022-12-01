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
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, bottom: 28),
              child: Text(
                sectionTitle,
                style: AppFonts.montserratSemibold(16, AppColors.white),
                textAlign: TextAlign.start,
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return SizedBox(
                    width: width * 0.4,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child:  MovieItemView(viewModel: movies[index]),
                      )
                  );
                },
              ),
            ),
          ],
      ),
    );
  }
}
