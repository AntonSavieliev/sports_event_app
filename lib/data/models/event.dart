import 'package:sports_event_app/data/models/event_date.dart';

class Event {
  final String icon;
  final String league;
  final String teams;
  final String sport;
  final EventDate dateStarting;
  final String timeStarting;
  final String description;

  const Event({
    required this.icon,
    required this.league,
    required this.teams,
    required this.sport,
    required this.dateStarting,
    required this.timeStarting,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      icon: json['iconUrl'] as String,
      league: json['league'] as String,
      teams: json['teams'] as String,
      sport: json['sportType'] as String,
      dateStarting: _parseDateStarting(json['dateStarting'] as String),
      timeStarting: json['timeStarting'] as String,
      description: (json['description'] ?? '') as String,
    );
  }

  static EventDate _parseDateStarting(String date) {
    switch (date.toUpperCase()) {
      case 'YESTERDAY':
        return EventDate.yesterday;
      case 'TODAY':
        return EventDate.today;
      case 'TOMORROW':
        return EventDate.tomorrow;
      default:
        throw ArgumentError('Unknown dateStarting: $date');
    }
  }
}
