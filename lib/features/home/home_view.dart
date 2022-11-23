import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {

        return const Scaffold(
          backgroundColor: AppColors.green,
        );
      }
 
}
