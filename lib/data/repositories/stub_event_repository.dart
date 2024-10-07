import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/data/models/event_date.dart';
import 'package:sports_event_app/domain/repositories/event_repository.dart';

class StubEventRepository implements EventRepository {

  @override
  Future<List<Event>> getAll() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return sportsEvents.map(Event.fromJson).toList();
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }

  @override
  Future<List<Event>> getFilteredEvents(EventDate date) async {
    final allEvents = await getAll();
    return allEvents.where((event) => event.dateStarting == date).toList();
  }

  final List<Map<String, dynamic>> sportsEvents = [
    {
      'iconUrl': 'sports',
      'league': 'LEGA B',
      'teams': 'Lakers vs Golden State',
      'sportType': 'Basketball',
      'dateStarting': 'TODAY',
      'timeStarting': '19:00 - 21:00',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'LEGA B',
      'teams': 'MU vs Liverpool',
      'sportType': 'Football',
      'dateStarting': 'TOMORROW',
      'timeStarting': '16:30 - 18:30',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'LEGA B',
      'teams': 'N. Djokovic vs R. Nadal',
      'sportType': 'Tennis',
      'dateStarting': 'TODAY',
      'timeStarting': '14:00 - 16:00',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'SERIE A',
      'teams': 'Milan vs Palermo',
      'sportType': 'Basketball',
      'dateStarting': 'YESTERDAY',
      'timeStarting': '20:00 - 22:00',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'SERIE A',
      'teams': 'Juventus vs Inter Milan',
      'sportType': 'Football',
      'dateStarting': 'TODAY',
      'timeStarting': '20:45 - 22:45',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'LEGA B',
      'teams': 'Leon vs Dinamo',
      'sportType': 'Football',
      'dateStarting': 'TOMORROW',
      'timeStarting': '17:30 - 19:30',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'SERIE A',
      'teams': 'BM vs Arsenal',
      'sportType': 'Basketball',
      'dateStarting': 'YESTERDAY',
      'timeStarting': '21:00 - 23:00',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'SERIE A',
      'teams': 'Palermo vs Lazio',
      'sportType': 'Football',
      'dateStarting': 'TODAY',
      'timeStarting': '21:45 - 23:45',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'SERIE A',
      'teams': 'Real M vs Barcelona',
      'sportType': 'Football',
      'dateStarting': 'TOMORROW',
      'timeStarting': '19:00 - 21:00',
      'description': _defaultDescription,
    },
    {
      'iconUrl': 'sports',
      'league': 'LEGA B',
      'teams': 'Oscar vs Arsenal',
      'sportType': 'Basketball',
      'dateStarting': 'YESTERDAY',
      'timeStarting': '21:00 - 23:00',
      'description': _defaultDescription,
    },
  ];

  static const String _defaultDescription =
      """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.""";
}
