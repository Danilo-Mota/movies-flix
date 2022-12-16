import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import '../../support/utils/localize.dart';

abstract class SearchViewModelProtocol with ChangeNotifier {
  void getSearchedMovies(String text);
}

class SearchView extends StatelessWidget {
  final SearchViewModelProtocol viewModel;

  const SearchView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _searchFieldWidget(),
          ],
        ),
      ),
    );
  }

  Widget _searchFieldWidget() {
    final l10n = Localize.instance.l10n;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: (text) {
          viewModel.getSearchedMovies(text);
        },
        style: AppFonts.nunitoBold(16, AppColors.black),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: l10n.searchMovieLabel,
          hintStyle: AppFonts.nunitoBold(16, AppColors.black),
        ),
      ),
    );
  }
}
