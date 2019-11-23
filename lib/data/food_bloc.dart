import 'package:everything_provider/data/food.dart';

class FoodBloc {
  static final _instance = FoodBloc();

  static FoodBloc get getInstance => _instance;

  List<Food> getMenu() {
    return [
      Food(
        name: 'Hamburger',
        imageUrl: 'https://static.cuisineaz.com/400x320/i99425-hamburger.jpg',
        price: 4.0,
      ),
      Food(
        name: 'Fish & Chips',
        imageUrl:
            'https://lovefoodies.com/wp-content/uploads/2015/05/Fish-and-chips-FG4-720x540.jpg',
        price: 5.0,
      ),
      Food(
        name: 'Pizza',
        imageUrl:
            'https://img.buzzfeed.com/thumbnailer-prod-us-east-1/dc23cd051d2249a5903d25faf8eeee4c/BFV36537_CC2017_2IngredintDough4Ways-FB.jpg',
        price: 6.0,
      ),
      Food(
        name: 'Spaghetti',
        imageUrl:
            'https://www.kitchensanctuary.com/wp-content/uploads/2019/09/Spaghetti-Bolognese-square-FS-0204.jpg',
        price: 3.50,
      ),
      Food(
        name: 'Pad Thai',
        imageUrl:
            'https://realhousemoms.com/wp-content/uploads/One-Pot-Pad-Thai-IG.jpg',
        price: 5.50,
      ),
      Food(
        name: 'Ramen',
        imageUrl:
            'https://www.theflavorbender.com/wp-content/uploads/2019/01/Easy-Chicken-Ramen-Featured.jpg',
        price: 6.0,
      ),
      Food(
        name: 'Bibimbap',
        imageUrl:
            'https://thewoksoflife.com/wp-content/uploads/2017/05/bibimbap-recipe-13.jpg',
        price: 4.50,
      ),
    ];
  }
}
