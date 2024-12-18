import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_view.dart';

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
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: HomeView(),
      ),
    );
  }
}
