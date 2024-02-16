import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store_lite/features/cart/presentation/components/cart_icon.dart';
import 'package:tr_store_lite/features/products/application/product_cubit.dart';
import 'package:tr_store_lite/features/products/presentation/components/product_card.dart';
import 'package:tr_store_lite/features/products/presentation/components/product_grid_shimmer_loading.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: const [
          CartIcon(),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.loading) {
            return const ProductGridShimmerLoading();
          }
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: state.products[index]);
            },
          );
        },
      ),
    );
  }
}
