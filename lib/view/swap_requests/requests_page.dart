import 'package:flutter/material.dart';
import 'package:skill_swap/generated/l10n.dart';

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
          tabs: <Widget>[
            Tab(
              child: Text(S.of(context).send),
            ),
            Tab(
              child: Text(S.of(context).receive),
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
