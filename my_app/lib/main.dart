import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  RandomWordsState createState() => RandomWordsState();
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: RandomWords(),
      /*home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter')
        ),
        body: Center(
          child: RandomWords(),
          //child:Text(wordPair.asPascalCase),
        ),
      ),*/
    );
  }
  
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asCamelCase);
    return Scaffold(
    appBar: AppBar(
      title: Text('Startup Names Generator'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.list),
        onPressed: _pushSaved),
      ],
    ),
    body: _buildSuggestions(),
  );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context){
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair){
              return ListTile(
                title: Text(
                  pair.asCamelCase,
                  style: _biggerFont,
                )
              );
            }
          );
          final List<Widget> divided = ListTile
          .divideTiles(tiles: tiles,
          context: context,)
          .toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
            );
        }
      )
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
    trailing: Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.deepOrangeAccent : null,
    ),
    onTap: (){
      setState((){
        if(alreadySaved){
          _saved.remove(pair);
        }else{
          _saved.add(pair);
        }
      });
    }
  );
}

  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
}
}


