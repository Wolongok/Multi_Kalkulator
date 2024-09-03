import 'package:flutter/foundation.dart';
import 'package:kalkulator_flutter/model/model_aritmatik.dart';

class ItemProviderAritmatik with ChangeNotifier {
  ModelAritmatika? _selectedItem;

  ModelAritmatika? get selectedItem => _selectedItem;

  void selectItem(ModelAritmatika item) {
    _selectedItem = item;
    notifyListeners();
  }
}