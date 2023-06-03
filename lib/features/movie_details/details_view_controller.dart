import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'details_view.dart';

abstract class DetailsViewProtocol extends DetailsViewModelProtocol {
  void getMovieDetails();
  void getSimilarMovies();
  void Function()? onTapBack;
  void Function(int movieId)? onTapMovie;
}

class DetailsViewController extends StatefulWidget {
  final DetailsViewProtocol viewModel;
  static const String route = '/details';
  static const String routePath = 'details';

  const DetailsViewController({super.key, required this.viewModel});

  @override
  State<DetailsViewController> createState() => _DetailsViewControllerState();
}

class _DetailsViewControllerState extends State<DetailsViewController> {
  late final DetailsViewProtocol viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    _bind();
    widget.viewModel.getMovieDetails();
    widget.viewModel.getSimilarMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailsView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapMovie = (movieId) {
      GoRouter.of(context).pushNamed('/details', extra: movieId);
    };
    viewModel.onTapBack = () {
      Navigator.pop(context);
    };
  }
}
