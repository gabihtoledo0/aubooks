import 'package:flutter/material.dart';
import 'package:aubooks/pages/home/homepage_screen.dart';
import 'package:aubooks/pages/home/my_list.dart';
import 'package:aubooks/pages/home/search.dart';
import 'package:audio_service/audio_service.dart';
import 'package:aubooks/resources/notifiers/audio_books_notifier.dart';
import 'package:provider/provider.dart';

import '../login/login.dart';

class HomePageNavigation extends StatefulWidget {
  const HomePageNavigation({Key? key}) : super(key: key);

  @override
  _HomePageNavigation createState() => _HomePageNavigation();
}

class _HomePageNavigation extends State<HomePageNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tabs = [
      const MyList(),
      const HomePageScreen(),
      const Search(),
      ListView(children: <Widget>[
        SizedBox(
          height: 50.0,
          child: OutlinedButton(
            child: const Text(
              "Meus dados",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9966DD)),
            ),
            onPressed: () {
              debugPrint('Received click');
            },
            style: OutlinedButton.styleFrom(
              side:
                  BorderSide(color: Color(0xFF9966DD), width: 2), //<-- SEE HERE
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 50.0,
          child: OutlinedButton(
            child: const Text(
              "Excluir conta",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9966DD)),
            ),
            onPressed: () {
              showExcluirContaDialog(context);
            },
            style: OutlinedButton.styleFrom(
              side:
                  BorderSide(color: Color(0xFF9966DD), width: 2), //<-- SEE HERE
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 50.0,
          child: OutlinedButton(
            child: const Text(
              "Sair",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9966DD)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: OutlinedButton.styleFrom(
              side:
                  BorderSide(color: Color(0xFF9966DD), width: 2), //<-- SEE HERE
            ),
          ),
        ),
      ]),
    ];

    return ChangeNotifierProvider(
      create: (_) => AudioBooksNotifier(),
      child: Scaffold(
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
              label: 'Mais Baixados',
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
      ),
    );
  }
}

showExcluirContaDialog(BuildContext context) {
  // configura o button
  Widget loginButton = FlatButton(
    child: Text("Sim"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    },
  );

  Widget no = FlatButton(
    child: Text("Não"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Deseja excluir sua conta?"),
    actions: [
      loginButton,
      no,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
