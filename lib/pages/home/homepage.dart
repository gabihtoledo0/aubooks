import 'package:aubooks/pages/tela_inicial/primary_screen.dart';
import 'package:flutter/material.dart';
import 'package:aubooks/components/box_audios.dart';

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
      HomePageScreen(),
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
      backgroundColor: Colors.grey[800],
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black54,
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

class HomePageScreen extends StatelessWidget {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;


  void _onScroll() {
    // final maxScroll = _scrollController.position.maxScrollExtent;
    // final currentScroll = _scrollController.position.pixels;
    // if (maxScroll - currentScroll <= _scrollThreshold) {
    //   Provider.of<AudioBooksNotifier>(context,listen: false).getBooks();
    // }
  }

  _HomePageState() {
    _scrollController.addListener(_onScroll);
  }
  final HomePageScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListView(
        children: [
          HeaderImageAsset(),
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              const SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Text("Most Downloaded"),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => BookGridItem(),
                    childCount: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

