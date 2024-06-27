import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Provider.of<OrderController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyurtmalar"),
      ),
      body: ListView.builder(
        itemCount: orderController.orders.length,
        itemBuilder: (ctx, index) {
          final order = orderController.orders[index];
          return Card(
            child: ListTile(
              title: Text("Buyurtma ${order.id}"),
              subtitle: Text(
                "Sana: ${order.date}\nMahsulotlar: ${order.products.length}",
              ),
            ),
          );
        },
      ),
    );
  }
}