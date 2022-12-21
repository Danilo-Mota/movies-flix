import 'package:flutter/material.dart';

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
  @override
  void initState() {
    _bind();
    _getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onTapMovie = (movieId) {
      Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: movieId);
    };
  }

  void _getMovies() {
    widget.viewModel.getPopularMovies();
    widget.viewModel.getTopRatedMovies();
    widget.viewModel.getUpcomingMovies();
  }
}
