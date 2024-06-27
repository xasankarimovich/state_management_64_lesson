import 'package:dars64_statemanagement/views/screens/product_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/products_controller.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';
import 'order_screen.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Provider.of<ProductsController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("D I N A M O"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const CartScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return const OrderScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.list.length,
        itemBuilder: (ctx, index) {
          final product = productsController.list[index];
          return ChangeNotifierProvider.value(
            value: product,
            child: ProductItem(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ProductFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
