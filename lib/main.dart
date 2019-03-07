import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//void main() => runApp( new RandomWords());

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}



class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions =  <WordPair>[];
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
        title: 'Word Pair App',
        home:    new Scaffold(
          appBar: new AppBar(title: new Text('WordPair Generator'),actions: <Widget>[
            new IconButton(icon: const Icon(Icons.list), onPressed: showFavourite)
          ],),
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
    final bool _alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(pair.asPascalCase,style: _biggerFont),
      trailing: new Icon(
          _alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Colors.red : null
      ),
      enabled: true,
      onTap: (){
          setState(() {
            if (_alreadySaved)
              _saved.remove(pair);
            else
              _saved.add(pair);
          }
          );
      },
    );
  }

  void showFavourite(){
  Navigator
      .of(context)
      .push(new MaterialPageRoute<void>(builder: (BuildContext context){
         final  Iterable<ListTile> tiles = _saved.map((WordPair pair){
           return new ListTile(
               title: new Text(pair.asPascalCase,style: _biggerFont));
         });

         final List<Widget> divided = ListTile.divideTiles(tiles: tiles, context: context).toList();
         return new Scaffold(
           appBar: new AppBar(
             title: new Text('Saved Suggestions'),
           ),
           body: new ListView(children: divided),
         );
  }
  ));
  }
}

class RandomWords extends StatefulWidget{
  RandomWordsState createState() => new RandomWordsState();
}