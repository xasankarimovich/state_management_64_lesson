import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/order_controller.dart';
import '../../models/product.dart';
import '../widgets/product_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    final orderController = Provider.of<OrderController>(context, listen: false);

    final products = cartController.cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("S A V A T C H A"),
      ),
      body: products.isEmpty
          ? const Center(
        child: Text("Savatchangiz bo'sh. Mahsulot qo'shing!"),
      )
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products.values.toList()[index]['product'];
          return ChangeNotifierProvider<Product>.value(
            value: product,
            child: const ProductItem(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          orderController.addOrder(products.values.map((e) => e['product'] as Product).toList());
          cartController.clearCart();
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.amber,
        extendedPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        label: Text(
          "\$${cartController.totalPrice}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
