import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) => previous.product != current.product,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Image.network(
                      state.product.image,
                      height: 300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Price: \$ ${state.product.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      state.product.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
