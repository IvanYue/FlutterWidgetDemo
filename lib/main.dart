import 'package:flutter/material.dart';
import 'bottom_tabbar_widget.dart_page.dart';
import 'custom_bottom_bar.dart';
import 'custom_navigationPush_animation.dart';
import 'custom_frost_widget.dart';
import 'keep_alive_demo.dart';
import 'custom_search_widget.dart';
import 'custom_wrap_widget.dart';
import 'sys_expansion_tile_demo.dart';
import 'sys_expansionList_demo.dart';
<<<<<<< HEAD
=======
import 'custom_beizer_demo.dart';
import 'custom_splashscreen.dart';
import 'custom_right_back.dart';
import 'sys_tool_tip_demo.dart';
import 'drop_widget_demo.dart';


>>>>>>> 378ce75ff907411e3463d0dc5d32aed35634a85e

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
    {'title':'页面跳转动画','widget':CustomNavigationPushAnimtionDome()},
    {'title':'毛玻璃效果','widget':FrostClassWidget()},
    {'title':'保持页面状态','widget':KeepAliveWidget()},
    {'title':'搜索条','widget':CustomSearchBarWidget()},
    {'title':'简单流式布局','widget':CustomWrapDemo()},
    {'title':'系统自带开合控件','widget':ExpansionTileDemo()},
    {'title':'系统自带开合控件列表','widget':ExpansionListDemo()},
<<<<<<< HEAD
    {'title':'贝塞尔曲线','widget':''},
    {'title':'闪屏','widget':''},
    {'title':'右滑返回','widget':''},
    {'title':'轻量级提示','widget':''},
    {'title':'拖动效果','widget':''},
=======
    {'title':'贝塞尔曲线','widget':CustomBeizerDemo()},
    {'title':'闪屏','widget':CustomSplashScreen()},
    {'title':'右滑返回','widget':CustomRightBackDemo()},
    {'title':'轻量级提示','widget':ToolTipDemo()},
    {'title':'拖动效果','widget':DraggableWidgetDemo()},
>>>>>>> 378ce75ff907411e3463d0dc5d32aed35634a85e
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
