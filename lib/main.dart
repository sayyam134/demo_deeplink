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
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Bottom Navigation with Deep Linking',
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
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'text',
          builder: (context, state) => HomePage(selectedIndex: 0),
        ),
        GoRoute(
          path: 'image',
          builder: (context, state) => HomePage(selectedIndex: 1),
        ),
        GoRoute(
          path: 'video',
          builder: (context, state) => HomePage(selectedIndex: 2),
        ),
      ]
    ),
  ],
);

class HomePage extends StatefulWidget {
  final int selectedIndex;

  HomePage({this.selectedIndex = 0}); // Default to the first tab

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bottom Navigation'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          TextTab(),
          ImageTab(),
          VideoTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
        ],
      ),
    );
  }
}
