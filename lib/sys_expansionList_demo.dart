import 'package:flutter/material.dart';

class ExpansionListDemo extends StatefulWidget {
  ExpansionListDemo({Key key}) : super(key: key);

  @override
  _ExpansionDemoState createState() => _ExpansionDemoState();
}

class _ExpansionDemoState extends State<ExpansionListDemo> {

<<<<<<< HEAD
  List<ExpansionBean> _allList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      for (var i = 0; i < 20; i++) {
        _allList.add(ExpansionBean(i,false));
      }

    

  } 

=======
  List<ExpansionBean> _expansionList=[];

  @override
  void initState() {
    for (var i = 0; i < 20; i++) {
      _expansionList.add(ExpansionBean(i,false));
    }
    super.initState();
  }
>>>>>>> 378ce75ff907411e3463d0dc5d32aed35634a85e


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('开闭控件')),
        body: Container(
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child:ExpansionPanelList(
<<<<<<< HEAD
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
              
=======
              children: _expansionList.map((e){
                return ExpansionPanel(
                  headerBuilder: (context,bol){
                    return ListTile(
                      title: Text('Title is ${e.index}'),
                    );
                  }, 
                  body: ListTile(title: Text('Detail is ${e.index}'),),
                  isExpanded: e.isExpansion,//控制开合
                );
              }).toList(),
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _expansionList.forEach((e){
                    if(e.index == panelIndex){
                      e.isExpansion = !isExpanded;
                    }
                  });
                });
              },
              // animationDuration: ,
              )
>>>>>>> 378ce75ff907411e3463d0dc5d32aed35634a85e
          ),
        ));
  }
}

<<<<<<< HEAD
class ExpansionBean{
  var index;
  var isExpanded;
  ExpansionBean(this.index,this.isExpanded);
=======

class ExpansionBean{
  var index;//下标
  var isExpansion;//控制开合
  ExpansionBean(this.index,this.isExpansion);
>>>>>>> 378ce75ff907411e3463d0dc5d32aed35634a85e
}