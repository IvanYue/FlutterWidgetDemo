import 'package:flutter/material.dart';
import 'bottom_tabbar_widget.dart_page.dart';
import 'custom_bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _allDemoList = [
    {'title':'底部Tabbar','widget':BottomTabbarWidget()},
    {'title':'异形底部Tabbar','widget':CustomBottomTabBarWidget()},
    {'title':'页面跳转动画','widget':''},
    {'title':'毛玻璃效果','widget':''},
    {'title':'保持页面状态','widget':''},
    {'title':'搜索条','widget':''},
    {'title':'简单流式布局','widget':''},
    {'title':'开合控件','widget':''},
    {'title':'开合控件列表','widget':''},
    {'title':'贝塞尔曲线','widget':''},
    {'title':'闪屏','widget':''},
    {'title':'右滑返回','widget':''},
    {'title':'轻量级提示','widget':''},
    {'title':'拖动效果','widget':''},
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('demo集合'),
      ),
      body: ListView(
        children:_allDemoList.map((info){
          return ListTile(
            title:Text(info['title']),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return info['widget'];
                  }
                  )
              );
            },
          );
        }).toList()
      ),
      
    );
  }
}
