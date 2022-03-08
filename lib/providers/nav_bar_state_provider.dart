import 'package:flutter/widgets.dart';

class NavBarStateProvider extends ChangeNotifier {
  bool isVisible = true;
  getNavState() {
    return isVisible;
  }

  setNavState(bool state) {
    isVisible = state;
    notifyListeners();
  }
}
