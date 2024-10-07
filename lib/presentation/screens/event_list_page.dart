import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_event_app/core/utils/comparable_list.dart';
import 'package:sports_event_app/data/models/event_date.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_bloc.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_event.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_state.dart';
import 'package:sports_event_app/presentation/widgets/app_bar.dart';
import 'package:sports_event_app/presentation/widgets/event_range_widget.dart';
import 'package:sports_event_app/presentation/widgets/filter_menu_widget.dart';

class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  final _selectedDay = ValueNotifier(EventDate.today);

  @override
  void dispose() {
    _selectedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const SportsEventAppBar(),
      body: Column(
        children: [
          ValueListenableBuilder<EventDate>(
              valueListenable: _selectedDay,
              builder: (context, value, child) {
                return FilterMenuWidget(
                    selectedFilter: value,
                    onFilterChanged: (newValue) {
                      _selectedDay.value = newValue;
                      context.read<EventListBloc>().add(FilterEvents(newValue));
                    });
              }),
          Expanded(
              child: BlocConsumer<EventListBloc, EventListState>(
            listener: (context, state) {
              if (state is LoadedState) {
                context
                    .read<EventListBloc>()
                    .add(FilterEvents(_selectedDay.value));
              }
            },
            builder: (context, state) {
              return switch (state) {
                EventsFilteredState() => EventRangeWidget(
                    key: ValueKey(ComparableList(state.events)),
                    events: state.events,
                    onRefresh: () =>
                        context.read<EventListBloc>().add(LoadEvents()),
                  ),
                LoadingState() =>
                  const Center(child: CircularProgressIndicator()),
                ErrorState() => Center(
                    child: Column(
                      children: [
                        Text('Error happened: ${state.errorMessage}'),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () =>
                              context.read<EventListBloc>().add(LoadEvents()),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                _ => const Center(child: Text('Unexpected state')),
              };
            },
          )),
        ],
      ),
    ));
  }
}
