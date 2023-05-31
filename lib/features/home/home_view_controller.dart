import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../movie_details/di/details_factory.dart';
import 'home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getPopularMovies();
  void getTopRatedMovies();
  void getUpcomingMovies();
  void Function(int movieId)? onTapMovie;
}

class HomeViewController extends StatefulWidget {
  final HomeViewProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _HomeViewController();
}

class _HomeViewController extends State<HomeViewController> {
  late final HomeViewProtocol viewModel;

  @override
  void initState() {
    viewModel = widget.viewModel;
    _bind();
    _getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: viewModel);
  }

  void _bind() {
    viewModel.onTapMovie = (movieId) {
      GoRouter.of(context).go('/a/details', extra: movieId);
      //Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: movieId);
    };
  }

  void _getMovies() {
    viewModel.getPopularMovies();
    viewModel.getTopRatedMovies();
    viewModel.getUpcomingMovies();
  }
}
