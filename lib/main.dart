import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp( new RandomWords());


class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions =  <WordPair>[];
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        title: 'Word Pair App',
        home:    new Scaffold(
          appBar: new AppBar(title: new Text('WordPair Generator')),
          body: _buildSuggestions(),
        )
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
        itemBuilder: (BuildContext _context,  int i ){
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
    return new ListTile(
        title: new Text(pair.asPascalCase,style: _biggerFont)
    );
  }
}

class RandomWords extends StatefulWidget{
  RandomWordsState createState() => new RandomWordsState();
}