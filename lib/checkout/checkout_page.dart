import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/data/order_bloc.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  final OrderBloc _orderBloc = OrderBloc.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Receipt(_orderBloc.currentOrder),
      ),
    );
  }
}
