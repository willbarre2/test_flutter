import 'package:flutter/material.dart';
import 'package:my_flutter_test/Pages/carto.dart';
import 'package:my_flutter_test/Pages/favs.dart';
import 'package:my_flutter_test/Pages/genarator.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = Favs();
        break;
      case 2:
        page = Carto();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 0, 11, 168),
            Color.fromARGB(255, 7, 8, 71),
          ])),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: page,
      ),
    );

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(child: mainArea),
              Container(
                decoration: BoxDecoration(boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Color.fromARGB(67, 0, 0, 0),
                    offset: Offset(-5, 0),
                    blurRadius: 10,
                  ),
                ]),
                child: BottomNavigationBar(
                  iconSize: 40,
                  backgroundColor: Color.fromARGB(255, 2, 8, 92),
                  selectedItemColor: Color.fromRGBO(0, 193, 230, 1),
                  unselectedItemColor: Color.fromRGBO(0, 88, 106, 1),
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.public),
                      label: 'Carto',
                    ),
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(child: mainArea),
            ],
          ),
        );
      }
    });
  }
}
