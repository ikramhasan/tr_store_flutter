import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tr_store_lite/features/cart/application/cart_cubit.dart';
import 'package:tr_store_lite/features/cart/presentation/components/cart_icon.dart';
import 'package:tr_store_lite/features/core/domain/failure.dart';
import 'package:tr_store_lite/features/core/presentation/styles/spacing.dart';
import 'package:tr_store_lite/features/products/application/product_details/product_details_cubit.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    context.read<ProductDetailsCubit>().fetchProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.failure != Failure.none()) {
              return Center(
                child: Text(
                  state.failure.message,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }
            return Column(
              children: [
                Image.network(
                  state.product.image,
                  height: 300,
                ),
                verticalSpacing16,
                Text(
                  state.product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpacing16,
                Text(
                  'Price: \$ ${state.product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                verticalSpacing16,
                Text(
                  state.product.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                verticalSpacing16,
                Row(
                  children: [
                    const Text(
                      'Rating:',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    horizontalSpacing8,
                    RatingBarIndicator(
                      rating: state.product.rating.rate,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18,
                    ),
                    horizontalSpacing4,
                    Text('(${state.product.rating.count})')
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // minimumSize: const Size(double.infinity, 50),
                      ),
                  onPressed: () {
                    context.read<CartCubit>().addToCart(state.product);
                  },
                  child: const Text('Add to Cart'),
                ),
                verticalSpacing16,
              ],
            );
          },
        ),
      ),
    );
  }
}
