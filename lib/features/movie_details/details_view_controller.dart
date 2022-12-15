import 'package:flutter/material.dart';

import 'details_view.dart';

abstract class DetailsViewProtocol extends DetailsViewModelProtocol {
  void getMovieDetails();
  void getSimilarMovies();
}

class DetailsViewController extends StatefulWidget {
  final DetailsViewProtocol viewModel;

  const DetailsViewController({super.key, required this.viewModel});

  @override
  State<DetailsViewController> createState() => _DetailsViewControllerState();
}

class _DetailsViewControllerState extends State<DetailsViewController> {
  @override
  void initState() {
    widget.viewModel.getMovieDetails();
    widget.viewModel.getSimilarMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsView(viewModel: widget.viewModel);
  }
}
