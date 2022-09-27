import 'package:flutter/material.dart';
import 'package:aubooks/components/box_audios.dart';
import 'package:aubooks/components/header.dart';
import 'package:aubooks/resources/notifiers/audio_books_notifier.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      Provider.of<AudioBooksNotifier>(context,listen: false).getBooks();
    }
  }

  _HomePageScreen() {
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
          builder: (BuildContext context, AudioBooksNotifier notifier, _) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: HeaderImageAsset(),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(left: 24, top: 24, bottom: 18),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Livros Recentes",
                      style: TextStyle(
                          fontFamily: 'Sansation',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF)
                      ),
                    ),
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
                          (context, index) =>
                          BookGridItem(
                              book: notifier.books[index], onTap: () => {}),
                      childCount: notifier.books.length,
                    ),
                  ),
                ),
              ],
            );
          }
    );
  }
}
