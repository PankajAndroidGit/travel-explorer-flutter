import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

class AccountMenuItemData {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool comingSoon;

  const AccountMenuItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.comingSoon = false,
  });
}

/// Account settings list matching the Figma design: a vertical list of
/// setting rows, each with an icon, title, subtitle, and trailing
/// chevron (or a "Coming Soon" badge for not-yet-available features).
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const List<AccountMenuItemData> _items = [
    AccountMenuItemData(
      icon: Icons.person_outline_rounded,
      title: 'Edit Profile',
      subtitle: 'Manage your professional profile',
    ),
    AccountMenuItemData(
      icon: Icons.badge_outlined,
      title: 'Account',
      subtitle: 'Manage account and login settings',
    ),
    AccountMenuItemData(
      icon: Icons.notifications_outlined,
      title: 'Notification',
      subtitle: 'Manage your notification preferences',
    ),
    AccountMenuItemData(
      icon: Icons.palette_outlined,
      title: 'Appearance',
      subtitle: 'Customize your app experience',
    ),
    AccountMenuItemData(
      icon: Icons.help_outline_rounded,
      title: 'Help & Feedback',
      subtitle: 'Get help or share feedback',
    ),
    AccountMenuItemData(
      icon: Icons.person_add_alt_outlined,
      title: 'Invite a friend',
      subtitle: 'Invite friends to NextRole app',
    ),
    AccountMenuItemData(
      icon: Icons.shield_outlined,
      title: 'Privacy & Security',
      subtitle: 'Manage privacy and data settings',
    ),
    AccountMenuItemData(
      icon: Icons.credit_card_outlined,
      title: 'Subscription',
      subtitle: 'Manage your plan and billing',
      comingSoon: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.xxl + 70,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];

        return _AccountRow(
          data: item,
          onTap: item.comingSoon
              ? null
              : () {
                  // TODO: wire to real destination screens once specified
                },
        );
      },
    );
  }
}

class _AccountRow extends StatelessWidget {
  final AccountMenuItemData data;
  final VoidCallback? onTap;

  const _AccountRow({
    required this.data,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
        leading: Icon(
          data.icon,
          color: data.comingSoon ? AppColors.textSecondary : AppColors.primary,
        ),
        title: Text(
          data.title,
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          data.subtitle,
          style: AppTextStyles.caption,
        ),
        trailing: data.comingSoon
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.badge,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: Text(
                  'Coming Soon',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : const Icon(Icons.chevron_right, color: AppColors.textMuted),
      ),
    );
  }
}