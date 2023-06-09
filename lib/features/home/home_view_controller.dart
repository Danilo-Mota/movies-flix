import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../injection.dart';
import 'home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getPopularMovies();
  void getTopRatedMovies();
  void getUpcomingMovies();
  void Function(int movieId)? onTapMovie;
}

class HomeViewController extends StatefulWidget {
  static const String route = '/home';

  const HomeViewController({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewController();
}

class _HomeViewController extends State<HomeViewController> {
  final HomeViewProtocol viewModel = getIt.get<HomeViewProtocol>();

  @override
  void initState() {
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
      GoRouter.of(context).goNamed('/details', extra: movieId);
      //Navigator.pushNamed(context, MovieDetailsFactory.route, arguments: movieId);
    };
  }

  void _getMovies() {
    viewModel.getPopularMovies();
    viewModel.getTopRatedMovies();
    viewModel.getUpcomingMovies();
  }
}
