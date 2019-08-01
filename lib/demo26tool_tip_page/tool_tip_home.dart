import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToolTipDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToolTipState();
  }
}

class ToolTipState extends State<ToolTipDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "tool tip demo",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              backgroundColor: Colors.orange,
              color: CupertinoColors.white,
              wordSpacing: 5.0,
              fontSize: 14.0,
              fontFamily: "familyFontStyle",
            ),
          ),
          Tooltip(
            message: "bu yao pa,wo pa yang.",
            child: Center(
              child: Icon(Icons.all_inclusive),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
