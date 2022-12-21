import 'package:flutter/material.dart';

import 'details_view.dart';
import 'di/details_factory.dart';

abstract class DetailsViewProtocol extends DetailsViewModelProtocol {
  void getMovieDetails();
  void getSimilarMovies();
  void Function()? onTapBack;
  void Function(int movieId)? onTapMovie;
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
    _bind();
    widget.viewModel.getMovieDetails();
    widget.viewModel.getSimilarMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapMovie = (movieId) {
      Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: movieId);
    };
    widget.viewModel.onTapBack = () {
      Navigator.pop(context);
    };
  }
}
