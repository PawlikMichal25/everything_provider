import 'dart:collection';

import 'package:everything_provider/data/food.dart';
import 'package:collection/collection.dart';

class Order {
  final HashMap<Food, int> _ordered;

  const Order(this._ordered);

  Map<Food, int> getOrderedFood() => _ordered;

  Order plusFood(Food food) {
    final HashMap<Food, int> newOrdered = HashMap.from(_ordered);
    if (newOrdered.containsKey(food)) {
      newOrdered[food] = newOrdered[food] + 1;
    } else {
      newOrdered[food] = 1;
    }

    return Order(newOrdered);
  }

  double getTotal() {
    double total = 0.0;
    for (Food food in _ordered.keys) {
      total += food.price * _ordered[food];
    }
    return total;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order && runtimeType == other.runtimeType && MapEquality<Food, int>().equals(_ordered, other._ordered);

  @override
  int get hashCode => _ordered.hashCode;
}
