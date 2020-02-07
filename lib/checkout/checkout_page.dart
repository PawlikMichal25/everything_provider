import 'package:everything_provider/change_notifier/order.dart';
import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final Order _order;

  const CheckoutPage(this._order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Receipt(_order),
      ),
    );
  }
}
