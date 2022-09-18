import 'dart:async';
import 'dart:collection';
import 'package:aubooks/resources/models/models.dart';
import 'package:aubooks/resources/repository.dart';
import 'package:flutter/foundation.dart';

class AudioBooksNotifier with ChangeNotifier {
  List<Book> _books = [];
  List<Book> _top = [];
  bool _isLoading = false;
  bool _hasReachedMax = false;

  bool get hasReachedMax => _hasReachedMax;
  bool get isLoading => _isLoading;

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);
  UnmodifiableListView<Book> get topBooks => UnmodifiableListView(_top);

  AudioBooksNotifier() {
    print('LIVROS: $_books');
    if(_books.isEmpty)
      getBooks();
    getTopBooks();
  }

  Future<void> getTopBooks() async {
    // if(_isLoading) return;
    _isLoading = true;
    try {
      List<Book> res = await Repository().topBooks();
      _top = res;
    }catch(e) {
      // print(e.message);
      print(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }
  Future<void> getBooks() async {
    if(_isLoading) return;
    _isLoading = true;
    try {
      List<Book> res = await Repository().fetchBooks(_books.length, 20);
      if(res.isEmpty)
        _hasReachedMax = true;
      else
        _books.addAll(res);
      if (kDebugMode) {
        print('livros: $res');
      }
    }catch(e) {
      print(e);
    }
    _isLoading = false;
    notifyListeners();
  }

}