import 'package:flutter/material.dart';
import 'package:crud_operation_api_integration/screens/update_product_screen.dart';
import 'package:crud_operation_api_integration/Models/product.dart';
class ProductItem extends StatelessWidget {
  var onDelete;

  ProductItem({
    super.key, required this.product,
     required this.onDelete,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white,
      title:  Text(product.ProductName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Product Code: ${product.ProductCode}'),
           Text('Price: \$${product.UnitPrice}'),
           Text('Quantity: ${product.Quantity}'),
           Text('Total Price: \$${product.TotalPrice}'),

          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return UpdateProductScreen(productId: product.id.toString(),);
                    }),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: () {
                  onDelete(product.id);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}