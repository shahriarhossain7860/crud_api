import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';

class crudApp extends StatelessWidget {
  const crudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
