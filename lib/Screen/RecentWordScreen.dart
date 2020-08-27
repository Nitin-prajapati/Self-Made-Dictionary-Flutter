import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/CentraldataUnit.dart';

class RecentWordCard extends StatelessWidget {
  const RecentWordCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _wordMeaning = Provider.of<Data>(context).Returnlist;
    return SingleChildScrollView(
      child: Container(
          height: 100,
          margin: const EdgeInsets.all(10),
          child: Card(
            elevation: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Last Word Added",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w800)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_wordMeaning[_wordMeaning.length - 1]['word'],
                        style: TextStyle(fontSize: 30)),
                    Text("-----------", style: TextStyle(fontSize: 15)),
                    Text(
                      _wordMeaning[_wordMeaning.length - 1]['meaning'],
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
