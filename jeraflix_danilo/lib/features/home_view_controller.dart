import 'package:flutter/material.dart';

import 'home_view.dart';

abstract class HomeViewControllerProtocol extends HomeViewModelProtocol {}

class HomeViewController extends StatefulWidget {
  final HomeViewControllerProtocol viewModel;
  static const String route = '/home';

  const HomeViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewControllerState();
  }
}

class _HomeViewControllerState extends State<HomeViewController> {

  @override
  Widget build(BuildContext context) {
    return HomeView(viewModel: widget.viewModel);
  }
}
