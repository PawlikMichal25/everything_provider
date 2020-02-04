import 'package:everything_provider/data/food.dart';
import 'package:everything_provider/changenotifier/order_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFoodButton extends StatelessWidget {
  final Food food;

  const AddFoodButton(this.food);

  @override
  Widget build(BuildContext context) {
    OrderChangeNotifier notifier = Provider.of(context, listen: false);
    return RaisedButton(
      color: Colors.amber,
      onPressed: () => _onPressed(notifier, food),
      child: Text(
        'Add',
        style: TextStyle(fontSize: 18.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  void _onPressed(OrderChangeNotifier notifier, Food food) {
    notifier.addFood(food);
  }
}
