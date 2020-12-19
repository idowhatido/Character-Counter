import 'package:flutter/material.dart';

import 'LetterCounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  String inputText = "";
  int numberOfLetters = 0;
  int numberOfWords = 0;

  void textCountFunction() {
    StringCount stringCount = new StringCount(inputText);
    setState(() {
      numberOfLetters = stringCount.characterCounter();
      numberOfWords = stringCount.wordCounter();
    });
  }

  void reset() {
    setState(() {
      numberOfLetters = 0;
      numberOfWords = 0;
      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 99999,
                    style: TextStyle(color: Colors.white),
                    controller: myController,
                    decoration: InputDecoration(
                      hintText: "Enter your text here",
                      hintStyle: TextStyle(fontSize: 25.0, color: Colors.white),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white)),
                    ),
                    onChanged: (text) {
                      inputText = myController.text;
                      textCountFunction();
                    }),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Number of Characters :     ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      "$numberOfLetters",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Number of Words :     ",
                        style: TextStyle(color: Colors.white70)),
                    Text(
                      "$numberOfWords",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white70),
                    ),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          reset();
        },
      ),
    );
  }
}
