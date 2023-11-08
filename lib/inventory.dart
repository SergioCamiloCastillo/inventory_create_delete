import 'package:satlock_proof_work/product.dart';

class Inventory {
  late List<Product> products;
  late double totalValueState;

  Inventory({required this.products}) {
    totalValueState = _calculateTotalValue();
  }
  void addProduct(Product productNew) {
    products.add(productNew);

    totalValueState = _calculateTotalValue();
  }

  void deleteProduct(int id) {
    products.removeWhere((element) => element.id == id);
    totalValueState = _calculateTotalValue();
  }

  double _calculateTotalValue() {
    double totalValue = 0;
    for (var product in products) {
      totalValue += product.price * product.quantity;
    }
    return totalValue;
  }
}
