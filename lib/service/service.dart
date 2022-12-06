import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/book_model.dart';

class Service {
   static Future<String> _loadJsonBook () async{
      return await rootBundle.loadString('assets/book.json');
    }


  static  Future<void> loadBook() async{
      String jsonString = await _loadJsonBook();
      final jsonResponse = json.decode(jsonString);
      Book book = Book.fromjson(jsonResponse);
      print(book.data!.dataList[0].images[0].id);
      print(book.auther!.firstname);
    }
}