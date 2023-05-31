import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_image.dart';
import '../../support/utils/localize.dart';
import '../home/di/home_factory.dart';
import '../search/di/search_factory.dart';

abstract class BottomNavigationViewModelProtocol with ChangeNotifier {
  int get currentIndex;

  void didTapSelectedIndex(int index);
}

class BottomNavigationView extends StatelessWidget {
  final BottomNavigationViewModelProtocol viewModel;
  final StatefulNavigationShell navigationShell;
  //final StatefulWidget homeView = HomeFactory.home();
  //final StatefulWidget searchView = SearchFactory.search();

  BottomNavigationView({super.key, required this.viewModel, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.blackLight,
            currentIndex: navigationShell.currentIndex,
            onTap: (int index) => _onTap(context, index),
            showUnselectedLabels: false,
            selectedItemColor: AppColors.green,
            items: [
              _bottomNavigationBarItem(l10n.homeTitle, AppImage.icHomePath),
              _bottomNavigationBarItem(l10n.searchTitle, AppImage.icMagnifierPath),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String label, String iconPath) {
    return BottomNavigationBarItem(
      label: label,
      activeIcon: SvgPicture.asset(iconPath, color: AppColors.green),
      icon: SvgPicture.asset(iconPath),
    );
  }

    void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

}
