import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/data/order_repository.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final OrderRepository _orderRepository = OrderRepository.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Receipt(_orderRepository.currentOrder),
      ),
    );
  }
}
