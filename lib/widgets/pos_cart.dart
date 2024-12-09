import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sales_provider.dart';

class POSCart extends StatelessWidget {
  const POSCart({super.key});

  @override
  Widget build(BuildContext context) {
    final salesProvider = context.watch<SalesProvider>();
    final cart = salesProvider.cart;

    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final item = cart[index];
        return ListTile(
          title: Text(item['name']),
          subtitle: Text('₹ ${item['price']}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  salesProvider.updateQuantity(item['sku'], item['quantity'] - 1);
                },
              ),
              Text('${item['quantity']}'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  salesProvider.updateQuantity(item['sku'], item['quantity'] + 1);
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  salesProvider.removeFromCart(item['sku']);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

