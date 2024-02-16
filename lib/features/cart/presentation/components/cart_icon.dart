import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store_lite/features/cart/application/cart_cubit.dart';
import 'package:tr_store_lite/features/cart/presentation/cart_page.dart';
import 'package:badges/badges.dart' as badges;

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CartPage(),
          ),
        );
      },
      icon: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Icon(
              Icons.shopping_cart,
            );
          } else {
            return badges.Badge(
              position: badges.BadgePosition.topEnd(top: -15),
              badgeContent: Text(
                state.items.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Icon(
                Icons.shopping_cart,
              ),
            );
          }
        },
      ),
    );
  }
}
