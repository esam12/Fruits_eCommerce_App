import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/home/presentation/cubit/cart_cubit.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/main_view_body_bloc_listener.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;
            setState(() {});
          },
        ),
        body: SafeArea(
          child: MainViewBodyBlocListener(currentViewIndex: currentViewIndex),
        ),
      ),
    );
  }
}




