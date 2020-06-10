import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  const ToolTipDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('轻量级提示'),
      ),
      body:Center(
        child:Tooltip(
          message:'提示消息',
          child:Image.network('http://image.biaobaiju.com/uploads/20190928/18/1569667679-oGhRfBpxDb.jpg')
        )
      )
    );
  }
}