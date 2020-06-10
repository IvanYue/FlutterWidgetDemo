import 'package:flutter/material.dart';

class ExpansionListDemo extends StatefulWidget {
  ExpansionListDemo({Key key}) : super(key: key);

  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionListDemo> {

  List<ExpansionBean> _allList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      for (var i = 0; i < 20; i++) {
        _allList.add(ExpansionBean(i,false));
      }

    

  } 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('开闭控件')),
        body: Container(
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child:ExpansionPanelList(
              animationDuration:Duration(seconds:1) ,
              children: _allList.map((e){
                return ExpansionPanel(
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      title: Text('第${e.index}行'),
                    );
                  },
                  body:ListTile(
                    title:Text('第${e.index}行详情')
                  )
                );
              }),
              expansionCallback: (index,bol){

              },),
              
          ),
        ));
  }
}

class ExpansionBean{
  var index;
  var isExpanded;
  ExpansionBean(this.index,this.isExpanded);
}