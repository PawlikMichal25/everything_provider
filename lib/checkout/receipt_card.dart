import 'package:everything_provider/change_notifier/order_change_notifier.dart';
import 'package:everything_provider/commons/formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OrderChangeNotifier>(
          builder: (context, notifier, _) {
            return Text(
              Formatter.getReceiptFrom(notifier.order),
              style: TextStyle(fontSize: 18.0),
            );
          },
        ),
      ),
    );
  }
}
