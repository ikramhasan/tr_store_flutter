import 'package:flutter/material.dart';
import 'package:tr_store_lite/features/products/application/product_cubit.dart';
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProductCubit>(
            create: (context) => ProductCubit(
              RepositoryProvider.of<IProductRepository>(context),
            )..fetchProducts(),
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
