import 'package:flutter/material.dart';


class CustomWrapDemo extends StatefulWidget {
  CustomWrapDemo({Key key}) : super(key: key);

  @override
  _CustomWrapDemoState createState() => _CustomWrapDemoState();
}

class _CustomWrapDemoState extends State<CustomWrapDemo> {

  List<Widget>  _warpList;
  @override
  void initState() {
    _warpList = List<Widget>()..add(_buildAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('简单流式布局')
      ),
      body: Center(
        child:Opacity(
          opacity:0.5,
          child:Container(
            color: Colors.grey,
            child:Wrap(
              children:_warpList,
              spacing: 20,
            )
          )
        )
      ),
    );
  }



  Widget _buildAddButton(){
  return GestureDetector(
    //返回一个手势Widget，只用用于显示事件
    onTap: (){
      if(_warpList.length<9){
        setState(() {
          _warpList.insert(_warpList.length-1, _buildPhoto(_warpList.length));
        });
      }
    },
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width:80,
        height:80,
        color:Colors.grey,
        child:Icon(Icons.add)
      ),
      ),

  );
}

Widget _buildPhoto(int index){
  return Padding(
    padding:EdgeInsets.all(8),
    child: Container(width:80,height:80,color:Colors.pink,child: Text('照片$index'),),
    );
} 
}


