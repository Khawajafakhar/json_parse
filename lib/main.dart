import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:parse_json_practise/models/author_model.dart';
import 'package:parse_json_practise/models/book_model.dart';
import 'package:parse_json_practise/models/data_list_model.dart';
import 'package:parse_json_practise/models/data_model.dart';
import 'package:parse_json_practise/models/images_model.dart';
import './service/service.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(AutherAdapter());
  Hive.registerAdapter(DataListAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(ImagesAdapter());
  await Hive.openBox<Book>('bookBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async{
  
    await Service.loadBook();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
       
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
