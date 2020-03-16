import 'package:flutter/material.dart';

class ExpansionListDemo extends StatefulWidget {
  ExpansionListDemo({Key key}) : super(key: key);

  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionListDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('开闭控件')),
        body: Container(
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child:ExpansionPanelList(
              // animationDuration: ,
              )
          ),
        ));
  }
}
