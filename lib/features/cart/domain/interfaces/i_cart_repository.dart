import 'package:tr_store_lite/features/cart/domain/entities/cart_item.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

abstract class ICartRepository {
  Stream<List<CartItem>> get cartItems;

  Future<void> addToCart(Product product);

  Future<void> removeFromCart(String id);
}
