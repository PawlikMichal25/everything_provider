import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/data/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receipt'),
      ),
      body: Center(
        child: Consumer<OrderRepository>(
          builder: (context, repo, _) {
            return Receipt(repo.currentOrder);
          },
        ),
      ),
    );
  }
}
