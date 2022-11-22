import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_image.dart';
import '../../support/utils/localize.dart';

abstract class BottomNavigationViewModelProtocol with ChangeNotifier {
  int get currentIndex;

  void didClickSelectedIndex(int index);
}

class BottomNavigationView extends StatelessWidget {
  final BottomNavigationViewModelProtocol viewModel;

  const BottomNavigationView({Key? key, required this.viewModel}) : super(key: key);

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
            backgroundColor: AppColors.blackLight,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.didClickSelectedIndex,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.green,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: l10n.home,
                  activeIcon: SvgPicture.asset(AppImage.icHomePath, color: AppColors.green),
                  icon: SvgPicture.asset(AppImage.icHomePath)),
              BottomNavigationBarItem(
                  label: l10n.search,
                  activeIcon: SvgPicture.asset(AppImage.icSearchPath, color: AppColors.green),
                  icon: SvgPicture.asset(AppImage.icSearchPath)),
              BottomNavigationBarItem(
                  label: l10n.profile,
                  activeIcon: SvgPicture.asset(AppImage.icProfilePath, color: AppColors.green),
                  icon: SvgPicture.asset(AppImage.icProfilePath)),
            ],
          ),
        );
      },
    );
  }
}
