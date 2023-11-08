import 'package:flutter/material.dart';
import 'package:satlock_proof_work/inventory.dart';

import 'package:satlock_proof_work/product.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Inventory inventoryManager;
  @override
  void initState() {
    super.initState();
    List<Product> initialProducts = [
      Product(id: 1, name: "Product 1", price: 5000, quantity: 52),
      Product(id: 2, name: "Product 2", price: 745, quantity: 74),
      Product(id: 3, name: "Product 3", price: 4588, quantity: 122),
    ];
    inventoryManager = Inventory(products: initialProducts);
  }

  void addProduct(Product productNew) {
    setState(() {
      inventoryManager.addProduct(productNew);
    });
  }

  void deleteProduct(int id) {
    setState(() {
      inventoryManager.deleteProduct(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text('Productos Satlock'),
              Text(
                  'Valor total inventario: ${inventoryManager.totalValueState}')
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: inventoryManager.products.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: GestureDetector(
                  onTap: () =>
                      deleteProduct(inventoryManager.products[index].id),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                title: Text(inventoryManager.products[index].name),
                subtitle: Text(
                    'Precio: ${inventoryManager.products[index].price} - Cantidad en stock: ${inventoryManager.products[index].quantity}'),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => addProduct(
                Product(id: 4, name: 'New Product', price: 20.0, quantity: 10)),
            child: const Icon(Icons.add)),
      ),
    );
  }
}
