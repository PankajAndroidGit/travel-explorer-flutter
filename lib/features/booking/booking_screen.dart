import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_text_styles.dart';

/// Booking calendar screen matching the Figma "2-night stay" date picker.
/// Supports month navigation and date selection (real interaction states,
/// not just a static calendar grid).
class BookingScreen extends StatefulWidget {
  final VoidCallback onCancelDate;

  const BookingScreen({super.key, required this.onCancelDate});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
    DateTime _displayedMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime? _selectedDate;
  bool _dateCancelled = false;

  static const List<String> _weekdayLabels = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  void _goToPreviousMonth() {
    setState(() {
      _displayedMonth = DateTime(_displayedMonth.year, _displayedMonth.month - 1, 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _displayedMonth = DateTime(_displayedMonth.year, _displayedMonth.month + 1, 1);
    });
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _dateCancelled = false;
    });
  }

    void _cancelDate() {
    setState(() {
      _dateCancelled = true;
    });
    widget.onCancelDate();
  }

  List<DateTime> _buildCalendarCells() {
    final firstDayOfMonth = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    // Dart: Monday=1 ... Sunday=7. Week starts Sunday, so mod 7 gives the
    // correct number of leading cells to fill from the previous month.
    final leadingBlanks = firstDayOfMonth.weekday % 7;
    final gridStart = firstDayOfMonth.subtract(Duration(days: leadingBlanks));
    return List.generate(42, (i) => gridStart.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final cells = _buildCalendarCells();
    final monthLabel = _monthYearLabel(_displayedMonth);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxl + 70,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('2-night stay', style: AppTextStyles.heading1.copyWith(fontSize: 22)),
              GestureDetector(
                onTap: _cancelDate,
                child: Text(
                  'Cancel Date',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.warning,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _dateCancelled
                ? 'No dates selected'
                : (_selectedDate != null
                    ? 'Selected: ${_shortDateLabel(_selectedDate!)}'
                    : 'Mon, Oct 24 - Wed, Oct 26'),
            style: AppTextStyles.bodyMuted,
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Column(
              children: [
                Text(monthLabel, style: AppTextStyles.heading2),
                const SizedBox(height: AppSpacing.md),
                GridView.count(
                  crossAxisCount: 7,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (final label in _weekdayLabels)
                      Center(
                        child: Text(label, style: AppTextStyles.caption),
                      ),
                    for (final date in cells)
                      _DayCell(
                        date: date,
                        isCurrentMonth: date.month == _displayedMonth.month,
                        isSelected: _selectedDate != null &&
                            !_dateCancelled &&
                            _isSameDate(date, _selectedDate!),
                        onTap: () => _selectDate(date),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ArrowButton(icon: Icons.chevron_left_rounded, onTap: _goToPreviousMonth),
              const SizedBox(width: AppSpacing.md),
              _ArrowButton(icon: Icons.chevron_right_rounded, onTap: _goToNextMonth),
            ],
          ),
        ],
      ),
    );
  }

  bool _isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  String _monthYearLabel(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  String _shortDateLabel(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _DayCell extends StatelessWidget {
  final DateTime date;
  final bool isCurrentMonth;
  final bool isSelected;
  final VoidCallback onTap;

  const _DayCell({
    required this.date,
    required this.isCurrentMonth,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isCurrentMonth ? onTap : null,
      child: Center(
        child: Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${date.day}',
            style: AppTextStyles.body.copyWith(
              color: isSelected
                  ? Colors.white
                  : (isCurrentMonth ? AppColors.textPrimary : AppColors.textMuted),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}