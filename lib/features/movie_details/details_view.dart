import 'package:flutter/material.dart';

import '../../support/components/placeholder/loading_placeholder_view.dart';
import 'items/genres_item_view.dart';

abstract class DetailsViewModelProtocol with ChangeNotifier {
  String get title;
  String get overview;
  String get posterPath;
  bool get hasDetailsError;
  bool get isDetailsLoading;
  String get detailsErrorMessage;
  List<GenresViewModelProtocol> get genres;
}

class DetailsView extends StatelessWidget {
  final DetailsViewModelProtocol viewModel;

  const DetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return _detailsWidgets();
        },
      ),
    );
  }

  Widget _detailsWidgets() {
    if (viewModel.isDetailsLoading) return const LoadingPlaceholderView();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Image.network(
              viewModel.posterPath,
              fit: BoxFit.fill,
            ),
          ),
          Flexible(
            flex: 2,
            child: ListView.builder(
              itemCount: viewModel.genres.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return GenresItemView(viewModel: viewModel.genres[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
