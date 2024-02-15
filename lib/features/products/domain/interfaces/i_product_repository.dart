import 'package:tr_store_lite/features/core/domain/failure.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class IProductRepository {
  /// Fetches a list of products from the repository.
  /// Returns a [Failure] if an error occurs.
  /// Returns a [IList<Product>] if the fetch is successful.
  Future<Either<Failure, IList<Product>>> fetchProducts();

  /// Fetches a product from the repository.
  /// Returns a [Failure] if an error occurs.
  /// Returns a [Product] if the fetch is successful.
  Future<Either<Failure, Product>> fetchProduct(int id);
}
