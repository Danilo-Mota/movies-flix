import 'package:flutter/material.dart';

abstract class DetailsViewModelProtocol with ChangeNotifier {
  String get title;
  String get overview;
  String get posterPath;
}

class DetailsView extends StatelessWidget {
  final DetailsViewModelProtocol viewModel;

  const DetailsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return SingleChildScrollView(
            child: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
