import 'provider.dart';

class InventoryProvider extends Provider<Map<String, dynamic>> {
  InventoryProvider() : super('inventory');

  get allProducts => null;

  void searchProducts(String query) {
    // Implement search functionality
    // This is a placeholder and should be replaced with actual search logic
    notifyListeners();
  }

  Future<void> updateStock(String sku, int quantity) async {
    final index = all.indexWhere((product) => product['sku'] == sku);
    if (index != -1) {
      final product = all[index];
      product['quantity'] = quantity;
      await update(index, product);
    }
  }

  void addProduct(Map<String, Object> product) {}
}

