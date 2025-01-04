import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/features/home/presentation/cubit/cart_cubit.dart';
import 'package:fruits/features/home/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          FLoaders.successSnackBar(
              context: context, title: 'تم اضافة المنتج بنجاح');
        }

        if (state is CartItemRemoved) {
          FLoaders.warningSnackBar(
              context: context, title: 'تم حذف المنتج بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
