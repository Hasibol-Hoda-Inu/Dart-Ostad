import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
                _tabController.animateTo(0);
              },
            ),
            ListTile(
              title: Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
                _tabController.animateTo(1);
              },
            ),
            ListTile(
              title: Text('Page 3'),
              onTap: () {
                Navigator.pop(context);
                _tabController.animateTo(2);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.business),
          ),
          Tab(
            icon: Icon(Icons.school),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyPage(number: 1, color: Colors.red),
          MyPage(number: 2, color: Colors.blue),
          MyPage(number: 3, color: Colors.green),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final int number;
  final Color color;

  const MyPage({required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'Page $number',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
