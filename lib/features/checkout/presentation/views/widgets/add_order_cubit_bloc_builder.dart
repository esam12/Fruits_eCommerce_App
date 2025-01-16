import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/core/widgets/custom_progress_hud.dart';
import 'package:fruits/features/checkout/presentation/manager/add_order/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          FLoaders.successSnackBar(
              context: context, title: 'تم اضافة الطلب بنجاح');
        }
        if (state is AddOrderFailure) {
          FLoaders.warningSnackBar(context: context, title: state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
