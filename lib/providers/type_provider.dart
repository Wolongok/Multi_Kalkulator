import 'package:flutter/foundation.dart';
import '../model/model_type.dart';


class TypeProvider with ChangeNotifier {
  ModelType? _selectedType;

  ModelType? get selectedType => _selectedType;

  void selectItem(ModelType item) {
    _selectedType = item;
    notifyListeners();
  }
}