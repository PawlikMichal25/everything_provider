import 'dart:collection';

import 'package:everything_provider/change_notifier/order.dart';
import 'package:flutter/foundation.dart';

import '../data/food.dart';

class OrderChangeNotifier extends ChangeNotifier {
  Order _order;

  OrderChangeNotifier() {
    _order = Order(HashMap());
  }

  Order get order => _order;

  void addFood(Food food) {
    _order = _order.plusFood(food);
    notifyListeners();
  }

  void cleanOrder() {
    _order = Order(HashMap());
    notifyListeners();
  }
}
