import 'package:flutter/material.dart';
import 'package:flutter_app/demo27graggable_page/draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DraggableDemoState();
  }
}

class DraggableDemoState extends State<DraggableDemo> {
  Color _draggableColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("draggable demo"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            mOffset: Offset(80.0, 40.0),
            mWidgetColor: Colors.tealAccent,
          ),
          DraggableWidget(
            mOffset: Offset(185.0, 40.0),
            mWidgetColor: Colors.redAccent,
          ),
          Center(
            child: DragTarget(onAccept: (Color color) {
              _draggableColor = color;
            }, builder: (context, candidateData, rejectedData) {
              return Container(
                width: 200.0,
                height: 200.0,
                color: _draggableColor,
                child: Text("${candidateData.toString()}----${rejectedData.toString()}"),
              );
            }),
          )
        ],
      ),
    );
  }
}
