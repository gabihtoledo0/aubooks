import 'package:flutter/material.dart';
import 'package:aubooks/pages/home/homepage_screen.dart';

class HomePageNavigation extends StatefulWidget {
  const HomePageNavigation({Key? key}) : super(key: key);

  @override
  _HomePageNavigation createState() => _HomePageNavigation();
}

class _HomePageNavigation extends State<HomePageNavigation> {
  int _currentIndex = 1;
  @override

  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final tabs = [
      ListView(children: const <Widget>[
        Text(
          "minha lista",
          style: TextStyle(
              fontFamily: 'Sansation',
              fontSize: 26,
              fontWeight: FontWeight.w300,
              color: Color(0xFFFFFFFF)
          ),
          textAlign: TextAlign.center,
        )
      ]),
      const HomePageScreen(),
      ListView(children: const <Widget>[
        Text(
          "pesquisar",
          style: TextStyle(
              fontFamily: 'Sansation',
              fontSize: 26,
              fontWeight: FontWeight.w300,
              color: Color(0xFFFFFFFF)
          ),
          textAlign: TextAlign.center,
        )
      ]),
      ListView(children: const <Widget>[
        Text(
          "conta",
          style: TextStyle(
              fontFamily: 'Sansation',
              fontSize: 26,
              fontWeight: FontWeight.w300,
              color: Color(0xFFFFFFFF)
          ),
          textAlign: TextAlign.center,
        )
      ]),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF39403E),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF141415),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.50),
        selectedLabelStyle: textTheme.caption,
        iconSize: 35,
        unselectedLabelStyle: textTheme.caption,
        onTap: (index) {
          // Respond to item press.
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Minha Lista',
            icon: Icon(Icons.format_list_bulleted),
          ),
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Buscar',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Conta',
            icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }
}



