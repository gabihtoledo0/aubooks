import 'package:aubooks/pages/tela_inicial/primary_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  @override

  Widget build(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final tabs = [
      ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return _home(context, index);
        },
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black87,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xFFF8BBD0).withOpacity(.70),
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

_home(BuildContext context, int index) {
  return ListView(children: [
    HeaderImageAsset()
  ],
  );
}