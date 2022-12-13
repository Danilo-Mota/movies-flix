import 'package:flutter/material.dart';

import '../../support/components/placeholder/loading_placeholder_view.dart';

abstract class DetailsViewModelProtocol with ChangeNotifier {
  String? get title;
  String get overview;
  String get posterPath;
  bool get hasDetailsError;
  bool get isDetailsLoading;
  String get detailsErrorMessage;
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
          return test();
        },
      ),
    );
  }

  Widget test() {
    if (viewModel.isDetailsLoading) return const LoadingPlaceholderView();
    return Column(
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
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
