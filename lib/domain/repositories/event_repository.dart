import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/data/models/event_date.dart';

abstract interface class EventRepository {
  Future<List<Event>> getAll();
  Future<List<Event>> getFilteredEvents(EventDate date);
}
