import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/data/models/event_date.dart';

sealed class EventListState {}

class LoadingState extends EventListState {}

class LoadedState extends EventListState {}

class EventsFilteredState extends EventListState {
  final List<Event> events;
  final EventDate filter;

  EventsFilteredState({required this.events, required this.filter});
}

class ErrorState extends EventListState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
