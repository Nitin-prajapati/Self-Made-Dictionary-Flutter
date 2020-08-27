import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screen/GridviewScreen.dart';
import 'Screen/RecentWordScreen.dart';
import 'Screen/AddnewwordForm.dart';
import 'Screen/WordList.dart';
import './Provider/CentraldataUnit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Data(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: {
          AddNewWord.routeName: (contex) => AddNewWord(),
          WordList.routeName: (contex) => WordList(),
        },
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> alpha = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z'
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddNewWord.routeName);
          },
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddNewWord.routeName);
              },
            )
          ],
          title: Text("AppName"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RecentWordCard(),
              GridViewScreen(alpha: alpha),
            ],
          ),
        ));
  }
}
