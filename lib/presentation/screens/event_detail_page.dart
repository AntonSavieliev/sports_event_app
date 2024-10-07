import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_event_app/core/extensions.dart';
import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';
import 'package:sports_event_app/presentation/widgets/league_info_widget.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;
  final VoidCallback onBack;

  const EventDetailPage({required this.event, required this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              children: [
                _buildBackButton(context),
                const SizedBox(height: 32),
                _buildLeagueInfo(event.league),
                const SizedBox(height: 24),
                _buildEventTime(event),
                _buildTeamsInfo(event.teams),
                const SizedBox(height: 4),
                const Divider(
                  color: AppColors.lightGreyBackgroundColor,
                  thickness: 1,
                  height: 32,
                ),
                const SizedBox(height: 24),
                _buildSportIcon(),
                const SizedBox(height: 32),
                _buildEventDescription(event.description),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('event', event))
      ..add(ObjectFlagProperty.has('onBack', onBack));
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: const Row(
        children: [
          Icon(Icons.arrow_back, color: AppColors.goBackButtonColor),
          SizedBox(width: 8),
          Text(
            'Go Back',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: AppColors.goBackButtonColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventTime(Event event) {
    return Text(
      '${event.dateStarting.name.capitalize()} | ${event.timeStarting}',
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildTeamsInfo(String teams) {
    return Text(
      teams,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildLeagueInfo(String league) => LeagueInfoWidget(league: league);

  Widget _buildSportIcon() {
    return SvgPicture.asset(
      'assets/images/sports.svg',
      width: 46,
      height: 46,
    );
  }

  Widget _buildEventDescription(String description) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 20,
        color: AppColors.descriptionTextColor,
        height: 1.5,
      ),
    );
  }
}
