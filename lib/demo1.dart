import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: new RandomWords(),
    );
  }
}
/// 添加一个 有状态的部件（Stateful widget）
/// Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
/// Stateful widgets 持有的状态可能在widget生命周期中发生变化. 实现一个 stateful widget 至少需要两个类:
/// 一个 StatefulWidget类。一个 State类。 StatefulWidget类本身是不变的，但是 State类在widget生命周期中始终存在.
/// 在这一步中，您将添加一个有状态的widget-RandomWords，它创建其State类RandomWordsState。State类将最终为widget维护建议的和喜欢的单词对。
/// 它也可以在MyApp之外的文件的任何位置使用，但是本示例将它放到了文件的底部。RandomWords widget除了创建State类之外几乎没有其他任何东西
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

/// 添加 RandomWordsState 类.该应用程序的大部分代码都在该类中，该类持有RandomWords widget的状态。
/// 这个类将保存随着用户滚动而无限增长的生成的单词对，以及喜欢的单词对，用户通过重复点击心形图标来将它们从列表中添加或删除。
/// 添加一个基本的build方法，该方法通过将生成单词对的代码从MyApp移动到RandomWordsState来生成单词对。
class RandomWordsState extends State<RandomWords>{

  /// 盛放初始数据的list集合
  final _suggestions = <WordPair>[];
  /// 盛放状态改变后数据的set集合，使用set存储可以去重
  final _saved = new Set<WordPair>();
  /// 初始字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('-Startup Name Generator-'),
        actions: <Widget>[new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          // ignore: referenced_before_declaration
          return _buildRow(_suggestions[index]);
        }
    );
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = ListTile
                .divideTiles(
                  context: context,
                  tiles: tiles,
                )
                .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text("saved suggestions"),
              ),
              body: new ListView(children: divided),
            );
          },
      ),
    );
  }
}
