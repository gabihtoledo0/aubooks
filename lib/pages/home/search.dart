import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:aubooks/components/box_audios.dart';
import 'package:aubooks/pages/home/book_details.dart';
import 'package:aubooks/resources/models/models.dart';
import 'package:aubooks/resources/notifiers/audio_books_notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  TextEditingController textController = TextEditingController();
  final _scrollController = ScrollController();

  @override

  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, AudioBooksNotifier notifier, _) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 14
              ),
              sliver: SliverToBoxAdapter(
                child: AnimSearchBar(
                  width: 400,
                  textController: textController,
                  rtl: true,
                  helpText: "Título, Autor ou Gênero",
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(left: 24, bottom: 18),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Resultados para " "',
                  style: TextStyle(
                      fontFamily: 'Sansation',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
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
                  childCount: 4,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}