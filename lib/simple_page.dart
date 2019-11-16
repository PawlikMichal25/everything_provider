import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimplePage extends StatelessWidget {
  final String title = 'Flutter Study Jam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Provider<String>.value(
        value: title,
        child: DescendantWidget(),
      ),
    );
  }
}

class DescendantWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String title = Provider.of<String>(context);
    return Center(
      child: Text(title),
    );
  }
}
