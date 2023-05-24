import 'package:flutter/material.dart';

import 'Menu.dart';
import 'Quick.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
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
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Notes",
              // icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              text: "Menu",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Quick(),
          Menu(),
        ],
      ),
    );
  }
}
