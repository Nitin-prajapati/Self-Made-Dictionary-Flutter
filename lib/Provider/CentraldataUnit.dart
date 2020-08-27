import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  final List _wordWithMeaning = [
    {
      'word': 'Hindrance',
      'meaning': 'Obstacle',
      'sentence': 'Fear is Biggest hindrance'
    },
    {
      'word': 'Steer',
      'meaning': 'Guide',
      'sentence': 'Always Steer Your Life In Positive Direction'
    },
    {
      'word': 'Dauntless',
      'meaning': 'Courage',
      'sentence': 'Dauntless Is A Charecterstic Of A Gentlemen'
    },
  ];
  get Returnlist {
    return [..._wordWithMeaning];
  }

  void addNewWord(String word, String meaning, String sentence) {
    _wordWithMeaning
        .add({'word': word, 'meaning': meaning, 'sentence': sentence});

    notifyListeners();
    print(_wordWithMeaning);
  }
}
