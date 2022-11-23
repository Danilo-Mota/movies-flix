import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeViewControllerProtocol extends HomeViewModelProtocol {}

class HomeViewController extends StatefulWidget {
  final HomeViewControllerProtocol viewModel;

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _HomeViewController();
}

class _HomeViewController extends State<HomeViewController> {

  @override
  void initState() {
    super.initState();
    //implementar a função _bind()
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }
}
