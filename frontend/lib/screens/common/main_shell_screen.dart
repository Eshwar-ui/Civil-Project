import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class MainShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen({super.key, required this.navigationShell});

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  void _onFABPressed(BuildContext context) {
    context.pushNamed('add-project');
  }

  @override
  Widget build(BuildContext context) {
    final isHomePage = navigationShell.currentIndex == 0;

    return Scaffold(
      body: SafeArea(child: navigationShell),
      extendBody: true,
      bottomNavigationBar: isHomePage
          ? CustomBottomNavBarWithFAB(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => _onTap(context, index),
              onFABPressed: () => _onFABPressed(context),
            )
          : CustomBottomNavBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => _onTap(context, index),
            ),
    );
  }
}
