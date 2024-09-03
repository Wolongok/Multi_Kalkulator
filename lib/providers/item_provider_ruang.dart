import 'package:flutter/foundation.dart';
import '../model/model_ruang.dart';

class ItemProviderRuang with ChangeNotifier {
  ModelRuang? _selectedItem;

  ModelRuang? get selectedItem => _selectedItem;

  void selectItem(ModelRuang item) {
    _selectedItem = item;
    notifyListeners();
  }
}