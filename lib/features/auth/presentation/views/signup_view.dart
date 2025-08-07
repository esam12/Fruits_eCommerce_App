import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar:
            buildAppBar(context, title: 'حساب جديد', showNotification: false),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
