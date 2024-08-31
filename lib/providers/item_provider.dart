import 'package:flutter/foundation.dart';
import '../model/model.dart';

class ItemProvider with ChangeNotifier {
  ModelRuang? _selectedItem;

  ModelRuang? get selectedItem => _selectedItem;

  void selectItem(ModelRuang item) {
    _selectedItem = item;
    notifyListeners();
  }
}