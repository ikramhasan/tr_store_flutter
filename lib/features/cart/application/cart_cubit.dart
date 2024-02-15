import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.initial());

  Future<void> addToCart(Product product) async {
    final List<Product> existingProducts = List.from(state.products);
    existingProducts.add(product);
    emit(state.copyWith(products: existingProducts));
  }

  Future<void> removeFromCart(int index) async {
    final List<Product> existingProducts = List.from(state.products);
    existingProducts.removeAt(index);
    emit(state.copyWith(products: existingProducts));
  }
}
