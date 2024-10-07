import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_event_app/domain/managers/event_list_manager.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_event.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventListManager eventManager;

  EventListBloc(this.eventManager) : super(LoadingState()) {
    on<LoadEvents>(_onLoadEvents);
    on<FilterEvents>(_onFilterEvents);
    add(LoadEvents());
  }

  Future<void> _onLoadEvents(
      LoadEvents event, Emitter<EventListState> emit) async {
    emit(LoadingState());
    try {
      await eventManager.loadEvents();
      emit(LoadedState());
    } catch (error) {
      emit(ErrorState(errorMessage: error.toString()));
    }
  }

  Future<void> _onFilterEvents(
      FilterEvents event, Emitter<EventListState> emit) async {
    final filteredEvents = eventManager.getFilteredEvents(event.date);
    emit(EventsFilteredState(events: filteredEvents, filter: event.date));
  }
}
