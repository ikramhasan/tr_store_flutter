import 'package:flutter/material.dart';
import 'package:tr_store_lite/features/core/presentation/styles/spacing.dart';
import 'package:tr_store_lite/features/core/presentation/styles/transparent_image.dart';
import 'package:tr_store_lite/features/products/domain/entities/product.dart';
import 'package:tr_store_lite/features/products/presentation/components/add_to_cart_button.dart';
import 'package:tr_store_lite/features/products/presentation/product_details_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productId: product.id,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              verticalSpacing8,
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: product.image,
                height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  product.title,
                  maxLines: 3,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 26,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              verticalSpacing8,
              const AddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }
}
