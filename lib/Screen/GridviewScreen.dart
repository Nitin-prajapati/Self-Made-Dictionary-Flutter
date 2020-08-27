import 'package:flutter/material.dart';

import 'WordList.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({
    Key key,
    @required this.alpha,
  }) : super(key: key);

  final List<String> alpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * (.7),
      child: GridView.count(
        crossAxisCount: 2,
        children: alpha
            .map((e) => InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(WordList.routeName, arguments: e);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.grey,
                      elevation: 5,
                      child: Center(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
