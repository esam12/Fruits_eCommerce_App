import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/popups/loaders.dart';
import 'package:fruits/core/widgets/shimmers/shimmer_effect.dart';
import 'package:fruits/features/home/presentation/cubit/home_cubit.dart';

class UserNameBlocConsumer extends StatelessWidget {
  const UserNameBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          FLoaders.errorSnackBar(context: context, title: state.message);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const TShimmerEffect(
            height: 15,
            width: 100,
          );
        } else if (state is HomeSuccess) {
          return Text(
            state.userName.name,
            style: TextStyles.bold16,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
