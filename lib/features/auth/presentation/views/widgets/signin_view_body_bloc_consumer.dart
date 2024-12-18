import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/core/widgets/custom_progress_hud.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits/features/home/presentation/views/main_view.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainView()));
        }
        if (state is SigninFailure) {
          FLoaders.errorSnackBar(context: context, title: state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
