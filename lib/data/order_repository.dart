import 'dart:async';
import 'dart:collection';

import 'package:everything_provider/data/order.dart';

import 'food.dart';

class OrderRepository {
  final _streamController = StreamController<Order>.broadcast();
  Order _currentOrder;

  OrderRepository() {
    _currentOrder = Order(HashMap());
    _streamController.add(_currentOrder);
  }

  Order get currentOrder => _currentOrder;

  Stream<Order> get orderStream => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  void addFood(Food food) {
    _currentOrder = _currentOrder.plusFood(food);
    _currentOrder = Order(_currentOrder.getOrderedFood());
    _streamController.add(_currentOrder);
  }

  void cleanOrder() {
    _currentOrder = Order(HashMap());
    _streamController.add(_currentOrder);
  }
}
