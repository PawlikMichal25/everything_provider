import 'package:everything_provider/data/order.dart';
import 'package:everything_provider/data/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../checkout/checkout_page.dart';
import 'menu_list.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderRepository>(
      builder: (context, orderRepository, _) {
        return StreamProvider<Order>.value(
          value: orderRepository.orderStream,
          initialData: orderRepository.currentOrder,
          child: Scaffold(
            appBar: AppBar(title: _buildTitle()),
            body: MenuList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _onFabClicked(context),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Consumer<Order>(
      builder: (context, order, _) => Text(
        'Total: ${order.getTotal()} \$',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  void _onFabClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => CheckoutPage()),
    );
  }
}
