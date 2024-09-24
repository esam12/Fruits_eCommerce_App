import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/core/widgets/custom_progress_hud.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:fruits/features/home/presentation/views/home_view.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) => {
        if (state is SignupSuccess)
          {
            FLoaders.successSnackBar(
                context: context, title: 'تم التسجيل بنجاح'),
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            )
          }
        else if (state is SignupFailure)
          {
            FLoaders.warningSnackBar(context: context, title: state.message),
          }
      },
      builder: (context, state) => CustomProgressHud(
        isLoading: state is SignupLoading ? true : false,
        child: const SignupViewBody(),
      ),
    );
  }
}
