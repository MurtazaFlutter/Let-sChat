import 'package:flutter/cupertino.dart';

class GroupsSliderController extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}
