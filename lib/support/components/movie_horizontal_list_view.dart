import 'package:flutter/material.dart';

import '../../features/home/items/home_item_view.dart';
import '../style/app_colors.dart';
import '../style/app_fonts.dart';
import '../utils/localize.dart';

class MovieHorizontalList extends StatelessWidget {
  final List<HomeItemViewModelProtocol> popularMovies;

  const MovieHorizontalList({
    super.key,
    required this.popularMovies,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;
    final width = MediaQuery.of(context).size.width;

    return ConstrainedBox(
      constraints: const BoxConstraints(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, bottom: 30),
            child: Text(
              l10n.popularMoviesLabel,
              style: AppFonts.montserratSemibold(20, AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: width / 1.4,
            child: ListView.builder(
              itemCount: popularMovies.length,
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
                      child: HomeItemView(viewModel: popularMovies[index]),
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
