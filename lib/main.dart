import 'package:flutter/material.dart';

import 'ui/home/fragment/fragmentHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
debugShowCheckedModeBanner: false,
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
   final List<Widget> _children = [

      MyApps(),
     MyApps(),
     MyApps()

  ];
  /// Handler for when you want to programmatically change
  /// the active index. Calling `setState()` here causes
  /// Flutter to re-render the tree, which `AnimatedBottomNavigationBar`
  /// responds to by running its normal animation.


  void onTabTapped(int index) {
    setState(() {

      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return
     Scaffold(
     //destination screen

          appBar: AppBar(

              title: const Text('Login Page')),
     body: Center(
       child: _children.elementAt(_currentIndex),
     ),

     bottomNavigationBar: BottomNavigationBar(

       items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           icon: Icon(Icons.home),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.business),
           label: 'Business',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.school),
           label: 'School',
         ),
       ],
       currentIndex: _currentIndex,
       selectedItemColor: Colors.amber[800],
       onTap: _onItemTapped,
     ),
       floatingActionButton: FloatingActionButton(onPressed: () {  },
         // ...FloatingActionButton properties...
       ),

       // Here's the new attribute:

       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
   );

  }

      void _onItemTapped(int index) {
        setState(() {
          _currentIndex = index;
        });
      }
}
