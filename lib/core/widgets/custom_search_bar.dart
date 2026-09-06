import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

/// Reusable search bar with a leading search icon and trailing mic icon,
/// matching the dashboard's "Search Location" field.
class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicTap;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search Location',
    this.onChanged,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppTextStyles.body,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.bodyMuted,
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          GestureDetector(
            onTap: onMicTap,
            child: const Icon(Icons.mic_none, color: AppColors.textSecondary, size: 20),
          ),
        ],
      ),
    );
  }
}
