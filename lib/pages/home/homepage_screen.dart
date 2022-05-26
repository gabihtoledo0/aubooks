import 'package:aubooks/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:aubooks/components/box_audios.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
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

  @override

  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        const SliverPadding(
          padding: EdgeInsets.only(top: 24),
          sliver: SliverToBoxAdapter(
            child: HeaderImageAsset(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.only(top: 32, bottom: 24, right: 24, left: 24),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Audiobooks",
              style: TextStyle(
                  fontFamily: 'Sansation',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFFFFFFF)
              ),
            )
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
              left: 24, right: 24, bottom: 24
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) => const BookGridItem(),
              childCount: 20,
            ),
          ),
        ),
      ],
    );
  }
}