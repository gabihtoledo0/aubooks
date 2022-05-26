import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookGridItem extends StatelessWidget {
  // final Book book;
  // final void Function() onTap;
  const BookGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: <Widget>[
          Hero(
            tag: "nome-livro_image",
            child: Container(
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider("https://www.seti.org/sites/default/files/styles/original/public/2019-09/Zork%20alien%20head%20PPR.jpg?itok=T7eTYzCZ"),
                      fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0)
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Spacer(),
                Text("Título", style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold
                ),),
                Text("Autor", style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
