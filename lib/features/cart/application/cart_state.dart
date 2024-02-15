part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required List<CartItem> items,
    required int total,
  }) = _CartState;

  factory CartState.initial() => const _CartState(
        items: [],
        total: 0,
      );
}
