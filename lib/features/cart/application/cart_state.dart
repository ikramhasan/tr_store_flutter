part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> items,
  }) = _CartState;

  factory CartState.initial() => const _CartState(
        items: [],
      );
}
