import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive_flutter/adapters.dart';
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
       var bookBox =Hive.box<Book>('bookBox');
      bookBox.put('book1',book);

      var book1=bookBox.get('book1');
      // print(book.data!.dataList[0].images[0].id);
       print(book1!.auther!.firstname);
    }
}