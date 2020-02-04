import 'package:everything_provider/changenotifier/order.dart';

class Formatter {
  static String getReceiptFrom(Order order){
    String receipt = "Your order:\n";
    order
        .getOrderedFood()
        .forEach((food, count) => receipt += "  ${food.name}: $count\n");

    receipt += "\nTotal: ${order.getTotal()}";
    return receipt;
  }
}