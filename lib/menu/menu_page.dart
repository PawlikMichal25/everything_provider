import 'package:everything_provider/data/food.dart';
import 'package:everything_provider/data/food_repository.dart';
import 'package:everything_provider/data/menu.dart';
import 'package:everything_provider/changenotifier/order.dart';
import 'package:everything_provider/changenotifier/order_change_notifier.dart';
import 'package:flutter/material.dart';

import '../checkout/checkout_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final _orderChangeNotifier = OrderChangeNotifier();

  final _foodRepository = FoodRepository();

  @override
  void initState() {
    _orderChangeNotifier.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Order order = _orderChangeNotifier.order;
    return Scaffold(
      appBar: AppBar(title: _buildTitle(order)),
      body: _buildMenuList(_foodRepository.getMenu()),
      floatingActionButton: _buildFAB(context, order),
    );
  }

  Widget _buildTitle(Order order) {
    double total = order.getTotal();
    return Text(
      'Total: $total \$',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildMenuList(Menu menu) {
    return ListView.builder(
      itemCount: menu.food.length,
      itemBuilder: (context, index) {
        return buildTile(menu.food[index]);
      },
    );
  }

  Widget buildTile(Food food) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(
              food.imageUrl,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              food.name,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${food.price} \$",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildAddFoodButton(food),
        ),
      ],
    );
  }

  Widget _buildAddFoodButton(Food food) {
    return RaisedButton(
      color: Colors.amber,
      onPressed: () => _onAddButtonClicked(food),
      child: Text(
        'Add',
        style: TextStyle(fontSize: 18.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  void _onAddButtonClicked(Food food) {
    _orderChangeNotifier.addFood(food);
  }

  Widget _buildFAB(BuildContext context, Order order) {
    return FloatingActionButton(
      onPressed: () => _onFabClicked(context, order),
      child: Icon(Icons.shopping_cart),
    );
  }

  void _onFabClicked(BuildContext context, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => CheckoutPage(order)),
    );
  }
}
