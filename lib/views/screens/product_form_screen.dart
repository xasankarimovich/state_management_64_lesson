import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/products_controller.dart';
import '../../models/product.dart';
import 'dart:math';

class ProductFormScreen extends StatelessWidget {
  final Product? product;

  ProductFormScreen({this.product, super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductsController>(context, listen: false);

    if (product != null) {
      titleController.text = product!.title;
      priceController.text = product!.price.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product == null ? 'Mahsulot qo\'shish' : 'Mahsulot tahrirlash'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Mahsulot nomi'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Narxi'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = Product(
                  id: product?.id ?? Random().nextInt(10000).toString(),
                  title: titleController.text,
                  price: double.parse(priceController.text),
                  color: product?.color ?? Colors.primaries[Random().nextInt(Colors.primaries.length)],
                );

                if (product == null) {
                  productController.addProduct(newProduct);
                } else {
                  productController.editProduct(product!.id, newProduct);
                }

                Navigator.of(context).pop();
              },
              child: Text(product == null ? 'Qo\'shish' : 'Tahrirlash'),
            ),
          ],
        ),
      ),
    );
  }
}
