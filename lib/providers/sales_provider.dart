import 'provider.dart';

class SalesProvider extends Provider<Map<String, dynamic>> {
  SalesProvider() : super('sales');

  List<Map<String, dynamic>> _cart = [];

  List<Map<String, dynamic>> get cart => _cart;

  double get subtotal => _cart.fold(0, (sum, item) => sum + (item['price'] as double) * (item['quantity'] as int));
  double get total => subtotal; // Add tax calculation here if needed
  int get totalQuantity => _cart.fold(0, (sum, item) => sum + (item['quantity'] as int));

  void addToCart(Map<String, dynamic> product) {
    final index = _cart.indexWhere((item) => item['sku'] == product['sku']);
    if (index != -1) {
      _cart[index]['quantity'] = ((_cart[index]['quantity'] as int) + 1);
    } else {
      _cart.add({...product, 'quantity': 1});
    }
    notifyListeners();
  }

  void removeFromCart(String sku) {
    _cart.removeWhere((item) => item['sku'] == sku);
    notifyListeners();
  }

  void updateQuantity(String sku, int quantity) {
    final index = _cart.indexWhere((item) => item['sku'] == sku);
    if (index != -1) {
      _cart[index]['quantity'] = quantity;
      notifyListeners();
    }
  }

  void resetCart() {
    _cart = [];
    notifyListeners();
  }

  Future<void> completeSale() async {
    final sale = {
      'items': _cart,
      'subtotal': subtotal,
      'total': total,
      'timestamp': DateTime.now().toIso8601String(),
    };
    await add(sale);
    resetCart();
  }
}

