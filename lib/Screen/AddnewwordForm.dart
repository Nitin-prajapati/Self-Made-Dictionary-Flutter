import 'package:FlutterApp/Provider/CentraldataUnit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNewWord extends StatelessWidget {
  // const AddNewWord({Key key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  final _meaningNode = FocusNode();

  final _sentencefocusnode = FocusNode();

  String _word, _meaning, _sentence;

  static const routeName = '/addingform';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Word"),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'New Word'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_meaningNode),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter A word';
                      } else {
                        _word = value;
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Meaning'),
                    textInputAction: TextInputAction.next,
                    focusNode: _meaningNode,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_sentencefocusnode),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Meaning to word';
                      } else {
                        _meaning = value;
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Add Sentence To The Word'),
                    focusNode: _sentencefocusnode,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Sentence';
                      } else {
                        _sentence = value;
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        _formkey.currentState.validate();
                        Provider.of<Data>(context, listen: false)
                            .addNewWord(_word, _meaning, _sentence);
                        Navigator.of(context).pop();
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
