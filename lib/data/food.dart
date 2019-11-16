import 'package:flutter/foundation.dart';

class Food {
  final String name;
  final String imageUrl;
  final double price;

  const Food({
    @required this.name,
    @required this.imageUrl,
    @required this.price,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Food &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            imageUrl == other.imageUrl &&
            price == other.price;
  }

  @override
  int get hashCode {
    return name.hashCode ^ imageUrl.hashCode ^ price.hashCode;
  }

  @override
  String toString() {
    return 'Food{name: $name, imageUrl: $imageUrl, price: $price}';
  }
}
