import 'package:flutter/material.dart';
import 'Today.dart';
import 'monthly.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _HomeState extends State<Home> with TickerProviderStateMixin {
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
        backgroundColor: const Color(0xFFF96060),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Tasko Karo'),
        bottom: TabBar(

          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Today",
              // icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              text: "Monthly",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Today(),
          MonthTab(),
        ],
      ),
    );
  }
}
