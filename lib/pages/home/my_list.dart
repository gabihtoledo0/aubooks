import 'package:flutter/material.dart';
import 'package:aubooks/components/header.dart';
import 'package:aubooks/components/box_audios.dart';

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
      // Provider.of<AudioBooksNotifier>(context,listen: false).getBooks();
    }
  }

  _MyList() {
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
          padding: EdgeInsets.only(left: 24, top: 40, bottom: 18),
          sliver: SliverToBoxAdapter(
            child: Text(
              "Minha Lista",
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
          padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
          sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0
            ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => BookGridItem(),
            childCount: 5,
            ),
          ),
        ),
      ],
    );
  }
}