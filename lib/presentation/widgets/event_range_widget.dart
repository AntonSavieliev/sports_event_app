import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sports_event_app/data/models/event.dart';
import 'package:sports_event_app/presentation/core/app_colors.dart';
import 'package:sports_event_app/presentation/screens/event_detail_page.dart';
import 'package:sports_event_app/presentation/widgets/event_item_widget.dart';

// For larger projects that require complex internal navigation between screens
// (e.g., with multiple levels of pages), GoRouter and ShellRoute (go_router
// package) can be used.

class EventRangeWidget extends StatefulWidget {
  final List<Event> events;
  final VoidCallback onRefresh;

  const EventRangeWidget({
    required this.events,
    required this.onRefresh,
    super.key,
  });

  @override
  State<EventRangeWidget> createState() => _EventRangeWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(IterableProperty<Event>('events', events))
    ..add(ObjectFlagProperty<VoidCallback>.has('onRefresh', onRefresh));
  }
}

class _EventRangeWidgetState extends State<EventRangeWidget> {
  final _selectedEvent = ValueNotifier<int?>(null);

  @override
  void initState() {
    _reset();
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: _selectedEvent,
      builder: (context, selected, child) {
        if (selected == null) {
          return RefreshIndicator(
            color: AppColors.appBarBackgroundColor,
            onRefresh: () async => widget.onRefresh(),
            child: ListView.separated(
                itemCount: widget.events.length + 1,
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 4,
                        thickness: 1,
                        color: AppColors.lightGreyBackgroundColor,
                      ),
                    ),
                itemBuilder: (context, index) {
                  if (index == widget.events.length) {
                    return Container();
                  }
                  return EventItemWidget(
                    event: widget.events[index],
                    onTap: () => _selectedEvent.value = index,
                  );
                }),
          );
        } else {
          return EventDetailPage(
            event: widget.events[selected],
            onBack: () => _selectedEvent.value = null,
          );
        }
      },
    );
  }

  void _reset() {
    _selectedEvent.value = null;
  }
}
