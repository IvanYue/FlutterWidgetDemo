import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatefulWidget {
  ExpansionTileDemo({Key key}) : super(key: key);

  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('开闭控件')),
        body: Container(
          color: Colors.lightBlue,
          child: ExpansionTile(
            title: Text('标题'),
            subtitle: Text('副标题'),
            leading: Icon(Icons.access_time),
            backgroundColor: Colors.pink,
            // trailing: Icon(Icons.arrow_drop_down),//右侧的箭头，可以不用替换
            initiallyExpanded: false, //初始状态，开true闭false
            children: <Widget>[
              ListTile(
                title: Text('list Tile'),
                subtitle: Text('subtile'),
              )
            ],
          ),
        ));
  }
}
