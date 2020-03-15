import 'package:flutter/material.dart';


class BottomTabbarWidget extends StatefulWidget {
  

  @override
  _BottomTabbarWidget createState() => _BottomTabbarWidget();
}

class _BottomTabbarWidget extends State<BottomTabbarWidget> {
  Color _bottomBarColor = Colors.blue;
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(['首页','邮件','页面','个人中心'][_selectIndex] ),
      // ),
      body: CustomPagesWidgets(title:['首页','邮件','页面','个人中心'][_selectIndex] ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon:Icon(Icons.home,color: Colors.black,),
            activeIcon:Icon(Icons.home,color: _bottomBarColor,),
            title: Text('首页',style: TextStyle(color: _bottomBarColor)),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.email,color: Colors.black,),
            activeIcon:Icon(Icons.email,color: _bottomBarColor),
            title: Text('邮件',style: TextStyle(color: _bottomBarColor))
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.pages,color: Colors.black,),
            activeIcon:Icon(Icons.pages,color: _bottomBarColor),
            title: Text('页面',style: TextStyle(color: _bottomBarColor))
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.airplay,color: Colors.black,),
            activeIcon:Icon(Icons.airplay,color: _bottomBarColor),
            title: Text('个人中心',style: TextStyle(color: _bottomBarColor),)
          )
        ],
        onTap: (index){
          setState(() {
            _selectIndex = index;
          });
        },
        currentIndex: _selectIndex,
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