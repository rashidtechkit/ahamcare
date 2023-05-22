import 'package:ahamcare/view/store_events_screen/event_screen/event_screen.dart';
import 'package:ahamcare/view/store_events_screen/store_screen/store_screen.dart';
import 'package:ahamcare/view/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';

class StroreEventsScreen extends StatelessWidget {
  const StroreEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBarWidget(
          context,
          "Store And Events",
          const [
            Tab(
              text: "Store",
            ),
            Tab(
              text: "Events",
            ),
          ],
          false,
        ),
        body: const TabBarView(
          children: [
            StoreScreen(),
            EventScreen(),
          ],
        ),
      ),
    );
  }
}
