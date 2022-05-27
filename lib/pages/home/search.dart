import 'package:flutter/material.dart';
import 'package:aubooks/components/logo.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  bool _searchBoolean = false; //add

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF39403E),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.only(left: 18),
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: !_searchBoolean ?
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = true;
                          });
                        })
                    :
                    IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchBoolean = false;
                          });
                        }
                    ),
                    hintText: 'Autor ou título',
                    border: InputBorder.none),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}