import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../controllers/products_controller.dart';
import '../../controllers/cart_controller.dart';
import '../screens/product_form_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ListTile(
      leading: Container(
        width: 60,
        color: product.color,
      ),
      title: Text(
        product.title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        "\$${product.price}",
      ),
      trailing: Consumer<CartController>(
        builder: (ctx, cartController, child) {
          return cartController.isProductInCart(product.id)
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  cartController.removeFromCart(product.id);
                },
                icon: const Icon(Icons.remove_circle),
              ),
              Text(
                cartController.getProductAmount(product.id).toString(),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  cartController.addToCart(product);
                },
                icon: const Icon(Icons.add_circle),
              ),
            ],
          )
              : IconButton(
            onPressed: () {
              cartController.addToCart(product);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          );
        },
      ),
      onLongPress: () {
        _showEditDeleteDialog(context, product);
      },
    );
  }

  void _showEditDeleteDialog(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(product.title),
          content: Text("Tanlang:"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ProductFormScreen(product: product),
                  ),
                );
              },
              child: const Text("Tahrirlash"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<ProductsController>(context, listen: false)
                    .removeProduct(product.id);
                Navigator.of(ctx).pop();
              },
              child: const Text("O'chirish"),
            ),
          ],
        );
      },
    );
  }
}
