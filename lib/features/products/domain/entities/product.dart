import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/products/domain/entities/rating.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String description,
    required double price,
    required String image,
    required String category,
    required Rating rating,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.empty() => _Product(
        id: 0,
        title: '',
        description: '',
        price: 0.0,
        image: '',
        category: '',
        rating: Rating.empty(),
      );
}
