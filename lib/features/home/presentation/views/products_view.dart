import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/repos/product_repo/product_repo.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/features/home/presentation/views/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),
      ),
      child: const ProductsViewBody(),
    );
  }
}
