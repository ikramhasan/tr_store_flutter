import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
    required double total,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  factory CartItem.empty() => _CartItem(
        product: Product.empty(),
        quantity: 0,
        total: 0,
      );
}
