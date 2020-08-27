import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/CentraldataUnit.dart';

class WordList extends StatelessWidget {
  const WordList({Key key}) : super(key: key);

  static const routeName = '/Wordlist';

  @override
  Widget build(BuildContext context) {
    final String _firstletter = ModalRoute.of(context).settings.arguments;
    final List _wordMeaningList = Provider.of<Data>(context).Returnlist;

    final List _requiredwords = [];

    for (var i = 0; i < _wordMeaningList.length; i++) {
      if (_wordMeaningList[i]['word'][0].toString().toUpperCase() ==
          _firstletter.toUpperCase()) {
        _requiredwords.add(_wordMeaningList[i]);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Word Start With ' + _firstletter.toUpperCase()),
      ),
      body: ListView.builder(
        itemCount: _requiredwords.length == 0 ? 1 : _requiredwords.length,
        itemBuilder: (BuildContext context, int index) {
          return _requiredwords.length == 0
              ? Center(
                  child: Text(
                      'No word Added with ' + _firstletter.toUpperCase(),
                      style: TextStyle(color: Colors.red)))
              : WordListWidget(
                  requiredWord: _requiredwords,
                  index: index,
                );
        },
      ),
    );
  }
}

class WordListWidget extends StatelessWidget {
  List requiredWord;
  int index;
  WordListWidget({
    this.index,
    this.requiredWord,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        height: 165,
        width: double.infinity,
        child: Card(
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          index.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        requiredWord[index]['word'],
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        requiredWord[index]['meaning'],
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text('Sentence :-' + requiredWord[index]['sentence']),
                ),
              ],
            )));
  }
}
