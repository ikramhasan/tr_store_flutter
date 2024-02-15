import 'package:bloc/bloc.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/core/domain/failure.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';
import 'package:tr_store_lite/features/products/domain/interfaces/i_product_repository.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repo) : super(ProductState.initial());

  final IProductRepository _repo;

  Future<void> fetchProducts() async {
    emit(state.copyWith(loading: true));
    final result = await _repo.fetchProducts();
    result.fold(
      (failure) => emit(
        state.copyWith(
          loading: false,
          failure: failure,
          products: IList(const []),
        ),
      ),
      (products) => emit(
        state.copyWith(
          loading: false,
          products: products,
          failure: Failure.none(),
        ),
      ),
    );
  }
}
