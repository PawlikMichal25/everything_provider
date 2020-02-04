import 'package:everything_provider/data/order.dart';
import 'package:everything_provider/data/order_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../checkout/checkout_page.dart';
import 'menu_list.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _buildTitle()),
      body: MenuList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabClicked(context),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget _buildTitle() {
    return Selector<OrderChangeNotifier, Order>(
      selector: (context, notifier) => notifier.order,
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
