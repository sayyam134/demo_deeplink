import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'text_tab.dart';
import 'image_tab.dart';
import 'video_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Navigation Bar with Deep Linking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => '/text',
    ),
    GoRoute(
      path: '/text',
      builder: (context, state) => HomePage(tabIndex: 0),
    ),
    GoRoute(
      path: '/image',
      builder: (context, state) => HomePage(tabIndex: 1),
    ),
    GoRoute(
      path: '/video',
      builder: (context, state) => HomePage(tabIndex: 2),
    ),
  ],
);

class HomePage extends StatefulWidget {
  final int tabIndex;

  HomePage({required this.tabIndex});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Navigation Bar'),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/text');
                break;
              case 1:
                context.go('/image');
                break;
              case 2:
                context.go('/video');
                break;
            }
          },
          tabs: [
            Tab(text: 'Text'),
            Tab(text: 'Image'),
            Tab(text: 'Video'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TextTab(),
          ImageTab(),
          VideoTab(),
        ],
      ),
    );
  }
}
