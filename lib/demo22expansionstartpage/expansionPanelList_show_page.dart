import 'package:flutter/material.dart';
import 'package:flutter_app/bean/ExpandStateBean.dart';

/// ExpansionPanelList 常用属性
/// expansionCallback:点击和交互的回掉事件，有两个参数，第一个是触发动作的索引，第二个是布尔类型的触发值。
/// children:列表的子元素，里边多是一个List数组。
class ExpansionPanelListShowWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ExpansionPanelListShowWidgetState();
  }
}

class ExpansionPanelListShowWidgetState
    extends State<ExpansionPanelListShowWidget> {
  var currentPanelIndex = -1;

  List<int> mList; // 组成一个int类型数组，用来控制索引

  List<ExpandStateBean> expandStateList; // 展开的状态列表，ExpandStateBean是自定义的

  //构造方法，调用这个类的时候自动执行
  ExpansionPanelListShowWidgetState() {
    mList = new List();
    expandStateList = new List();
    //便利为两个List进行赋值
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  //修改展开与闭合的内部方法
  _setCurrentIndex(int index, bool bol) {
    setState(() {
      //遍历可展开状态列表
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !bol;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我是展开闭合List案例demo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // 可滚动组件
        child: ExpansionPanelList(
          // 交互回掉属性，里边是个匿名函数
          expansionCallback: (index, bol) {
            // 调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpand) {
                  return ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text("i im title $index"),
                  );
                },
                body: ListTile(
                  title: Text("i im item title $index"),
                  subtitle: Text("i im item detail $index"),
                ),
                isExpanded: expandStateList[index].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}
