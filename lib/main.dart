import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/cart_controller.dart';
import 'controllers/products_controller.dart';
import 'controllers/order_controller.dart';
import 'models/product.dart';
import 'views/screens/products_screen.dart';
import 'views/screens/cart_screen.dart';
import 'views/screens/order_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return CartController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductsController();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return OrderController();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.amber,
          ),
        ),
        home: ProductsScreen(),
      ),
    );
  }
}
