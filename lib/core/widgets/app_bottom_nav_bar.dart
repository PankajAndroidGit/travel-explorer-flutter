import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class NavItemData {
  final IconData? icon;
  final bool isAvatar; // true = show the local avatar image instead of an icon
  final String label;

  const NavItemData({this.icon, this.isAvatar = false, required this.label});
}

/// Bottom navigation bar with a pill-shaped highlight on the active item,
/// matching the Figma design's 4 tabs: Dashboard, Hotels Resort,
/// Booking Hotel, Account.
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavItemData> items;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = const [
      NavItemData(icon: Icons.home_rounded, label: 'Dashboard'),
      NavItemData(icon: Icons.flight_rounded, label: 'Hotels Resort'),
      NavItemData(icon: Icons.calendar_month_rounded, label: 'Booking Hotel'),
      NavItemData(isAvatar: true, label: 'Account'),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _NavItem(
              data: items[i],
              isActive: i == currentIndex,
              onTap: () => onTap(i),
            ),
            if (i != items.length - 1) const SizedBox(width: AppSpacing.xs),
          ],
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavItemData data;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({required this.data, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isActive ? AppSpacing.md : AppSpacing.sm,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          children: [
            _LeadingVisual(data: data, isActive: isActive),
            if (isActive) ...[
              const SizedBox(width: AppSpacing.xs),
              Text(data.label, style: AppTextStyles.navLabel),
            ],
          ],
        ),
      ),
    );
  }
}

class _LeadingVisual extends StatelessWidget {
  final NavItemData data;
  final bool isActive;

  const _LeadingVisual({required this.data, required this.isActive});

  @override
  Widget build(BuildContext context) {
    if (data.isAvatar) {
      return const CircleAvatar(
        radius: 11,
        backgroundColor: AppColors.surfaceElevated,
        backgroundImage: AssetImage('assets/images/avatar.jpg'),
      );
    }
    return Icon(
      data.icon,
      size: 20,
      color: isActive ? Colors.white : AppColors.textSecondary,
    );
  }
}