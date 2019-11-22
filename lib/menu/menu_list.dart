import 'package:everything_provider/data/food.dart';
import 'package:everything_provider/data/food_repository.dart';
import 'package:flutter/material.dart';

import 'add_food_button.dart';

class MenuList extends StatelessWidget {
  final List<Food> _menu = FoodRepository.getMenu();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menu.length,
      itemBuilder: (context, index) {
        return buildTile(_menu[index]);
      },
    );
  }

  Widget buildTile(Food food) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(
              food.imageUrl,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              food.name,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${food.price} \$",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AddFoodButton(food),
        ),
      ],
    );
  }
}
