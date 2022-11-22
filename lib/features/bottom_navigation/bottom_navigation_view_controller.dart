import 'package:flutter/material.dart';

import 'bottom_navigation_view.dart';

abstract class BottomNavigationViewControllerProtocol extends BottomNavigationViewModelProtocol {}

class BottomNavigationViewController extends StatefulWidget {
  final BottomNavigationViewControllerProtocol viewModel;

  const BottomNavigationViewController({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() {
    return _BottomNavigationViewControllerState();
  }
}

class _BottomNavigationViewControllerState extends State<BottomNavigationViewController> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationView(viewModel: widget.viewModel);
  }
}
