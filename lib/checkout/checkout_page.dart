import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/data/order.dart';
import 'package:everything_provider/data/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<OrderRepository, Order>(
      selector: (context, repo) => repo.currentOrder,
      builder: (context, order, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Receipt'),
          ),
          body: Center(
            child: Receipt(order),
          ),
        );
      },
    );
  }
}
