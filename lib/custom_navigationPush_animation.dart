import 'package:flutter/material.dart';

enum CutomTransitionsType {
  Nomal,
  Fade_Transition ,  //渐隐渐现过渡动画
  Scale_Transition , //缩放动画效果
  Rotation_Transition,//旋转+缩放旋转动画
  Slide_Transition,//左右滑动动画
}

class CustomNavigationPushAnimtionDome extends StatefulWidget {
  CustomNavigationPushAnimtionDome({Key key}) : super(key: key);

  @override
  _CustomNavigationPushAnimtionDomeState createState() => _CustomNavigationPushAnimtionDomeState();
}

class _CustomNavigationPushAnimtionDomeState extends State<CustomNavigationPushAnimtionDome> {

final _titles = [
  {'title':'默认','type':CutomTransitionsType.Nomal},
  {'title':'渐隐渐现过渡动画','type':CutomTransitionsType.Fade_Transition},
  {'title':'缩放动画效果','type':CutomTransitionsType.Scale_Transition},
  {'title':'旋转+缩放旋转动画','type':CutomTransitionsType.Rotation_Transition},
  {'title':'左右滑动动画','type':CutomTransitionsType.Slide_Transition}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('过渡动画')
      ),
       body: ListView(
         children: _titles.map((e){
          return ListTile(
            title:Text(e['title']),
            onTap: () {
              if(e['type'] == CutomTransitionsType.Nomal){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context){
                  return  SecondPages();
                }
              ));
              }else{
                Navigator.of(context).push(
                CustomRouters(SecondPages(), e['type']),
              );
              }
              
            },
          );
         }).toList(),
         
       ),
    );
  }
}

//自定义路由
class CustomRouters extends PageRouteBuilder{
  final CutomTransitionsType type;
  final Widget widget;
  CustomRouters(this.widget,this.type):super(
    transitionDuration:Duration(seconds:1),
    pageBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ){
      return widget;
    },
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child){
        if(type == CutomTransitionsType.Fade_Transition){
          //渐隐渐现过渡动画
          return FadeTransition(
              //透明度
              opacity: Tween(begin:0.0,end:1.0).animate(
                CurvedAnimation(//动画曲线
                  parent: animation1, 
                  curve: Curves.fastOutSlowIn
                )
              ),
              child: child,
            );
        }else if(type == CutomTransitionsType.Scale_Transition){
          //缩放动画效果
          return ScaleTransition(scale: Tween(begin:0.0,end:1.0).animate(
                CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)
            ),child: child,);
        }else if(type == CutomTransitionsType.Rotation_Transition){
          //旋转+缩放旋转动画
          return RotationTransition(
              turns: Tween(begin:0.0,end:1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
            child: ScaleTransition(scale: Tween(begin:0.0,end:1.0).animate(
                CurvedAnimation(parent:animation1,curve:Curves.fastOutSlowIn)),
                child: child,
              ),
            );
        }
        //左右滑动动画
        return SlideTransition(
                position: Tween(
                  begin:Offset(-1, 0),
                  end: Offset(0,0),
                ).animate(
                  CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn
                  )
                ),
                child: child,
              );

      }
    );
}




class SecondPages extends StatelessWidget {
  const SecondPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        appBar:AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('second_page',style: TextStyle(color:Colors.white),),
          // leading: Container(),
          elevation:1//AppBar和页面的融合度 0 完全融合 
        ),
        // body: Center(
        //   child:MaterialButton(
        //     child: Icon(Icons.navigate_before,color: Colors.blue,size: 64.0,),
        //     onPressed:(){
        //       Navigator.of(context).pop();
        //     } ,
        //   )
        // ),
      ),
    );
  }
}