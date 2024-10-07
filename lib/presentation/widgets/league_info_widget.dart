import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';

class LeagueInfoWidget extends StatelessWidget {
  final String league;

  const LeagueInfoWidget({required this.league, super.key});

  @override
  Widget build(BuildContext context) {
    final leagueParts = league.split(' ');
    return Container(
      width: _containerSize,
      height: _containerSize,
      decoration: const BoxDecoration(
        color: AppColors.lightBlueBackgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              leagueParts[0],
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: AppColors.textColor,
              ),
            ),
            Text(
              leagueParts.length > 1 ? leagueParts[1] : '',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('league', league));
  }

  static const double _containerSize = 54;
}
