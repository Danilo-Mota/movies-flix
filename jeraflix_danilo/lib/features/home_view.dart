import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../support/style/app_colors.dart';
import '../support/utils/constants.dart';
import '../support/utils/localize.dart';

abstract class HomeViewModelProtocol with ChangeNotifier {
  int get currentIndex;

  void didClickSelectedIndex(int index);
}

class HomeView extends StatelessWidget {
  final HomeViewModelProtocol viewModel;

  const HomeView({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: IndexedStack(
            index: viewModel.currentIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.didClickSelectedIndex,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.green,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: l10n.home,
                  activeIcon: SvgPicture.asset(Constants.icHomePath, color: AppColors.green),
                  icon: SvgPicture.asset(Constants.icHomePath)), 
              BottomNavigationBarItem(
                  label: l10n.search,
                  activeIcon: SvgPicture.asset(Constants.icSearchPath, color: AppColors.green),
                  icon: SvgPicture.asset(Constants.icSearchPath)),
              BottomNavigationBarItem(
                  label: l10n.profile,
                  activeIcon: SvgPicture.asset(Constants.icProfilePath, color: AppColors.green),
                  icon: SvgPicture.asset(Constants.icProfilePath)),
            ],
          ),
        );
      },
    );
  }
}
