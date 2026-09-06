import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import 'app_bottom_nav_bar.dart';
import 'app_drawer.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/hotels/hotels_screen.dart';
import '../../features/booking/booking_screen.dart';
import '../../features/account/account_screen.dart';

/// Root shell that owns the single Scaffold, drawer, and bottom nav bar
/// shared across all 4 main tabs. Uses IndexedStack so switching tabs
/// doesn't rebuild/lose the state of screens you've already visited.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _navIndex = 0;

  void _openDrawer() => _scaffoldKey.currentState?.openDrawer();

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardScreen(onMenuTap: _openDrawer),
      const HotelsScreen(),
      BookingScreen(onCancelDate: () => setState(() => _navIndex = 0)),
      const AccountScreen(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const AppDrawerMenu(),
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(index: _navIndex, children: pages),
            Positioned(
              left: 0,
              right: 0,
              bottom: AppSpacing.md,
              child: Center(
                child: AppBottomNavBar(
                  currentIndex: _navIndex,
                  onTap: (i) => setState(() => _navIndex = i),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}