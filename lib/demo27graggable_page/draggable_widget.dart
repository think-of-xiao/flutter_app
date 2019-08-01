import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key key, @required this.mOffset, @required this.mWidgetColor})
      : assert(mOffset != null),
        assert(mWidgetColor != null),
        super(key: key);

  final Offset mOffset;
  final Color mWidgetColor;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DraggableWidgetState();
  }
}

class DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offset = widget.mOffset;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Draggable(
          data: widget.mWidgetColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.mWidgetColor,
          ),
          feedback: Container(
            width: 100.0,
            height: 100.0,
            color: widget.mWidgetColor.withOpacity(0.5),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              this.offset = offset;
            });
          },
        ));
  }
}
