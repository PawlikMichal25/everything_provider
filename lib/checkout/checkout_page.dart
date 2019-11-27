import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/data/order.dart';
import 'package:everything_provider/data/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:everything_provider/data/order_bloc.dart';

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
