import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/data/models/event_date.dart';
import 'package:sports_event_app/domain/repositories/event_repository.dart';

class EventListManager {
  final EventRepository eventRepository;
  List<Event> _allEvents = [];
  EventDate initialFilterValue = EventDate.today;

  EventListManager(this.eventRepository);

  Future<void> loadEvents() async {
    _allEvents = await eventRepository.getAll();
  }

  List<Event> getFilteredEvents(EventDate filter) {
    return _allEvents.where((event) => event.dateStarting == filter).toList();
  }

  List<Event> get allEvents => _allEvents;
}
