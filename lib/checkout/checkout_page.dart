import 'package:everything_provider/checkout/receipt_card.dart';
import 'package:everything_provider/changenotifier/order_change_notifier.dart';
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
        child: Consumer<OrderChangeNotifier>(
          builder: (context, notifier, _) {
            return Receipt(notifier.order);
          },
        ),
      ),
    );
  }
}
