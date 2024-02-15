import 'dart:async';
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
  Future<Either<Failure, Product>> fetchProduct(int id) async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl/products/$id')).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Request timed out');
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
        final product = Product.fromJson(jsonMap);
        return right(product);
      } else {
        return left(Failure.general());
      }
    } catch (e) {
      if (e is TimeoutException) {
        return left(Failure.timeout());
      } else {
        return left(Failure.general());
      }
    }
  }

  @override
  Future<Either<Failure, IList<Product>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products')).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Request timed out');
        },
      );
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
      if (e is TimeoutException) {
        return left(Failure.timeout());
      } else {
        return left(Failure.general());
      }
    }
  }
}
