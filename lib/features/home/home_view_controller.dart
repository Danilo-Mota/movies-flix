import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeViewProtocol extends HomeViewModelProtocol {
  void getPopularMovies();
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
    widget.viewModel.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }
}
