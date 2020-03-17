import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRightBackDemo extends StatelessWidget {
  const CustomRightBackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading:CupertinoButton(child: Icon(CupertinoIcons.back,color: CupertinoColors.white,), onPressed: ()=>Navigator.of(context).pop()),
        previousPageTitle: '',
        middle:Text('右滑返回',style: TextStyle(color:CupertinoColors.white),),
        backgroundColor:CupertinoColors.activeGreen
      ),
      backgroundColor: CupertinoColors.activeOrange,
      child: Center(
        child:CupertinoButton(
            padding: EdgeInsets.all(10),
            color: CupertinoColors.activeBlue,
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (BuildContext context){
                 return CustomRightBackDemo();
                })
              );
            },
          )
      ));
  }
}