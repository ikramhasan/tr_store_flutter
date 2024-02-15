part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<Product> products,
  }) = _CartState;

  factory CartState.initial() => const _CartState(
        products: [],
      );
}
