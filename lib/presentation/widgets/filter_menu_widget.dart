import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_app/data/models/event_date.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';

class FilterMenuWidget extends StatelessWidget {
  final EventDate selectedFilter;
  final ValueChanged<EventDate> onFilterChanged;

  const FilterMenuWidget({
    required this.selectedFilter,
    required this.onFilterChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: AppColors.filterWidgetBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMenuItem(EventDate.yesterday),
          _buildMenuItem(EventDate.today),
          _buildMenuItem(EventDate.tomorrow),
        ],
      ),
    );
  }

  Widget _buildMenuItem(EventDate filter) {
    final isSelected = selectedFilter == filter;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => onFilterChanged(filter),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            filter.name.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? AppColors.selectedFilterColor
                  : AppColors.unselectedFilterColor,
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: _calculateTextWidth(filter.name, 16),
              color: AppColors.selectedFilterColor,
            ),
        ],
      ),
    );
  }

  double _calculateTextWidth(String text, double fontSize) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(EnumProperty<EventDate>('selectedFilter', selectedFilter))
      ..add(ObjectFlagProperty<ValueChanged<EventDate>>.has(
          'onFilterChanged', onFilterChanged));
  }
}
