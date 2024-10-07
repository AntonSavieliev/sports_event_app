import 'package:sports_event_app/data/models/event_date.dart';

sealed class EventListEvent {}

class LoadEvents extends EventListEvent {}

class FilterEvents extends EventListEvent {
  final EventDate date;
  FilterEvents(this.date);
}
