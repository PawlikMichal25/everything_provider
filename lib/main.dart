import 'package:everything_provider/data/order_repository.dart';
import 'package:everything_provider/data/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<OrderRepository>(
      builder: (context) => OrderRepository(),
      dispose: (context, repo) => repo.dispose(),
      child: MaterialApp(
        title: 'Restaurant',
        theme: Styles.appTheme,
        debugShowCheckedModeBanner: false,
        home: MenuPage(),
      ),
    );
  }
}
