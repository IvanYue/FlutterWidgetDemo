import 'package:flutter/material.dart';

class CustomBottomTabBarWidget extends StatefulWidget {
  CustomBottomTabBarWidget({Key key}) : super(key: key);

  @override
  _CustomBottomTabBarWidgetState createState() => _CustomBottomTabBarWidgetState();
}

class _CustomBottomTabBarWidgetState extends State<CustomBottomTabBarWidget> {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   title:Text('自定义Tabbar')
      // ),
      body: CustomPagesWidgets(title: ['首页','邮件','Custom','页面','个人中心'][_currentIndex] ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.blue,
        onPressed: (){
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color:Colors.lightBlue,
        shape: CircularNotchedRectangle(),//圆形缺口
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children:[
            IconButton(icon: Icon(Icons.home), onPressed: (){setState(() {
              _currentIndex = 0;
            });}),
            IconButton(icon: Icon(Icons.home), onPressed: (){setState(() {
              _currentIndex = 1;
            });}),
            IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){setState(() {
              _currentIndex = 2;
            });},splashColor: Colors.transparent,highlightColor: Colors.transparent,),
            IconButton(icon: Icon(Icons.home), onPressed: (){setState(() {
              _currentIndex = 3;
            });}),
            IconButton(icon: Icon(Icons.home), onPressed: (){setState(() {
              _currentIndex = 4;
            });}),
          ]
        ),
      ),
    );
  }
}


class CustomPagesWidgets extends StatefulWidget {

  String title;

  CustomPagesWidgets({Key key,this.title}) : super(key: key);

  @override
  _CustomPagesWidgetsState createState() => _CustomPagesWidgetsState();
}

class _CustomPagesWidgetsState extends State<CustomPagesWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(widget.title),
      ),
      body: Center(
        child:Text(widget.title)
      ),
    );
  }
}