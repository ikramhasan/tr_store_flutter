import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store_lite/features/cart/application/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              final product = state.items[index];
              return ListTile(
                leading: Image.network(product.image),
                title: Text(product.title),
                subtitle: Text('Price: \$ ${product.price}'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(
                          state.items[index].id,
                        );
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Total: \$${context.select((CartCubit cubit) => cubit.state.items.fold(0.0, (previousValue, element) => previousValue + element.price)).toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
