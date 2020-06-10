import 'package:flutter/material.dart';
import 'main.dart';
import 'custom_navigationPush_animation.dart';
class CustomSplashScreen extends StatefulWidget {
  CustomSplashScreen({Key key}) : super(key: key);

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> with SingleTickerProviderStateMixin{


  AnimationController _controller;//控制动画的动画器，常用控制时间·
  Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration:Duration(seconds:3),);
    _animation = Tween(begin:0.0,end:1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        //跳转并结束
        Navigator.of(context).pushAndRemoveUntil(
          CustomRouters(MyHomePage(),CutomTransitionsType.Fade_Transition),
          (route) => route == null);//固定格式
      }
    });
    //播放动画
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
       opacity: _animation,
       child: Image.network(
         'http://image.biaobaiju.com/uploads/20190928/18/1569667679-oGhRfBpxDb.jpg',
         scale: 2.0,//缩放
         fit: BoxFit.fill,//填充
         ),
       
    );
  }
}
