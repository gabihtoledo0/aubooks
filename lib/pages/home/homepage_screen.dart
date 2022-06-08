import 'package:flutter/material.dart';
import 'package:aubooks/components/box_audios.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aubooks/components/header.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {
  @override

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const HeaderImageAsset(),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 18),
          child: Text(
            "Pra você",
            style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16/8,
            viewportFraction: 0.4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: BookGridItem(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 18),
          child: Text(
            "Romance",
            style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16/8,
            viewportFraction: 0.4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: BookGridItem(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 18),
          child: Text(
            "Suspense",
            style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16/8,
            viewportFraction: 0.4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: BookGridItem(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 18),
          child: Text(
            "Desenho",
            style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16/8,
            viewportFraction: 0.4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: BookGridItem(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 18),
          child: Text(
            "Documentário",
            style: TextStyle(
                fontFamily: 'Sansation',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF)
            ),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16/8,
            viewportFraction: 0.4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: BookGridItem(),
          ),
        ),
      ],
    );
  }
}