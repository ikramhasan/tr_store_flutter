part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required bool loading,
    required Product product,
    required Failure failure,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => _ProductDetailsState(
        loading: false,
        product: Product.empty(),
        failure: Failure.none(),
      );
}
