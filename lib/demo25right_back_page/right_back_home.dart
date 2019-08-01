import 'package:flutter/cupertino.dart';

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.activeBlue,
        child: Center(
          child: Container(
            height: 100.0,
            width: 100.0,
            color: CupertinoColors.activeOrange,
            child: CupertinoButton(
                child: Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => RightBackDemo()));
                }),
          ),
        ));
  }
}
