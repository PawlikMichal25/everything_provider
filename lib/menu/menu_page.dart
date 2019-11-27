import 'package:everything_provider/data/food.dart';
import 'package:everything_provider/data/food_bloc.dart';
import 'package:everything_provider/data/order.dart';
import 'package:everything_provider/data/order_bloc.dart';
import 'package:flutter/material.dart';

import '../checkout/checkout_page.dart';

class MenuPage extends StatelessWidget {
  final _orderBloc = OrderBloc.getInstance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: _orderBloc.currentOrder,
      stream: _orderBloc.orderStream,
      builder: (_, snapshot) {
        final Order order = snapshot.data;
        return Scaffold(
          appBar: AppBar(title: _buildTitle(order)),
          body: _buildMenuList(FoodBloc.getMenu()),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _onFabClicked(context),
            child: Icon(Icons.shopping_cart),
          ),
        );
      },
    );
  }

  Widget _buildTitle(Order order) {
    double total = order.getTotal();
    return Text(
      'Total: $total \$',
      style: TextStyle(fontSize: 16.0),
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
    _orderBloc.addFood(food);
  }

  void _onFabClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => CheckoutPage()),
    );
  }
}
