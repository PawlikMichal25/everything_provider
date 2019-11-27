import 'package:everything_provider/commons/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:everything_provider/data/order_bloc.dart';
import 'menu/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: Styles.appTheme,
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}
