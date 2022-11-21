import 'home_view_controller.dart';

class HomeViewModel extends HomeViewControllerProtocol {

  int _currentIndex = 0;

  @override
  int get currentIndex => _currentIndex;

  @override
  void didClickSelectedIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
