import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store_lite/features/cart/application/cart_cubit.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Product added to cart'),
            duration: Duration(seconds: 1),
          ),
        );
        context.read<CartCubit>().addToCart(product);
      },
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_shopping_cart,
                size: 20,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Add to Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
