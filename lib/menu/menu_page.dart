import 'package:everything_provider/data/food.dart';
import 'package:everything_provider/data/food_repository.dart';
import 'package:everything_provider/data/order_repository.dart';
import 'package:flutter/material.dart';

import '../checkout/checkout_page.dart';

class MenuPage extends StatelessWidget {
  final _orderRepository = OrderRepository.getInstance;
  final _foodRepository = FoodRepository.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _buildTitle()),
      body: _buildMenuList(_foodRepository.getMenu()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabClicked(context),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildTitle() {
    return StreamBuilder(
      initialData: _orderRepository.currentOrder,
      stream: _orderRepository.orderStream,
      builder: (_, snapshot) {
        double total = 0;
        if (snapshot.data != null) {
          total = snapshot.data.getTotal();
        }
        return Text(
          'Total: $total \$',
          style: TextStyle(fontSize: 16.0),
        );
      },
    );
  }

  Widget _buildMenuList(List<Food> menu) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (context, index) {
        return buildTile(menu[index]);
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
    _orderRepository.addFood(food);
  }

  void _onFabClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => CheckoutPage()),
    );
  }
}
