import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  KeepAliveWidget({Key key}) : super(key: key);

  @override
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}
/*
with是dart的关键字，意思是混入的意思，
就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，避免多重继承导致的问题。
SingleTickerProviderStateMixin 主要是我们初始化TabController时，
需要用到vsync ，垂直属性，然后传递this
*/
class _KeepAliveWidgetState extends State<KeepAliveWidget> with SingleTickerProviderStateMixin {
  TabController _controller;

  //重写初始化和销毁方法
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override//重写被释放的方法，只释放TabController
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:Text('保持页面状态'),
         bottom: TabBar(
           controller: _controller,
           tabs:[
             Tab(icon: Icon(Icons.directions_car)),
             Tab(icon: Icon(Icons.directions_bike),),
             Tab(icon: Icon(Icons.directions_bus),)
           ],
         ),
       ),
       body: TabBarView(
         children: <Widget>[
            DemoPage(),
            DemoPage(),
            DemoPage()
         ],
         controller: _controller,
       ),
    );
  }
}

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

//AutomaticKeepAliveClientMixin : 切换tab后保留tab的状态，避免initState方法重复调用
class _DemoPageState extends State<DemoPage> with AutomaticKeepAliveClientMixin{

 int _count = 0;

 @override//AutomaticKeepAliveClientMixin 需要重写此方法。否则报错
  bool get wantKeepAlive => true;

@override
  void initState() {
    print('initState');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);//AutomaticKeepAliveClientMixin 必须实现
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment:MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             Text('$_count'),
              Text('点一➕一')
           ],
         ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           setState(() {
             _count ++;
           });
         },
         child: Icon(Icons.add,color:Colors.white),
         ),
    );
  }
}