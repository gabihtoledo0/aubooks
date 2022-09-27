import 'package:flutter/material.dart';
import 'package:aubooks/components/header.dart';
import 'package:aubooks/components/box_audios.dart';
import 'package:aubooks/resources/notifiers/audio_books_notifier.dart';
import 'package:provider/provider.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<MyList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      Provider.of<AudioBooksNotifier>(context,listen: false).getBooks();
    }
  }

  _MyList() {
    _scrollController.addListener(_onScroll);
  }

  @override

  Widget build(BuildContext context) {
    return Consumer(
          builder: (BuildContext context, AudioBooksNotifier notifier, _) {
            if (notifier.topBooks.isEmpty) {
              return CustomScrollView(
                controller: _scrollController,
                slivers: const <Widget>[
                  SliverToBoxAdapter(
                    child: HeaderImageAsset(),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(top: 64),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "Sem livros baixados no momento",
                          style: TextStyle(
                              fontFamily: 'Sansation',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFFFFF)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
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
                  padding: EdgeInsets.only(left: 24, top: 40, bottom: 18),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Mais baixados",
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
                              book: notifier.topBooks[index], onTap: () => {}),
                      childCount: notifier.topBooks.length,
                    ),
                  ),
                ),
              ],
            );
          }
    );
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}