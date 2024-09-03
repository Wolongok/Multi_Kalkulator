import 'package:flutter/foundation.dart';
import '../model/model_datar.dart';

class ItemProvider with ChangeNotifier {
  ModelDatar? _selectedItem;

  ModelDatar? get selectedItem => _selectedItem;

  void selectItem(ModelDatar item) {
    _selectedItem = item;
    notifyListeners();
  }
}