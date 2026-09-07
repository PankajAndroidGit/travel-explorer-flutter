import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class MenuItemData {
  final IconData icon;
  final String label;
  final int? badgeCount;
  final bool isActive;

  const MenuItemData({
    required this.icon,
    required this.label,
    this.badgeCount,
    this.isActive = false,
  });
}

/// Side drawer shown when the menu icon is tapped on the dashboard.
/// Matches the Figma "Account Setting" panel: profile header + grouped
/// sections of settings rows.
class AppDrawerMenu extends StatelessWidget {
  final String userName;
  final String userLocation;
  final String avatarUrl;

  const AppDrawerMenu({
    super.key,
    this.userName = 'Alice Premium',
    this.userLocation = 'Toronto, Canada',
    this.avatarUrl = 'assets/images/avatar.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            _Header(
              userName: userName,
              userLocation: userLocation,
              avatarUrl: avatarUrl,
              onClose: () => Navigator.of(context).pop(),
            ),
            const SizedBox(height: AppSpacing.lg),
            const _Section(
              title: 'Account Setting',
              items: [
                MenuItemData(icon: Icons.notifications_outlined, label: 'Notification', badgeCount: 12),
                MenuItemData(icon: Icons.payment_outlined, label: 'Payment', isActive: true),
                MenuItemData(icon: Icons.translate_outlined, label: 'Translate'),
                MenuItemData(icon: Icons.lock_outline, label: 'Privacy'),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const _Section(
              title: 'Account Setting',
              items: [
                MenuItemData(icon: Icons.list_alt_outlined, label: 'Listing'),
                MenuItemData(icon: Icons.home_work_outlined, label: 'Host'),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            const _Section(
              title: 'Account Setting',
              items: [
                MenuItemData(icon: Icons.dark_mode_outlined, label: 'Dark Mode'),
                MenuItemData(icon: Icons.system_update_alt_outlined, label: 'Update'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String userName;
  final String userLocation;
  final String avatarUrl;
  final VoidCallback onClose;

  const _Header({
    required this.userName,
    required this.userLocation,
    required this.avatarUrl,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.surfaceElevated,
          backgroundImage: AssetImage(avatarUrl),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: AppTextStyles.heading2),
              Text(userLocation, style: AppTextStyles.bodyMuted),
            ],
          ),
        ),
        GestureDetector(
          onTap: onClose,
          child: const Icon(Icons.close, color: AppColors.textSecondary, size: 22),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<MenuItemData> items;

  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Text(title, style: AppTextStyles.caption),
        ),
        for (final item in items) _MenuRow(data: item),
      ],
    );
  }
}

class _MenuRow extends StatelessWidget {
  final MenuItemData data;

  const _MenuRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: data.isActive ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: data.isActive
                ? Colors.white.withValues(alpha: 0.2)
                : AppColors.surfaceElevated,
            child: Icon(
              data.icon,
              size: 16,
              color: data.isActive ? Colors.white : AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              data.label,
              style: AppTextStyles.body.copyWith(
                color: data.isActive ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
          if (data.badgeCount != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.badge,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Text(
                '${data.badgeCount}',
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            )
          else
            Icon(
              Icons.chevron_right,
              size: 18,
              color: data.isActive ? Colors.white : AppColors.textMuted,
            ),
        ],
      ),
    );
  }
}