part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required bool loading,
    required IList<Product> products,
    required Failure failure,
  }) = _ProductState;

  factory ProductState.initial() => _ProductState(
        loading: false,
        products: IList(const []),
        failure: Failure.none(),
      );
}
