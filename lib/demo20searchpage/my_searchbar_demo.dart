import 'package:flutter/material.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';

import 'asset.dart';

class SearchBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchBarDemoState();
  }
}

class SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchBarDemo"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.lightGreen,
              ),
              onPressed: () {
                /*print("开始search");*/ MyToastUtils.showToastInBottom(
                    "开始search", 0);
                showSearch(context: context, delegate: SearchBarDelegate());
              })
        ],
      ),
    );
  }
}

/// 执行searchBarDelegate 类，这个类继承与SearchDelegate类，继承后要重写里边的四个方法。
/// 处理搜索相关
class SearchBarDelegate extends SearchDelegate<String> {
  /// buildActions方法时搜索条右侧的按钮执行方法，我们在这里方法里放入一个clear图标。
  /// 当点击图片时，清空搜索的内容。
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  /// 这个时搜索栏左侧的图标和功能的编写，这里我们才用AnimatedIcon，
  /// 然后在点击时关闭整个搜索页面，代码如下。
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  /// buildResults方法，是搜到到内容后的展现，因为我们的数据都是模拟的，
  /// 所以我这里就使用最简单的Container+Card组件进行演示了，不做过多的花式修饰了。
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.only(left: 15.0),
      child: Card(
        color: Colors.orange,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  /// 这个方法主要的作用就是设置推荐，就是我们输入一个字，然后自动为我们推送相关的搜索结果，这样的体验是非常好的。
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    // TODO: implement buildSuggestions
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey))
            ])),
        onTap: (){query = suggestionList[index];},
      ),
    );
  }
}
