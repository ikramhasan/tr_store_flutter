import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/core/domain/failure.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';
import 'package:tr_store_lite/features/products/domain/interfaces/i_product_repository.dart';

part 'product_details_cubit.freezed.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._repo) : super(ProductDetailsState.initial());

  final IProductRepository _repo;

  Future<void> fetchProductDetails(int id) async {
    emit(state.copyWith(loading: true));
    final result = await _repo.fetchProduct(id);
    result.fold(
      (failure) => emit(
        state.copyWith(
          loading: false,
          failure: failure,
          product: Product.empty(),
        ),
      ),
      (product) => emit(
        state.copyWith(
          loading: false,
          product: product,
          failure: Failure.none(),
        ),
      ),
    );
  }
}
