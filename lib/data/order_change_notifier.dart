import 'dart:async';
import 'dart:collection';

import 'package:everything_provider/data/order.dart';
import 'package:flutter/foundation.dart';

import 'food.dart';

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
