import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_event_app/data/repositories/stub_event_repository.dart';
import 'package:sports_event_app/domain/managers/event_list_manager.dart';
import 'package:sports_event_app/domain/repositories/event_repository.dart';
import 'package:sports_event_app/presentation/blocs/event_list_bloc/event_list_bloc.dart';
import 'package:sports_event_app/presentation/screens/event_list_page.dart';

void main() {
  runApp(const SportsEventApp());
}

class SportsEventApp extends StatelessWidget {
  const SportsEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<EventRepository>(
          create: (_) => StubEventRepository(),
        ),
        ProxyProvider<EventRepository, EventListManager>(
          update: (_, repo, __) => EventListManager(repo),
        ),
        ProxyProvider<EventListManager, EventListBloc>(
          update: (_, manager, __) => EventListBloc(manager),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'A Sports Events App',
        home: EventListPage(),
      ),
    );
  }
}
