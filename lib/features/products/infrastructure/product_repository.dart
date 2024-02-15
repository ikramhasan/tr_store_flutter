import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tr_store_lite/features/core/domain/failure.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';
import 'package:tr_store_lite/features/products/domain/interfaces/i_product_repository.dart';
import 'package:http/http.dart' as http;

class ProductRepository implements IProductRepository {
  ProductRepository._();
  static final ProductRepository instance = ProductRepository._();

  final _baseUrl = 'https://fakestoreapi.com';

  @override
  Future<Either<Failure, Product>> fetchProduct(int id) {
    // TODO: implement fetchProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Product>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));
      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body) as List<dynamic>;
        final products = jsonList
            .map((dynamic json) =>
                Product.fromJson(json as Map<String, dynamic>))
            .toIList();
        return right(products);
      } else {
        return left(Failure.general());
      }
    } catch (e) {
      return left(Failure.general());
    }
  }
}
