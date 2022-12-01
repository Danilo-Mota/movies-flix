import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_image.dart';
import '../../support/utils/localize.dart';
import '../home/di/home_factory.dart';

abstract class BottomNavigationViewModelProtocol with ChangeNotifier {
  int get currentIndex;

  void didTapSelectedIndex(int index);
}

class BottomNavigationView extends StatelessWidget {
  final BottomNavigationViewModelProtocol viewModel;
  final StatefulWidget homeView = HomeFactory.home();

  BottomNavigationView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: [
              homeView
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.blackLight,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.didTapSelectedIndex,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.green,
            items: [
              _bottomNavigationBarItem(l10n.homeTitle, AppImage.icHomePath),
              _bottomNavigationBarItem(l10n.searchTitle, AppImage.icMagnifierPath),
              _bottomNavigationBarItem(l10n.profileTitle, AppImage.icProfilePath),
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
}
