import 'package:flutter/material.dart';

import 'recieve_screen.dart';
import 'send_screen.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<RequestsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text("  SEND  "),
            ),
            Tab(
              child: Text("  RECEIVED  "),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          SendScreen(),
          RecieveSwapScreen(),
        ],
      ),
    );
  }
}
