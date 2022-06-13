
import 'package:final_app/view/home.dart';
import 'package:final_app/view/search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List _widgetOptions =[
    MyHomePage(),
    Search(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 35,color: Colors.white,),
            Icon(Icons.search, size: 35,color: Colors.white,),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          buttonBackgroundColor: Colors.pink[100],
          height: 60,
          color: Colors.pink[200],
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.pink[50],
        ),
        body:_widgetOptions.elementAt(_page),

    );
  }
}
