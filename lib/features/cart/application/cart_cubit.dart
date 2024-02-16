import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/cart/domain/entities/cart_item.dart';
import 'package:tr_store_lite/features/cart/domain/interfaces/i_cart_repository.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._repo) : super(CartState.initial());
  final ICartRepository _repo;

  StreamSubscription? _cartSubscription;

  Future<void> init() async {
    _cartSubscription = _repo.cartItems.listen((cartItems) {
      emit(state.copyWith(items: cartItems));
    });
  }

  Future<void> addToCart(Product product) async {
    await _repo.addToCart(product);
  }

  Future<void> removeFromCart(String id) async {
    await _repo.removeFromCart(id);
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
