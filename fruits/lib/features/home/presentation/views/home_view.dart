import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = 'homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: const SafeArea(child: HomeViewBody()),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.home, "الرئيسية", selectedIndex == 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.search, "المنتجات", selectedIndex == 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(Icons.search, "سلة التسوق", selectedIndex == 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildNavItem(
                Icons.person, " تيست ثصحسابي", selectedIndex == 3),
            label: '',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: onItemTapped,
      ),
    );
  }
}

Widget _buildNavItem(IconData icon, String label, bool isSelected) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    constraints: const BoxConstraints(
      minWidth: 80,
      maxWidth: 120,
    ),
    width: isSelected ? 120.0 : 80.0,
    padding: EdgeInsets.all(isSelected ? 5.0 : 0.0),
    decoration: isSelected
        ? BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(30),
          )
        : null,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isSelected ? 45.0 : 30.0,
          padding: EdgeInsets.all(isSelected ? 5.0 : 0.0),
          decoration: isSelected
              ? const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor)
              : null,
          child: Icon(
            icon,
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 5.0),
        if (isSelected)
          SizedBox(
            width: 60,
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
            ),
          ),
      ],
    ),
  );
}
