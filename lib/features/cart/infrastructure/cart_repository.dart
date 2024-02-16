import 'package:tr_store_lite/features/cart/domain/entities/cart_item.dart';
import 'package:tr_store_lite/features/cart/domain/interfaces/i_cart_repository.dart';
import 'package:tr_store_lite/features/cart/infrastructure/cart_item_dto.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

class CartRepository implements ICartRepository {
  CartRepository._();
  static final instance = CartRepository._();

  final _db = AppDatabase();

  @override
  Stream<List<CartItem>> get cartItems =>
      _db.select(_db.cartItemsDto).watch().map(
            (list) => list
                .map((dto) => CartItem(
                      id: dto.id,
                      title: dto.title,
                      price: dto.price,
                      image: dto.image,
                    ))
                .toList(),
          );

  @override
  Future<void> addToCart(Product product) async {
    await _db.into(_db.cartItemsDto).insert(
          CartItemsDtoCompanion.insert(
            title: product.title,
            price: product.price,
            image: product.image,
          ),
        );
  }

  @override
  Future<void> removeFromCart(String id) async {
    await (_db.delete(_db.cartItemsDto)..where((tbl) => tbl.id.equals(id)))
        .go();
  }
}
