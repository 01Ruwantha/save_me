import 'package:flutter/material.dart';
import 'package:save_me/app/styles/app_color_style.dart';
import 'package:save_me/features/alert/alert_page.dart';
import 'package:save_me/features/map/map_page.dart';

class CustomBottomNavScaffold extends StatefulWidget {
  const CustomBottomNavScaffold({super.key});

  @override
  State<CustomBottomNavScaffold> createState() =>
      _CustomBottomNavScaffoldState();
}

class _CustomBottomNavScaffoldState extends State<CustomBottomNavScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [MapPage(), AlertPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.backgroundPrimary,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
        sizing: StackFit.expand,
      ),
      bottomNavigationBar: Container(
        color: AppColorStyle.backgroundPrimary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              icon: Icons.home_rounded,
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              context,
              icon: Icons.map_rounded,
              label: 'Alert',
              index: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppColorStyle.bottomNavSelected
                : AppColorStyle.bottomNavUnselected,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? AppColorStyle.bottomNavSelected
                  : AppColorStyle.bottomNavUnselected,
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
