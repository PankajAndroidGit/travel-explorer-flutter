import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import 'models/property_detail_model.dart';

/// Property/hotel detail screen: hero image, host info, rating,
/// address, and description — matching the Figma design.
/// NOTE: currently shows a single sample property. Wiring this to open
/// per-card from the dashboard (via shared state/navigation args) is a
/// natural next step once that flow is prioritized.
class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final property = samplePropertyDetail;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxl + 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.md),
            child: Image.network(
              property.imageUrl,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  height: 280,
                  color: AppColors.surfaceElevated,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: 280,
                color: AppColors.surfaceElevated,
                child: const Center(
                  child: Icon(Icons.image_not_supported_outlined, color: AppColors.textMuted),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.surfaceElevated,
                      backgroundImage: NetworkImage(property.hostAvatarUrl),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'Hosted by ${property.hostName}',
                        style: AppTextStyles.heading2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_rounded, size: 16, color: AppColors.warning),
                        const SizedBox(width: 4),
                        Text('${property.rating}', style: AppTextStyles.bodyMuted),
                        const SizedBox(width: AppSpacing.sm),
                        Container(width: 1, height: 12, color: AppColors.divider),
                        const SizedBox(width: AppSpacing.sm),
                        Text('${property.reviewsCount} reviews', style: AppTextStyles.bodyMuted),
                      ],
                    ),
                    Text(property.dateRange, style: AppTextStyles.bodyMuted),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.primary,
                      child: const Icon(Icons.location_on_rounded, size: 16, color: Colors.white),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(property.address, style: AppTextStyles.bodyMuted),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                const Divider(color: AppColors.divider, height: 1),
                const SizedBox(height: AppSpacing.lg),
                Text('Description', style: AppTextStyles.heading2),
                const SizedBox(height: AppSpacing.sm),
                Text(property.description, style: AppTextStyles.bodyMuted),
              ],
            ),
          ),
        ],
      ),
    );
  }
}