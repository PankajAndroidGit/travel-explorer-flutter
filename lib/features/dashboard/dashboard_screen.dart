import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/custom_search_bar.dart';
import 'models/location_model.dart';
import 'widgets/location_card.dart';

/// Dashboard tab content. No longer owns its own Scaffold/drawer/bottom nav —
/// those now live in MainShell and are shared across all 4 tabs.
class DashboardScreen extends StatefulWidget {
  final VoidCallback onMenuTap;

  const DashboardScreen({super.key, required this.onMenuTap});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final String _userName = 'Prabhat'; // TODO: replace with real user data source

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md, AppSpacing.md, AppSpacing.md, 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Good Morning\n$_userName',
                      style: AppTextStyles.heading1,
                    ),
                  ),
                  _MenuButton(onTap: widget.onMenuTap),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              CustomSearchBar(
                onChanged: (_) {},
                onMicTap: () {},
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
        Expanded(
          child: _LocationList(locations: sampleLocations),
        ),
      ],
    );
  }
}

class _MenuButton extends StatelessWidget {
  final VoidCallback onTap;
  const _MenuButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: const Icon(Icons.menu_rounded, color: AppColors.textPrimary, size: 20),
      ),
    );
  }
}

class _LocationList extends StatelessWidget {
  final List<LocationModel> locations;
  const _LocationList({required this.locations});

  @override
  Widget build(BuildContext context) {
    if (locations.isEmpty) {
      return const Center(
        child: Text('No locations found', style: AppTextStyles.bodyMuted),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md, 0, AppSpacing.md, AppSpacing.xxl + 70,
      ),
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return LocationCard(
          location: locations[index],
          onTap: () {
            // TODO: navigate to detail screen once that Figma frame is available
          },
        );
      },
    );
  }
}