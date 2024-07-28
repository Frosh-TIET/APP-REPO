// society_state.dart
import 'package:flutter/foundation.dart';

class SocietyState extends ChangeNotifier {
  bool _isTechSelected = true;

  bool get isTechSelected => _isTechSelected;

  void toggleView(bool isTech) {
    _isTechSelected = isTech;
    notifyListeners();
  }
}