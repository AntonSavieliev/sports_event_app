import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sports_event_app/core/extensions.dart';
import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';
import 'package:sports_event_app/presentation/widgets/league_info_widget.dart';

class EventItemWidget extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventItemWidget({required this.event, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.lightBlueBackgroundColor,
      highlightColor: AppColors.lightBlueBackgroundColor,
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/sports.svg',
              width: _iconSize,
              height: _iconSize,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildEventTime(),
                  _buildEventTeams(),
                ],
              ),
            ),
            _buildLeagueInfo(event.league),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('event', event))
      ..add(ObjectFlagProperty.has('onTap', onTap));
  }

  Widget _buildEventTime() {
    return Text(
      '${event.dateStarting.name.capitalize()} | ${event.timeStarting}',
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: AppColors.textColor,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildEventTeams() {
    return Text(
      event.teams,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.textColor,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _buildLeagueInfo(String league) => LeagueInfoWidget(league: league);

  static const double _iconSize = 46;
}
