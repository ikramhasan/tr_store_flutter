import 'package:flutter/material.dart';
import 'package:tr_store_lite/features/cart/application/cart_cubit.dart';
import 'package:tr_store_lite/features/cart/domain/interfaces/i_cart_repository.dart';
import 'package:tr_store_lite/features/cart/infrastructure/cart_repository.dart';
import 'package:tr_store_lite/features/products/application/product_cubit.dart';
import 'package:tr_store_lite/features/products/application/product_details/product_details_cubit.dart';
import 'package:tr_store_lite/features/products/domain/interfaces/i_product_repository.dart';
import 'package:tr_store_lite/features/products/infrastructure/product_repository.dart';
import 'package:tr_store_lite/features/products/presentation/products_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TRStoreApp extends StatelessWidget {
  const TRStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IProductRepository>(
          create: (context) => ProductRepository.instance,
        ),
        RepositoryProvider<ICartRepository>(
          create: (context) => CartRepository.instance,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
              RepositoryProvider.of<IProductRepository>(context),
            )..fetchProducts(),
          ),
          BlocProvider<ProductDetailsCubit>(
            create: (context) => ProductDetailsCubit(
              RepositoryProvider.of<IProductRepository>(context),
            ),
          ),
          BlocProvider<CartCubit>(
            create: (context) => CartCubit(
              RepositoryProvider.of<ICartRepository>(context),
            )..init(),
          ),
        ],
        child: MaterialApp(
          title: 'TR Store Lite',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ProductsPage(),
        ),
      ),
    );
  }
}
