//
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'dart:math' as math;
//
// import 'V1V2Add.dart';
// import 'V1V2Start.dart';
// class MyCategory {
//   String title;
//   String junl;
//   int time;
//   String key;
//   MyCategory(this.title, this.junl, this.time, this.key,);
// }
// class V1V2 extends StatefulWidget {
//   V1V2(this.Id,this.item,this.name);
//   String Id;List item;String name;
//   @override
//   State<V1V2> createState() => _V1V2State();
// }
//
// class _V1V2State extends State<V1V2> {
//   late List<MyCategory> cateList;
//   @override
//   void initState() {
//     super.initState();
//     set();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//         appBar: AppBar(backgroundColor: Colors.white,
//           title:SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child:Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),))),
//           iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
//           // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
//         ),
//         floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,
//           child: Icon(Icons.add),
//           onPressed: () {
//            Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Add(widget.Id,widget.item,widget.name)),).then((value) {});
//           },),
//         body:  Column(children: <Widget>[
//             Expanded(child:ReorderableListView.builder(itemCount: widget.item.length, onReorder: (oldIndex, newIndex) {
//               if (oldIndex < newIndex) {
//                 newIndex -= 1;
//               }
//               final  mycate = widget.item.removeAt(oldIndex);
//               setState(() {
//                 widget.item.insert(newIndex, mycate);
//               });
//             }, itemBuilder: (context, index,) {var  aa = widget.item[index]["時間"] ~/60 ;var  bb = widget.item[index]["時間"]  % 60.round();
//                   return GestureDetector(
//                       onTap: ()  {
//                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(item[index]["Id"],item[index]["ルーティン"])),).then((value) {});
//                       },
//                       child:Card(   key: Key(widget.item[index]["名前"]),
//                         shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                         child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
//                           child: Column(children: [
//                             Row(children: [
//                   Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
//                       child:widget.item[index]["ジャンル"] == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
//                       Container(child:widget.item[index]["ジャンル"]== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
//                       Container(child:widget.item[index]["ジャンル"]== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
//                     Container(child:widget.item[index]["ジャンル"]== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
//                   Container(child:widget.item[index]["ジャンル"]== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
//                           Container(child:widget.item[index]["ジャンル"]== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
//                             Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
//                           SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child: Text(widget.item[index]["名前"]!,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
//                               Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
//                               Expanded(child:Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),child: Icon(Icons.dehaze_sharp,color: Colors.grey,size: 30,),)),
//                             ],),
//                          //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
//                           ],),),));},),),
//               Container(margin: EdgeInsets.only(top:10,bottom: 10),width: 80,height: 80, child: IconButton(//child:Text('登録'),
//                   style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
//                   onPressed: () {setState(()  async {start();});}, icon: Icon(Icons.play_circle,size: 70,color: Colors.blueGrey,),),),
//             ]));}
//   void start(){
//     showModalBottomSheet(isScrollControlled: true,
//         context: context,
//         shape: const RoundedRectangleBorder( // <-- SEE HERE
//           borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
//         builder: (context) {
//           return Container(height: 300,
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(child: Icon(Icons.self_improvement,size: 100,color:Colors.orange),),
//                   Container(margin:EdgeInsets.all(10),child: Text("深呼吸を５回" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
//                   Container(margin:EdgeInsets.all(10),child: Text("集中力を上げてから始めましょう" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
//                   Container(margin: EdgeInsets.only(top:20),width: 200, child: ElevatedButton(child:Text('START'),
//                       style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
//                       onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Start(widget.Id,widget.item,widget.name)),).then((value) {});});}),),
//                 ],
//               ),),);});
//   }
//   void set(){
//     for(int i = 0; i<widget.item.length; i++)
//       setState(() { cateList.add(MyCategory(widget.item[i]["名前"],widget.item[i]["ジャンル"],widget.item[i]["時間"],i.toString()));});
//
//   }
// }
//

//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'dart:math' as math;
//
// import 'V1V2Add.dart';
// import 'V1V2Start.dart';
// class MyCategory {
//   String title;
//   String junl;
//   int time;
//   String key;
//   MyCategory(this.title, this.junl, this.time, this.key,);
// }
// class V1V2 extends StatefulWidget {
//   V1V2(this.Id,this.item,this.name);
//   String Id;List item;String name;
//   @override
//   State<V1V2> createState() => _V1V2State();
// }
//
// class _V1V2State extends State<V1V2> {
//   late List<MyCategory> cateList ;
//   @override
//   void initState() {
//     super.initState();
//     cateList = [];
//     set();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.white,
//         appBar: AppBar(backgroundColor: Colors.white,
//           title:SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child:Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),))),
//           iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
//           // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
//         ),
//         floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Add(widget.Id,widget.item,widget.name)),).then((value) {});
//           },),
//         body:  Column(children: <Widget>[
//           Expanded(child:ReorderableListView.builder(itemCount: cateList.length, onReorder: (oldIndex, newIndex) {
//             if (oldIndex < newIndex) {
//               newIndex -= 1;
//             }
//             final  mycate = cateList.removeAt(oldIndex);
//             setState(() {
//               cateList.insert(newIndex, mycate);
//             });
//           }, itemBuilder: (context, index,) {var  aa = cateList[index].time ~/60 ;var  bb = cateList[index].time  % 60.round();
//           return GestureDetector(
//               onTap: ()  {
//                 // Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(item[index]["Id"],item[index]["ルーティン"])),).then((value) {});
//               },
//               child:Card(   key: Key(cateList[index].key),
//                 shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                 child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
//                   child: Column(children: [
//                     Row(children: [
//                       Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
//                           child:cateList[index].junl == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
//                           Container(child:cateList[index].junl== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
//                           Container(child:cateList[index].junl== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
//                           Container(child:cateList[index].junl== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
//                           Container(child:cateList[index].junl== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
//                           Container(child:cateList[index].junl== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
//                           Container(child:cateList[index].junl== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
//                           Container(child:cateList[index].junl== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
//                           Container(child:cateList[index].junl== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
//                           Container(child:cateList[index].junl== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
//                           Container(child:cateList[index].junl== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
//                           Container(child:cateList[index].junl== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
//                           Container(child:cateList[index].junl== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
//                           Container(child:cateList[index].junl== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
//                           Container(child:cateList[index].junl== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
//                           Container(child:cateList[index].junl== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
//                           Container(child:cateList[index].junl== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
//                           Container(child:cateList[index].junl== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
//                           Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
//                       SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child: Text(cateList[index].title!,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
//                       Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
//                       Expanded(child:Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),child: Icon(Icons.dehaze_sharp,color: Colors.grey,size: 30,),)),
//                     ],),
//                     //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
//                   ],),),));},),),
//           Container(margin: EdgeInsets.only(top:10,bottom: 10),width: 80,height: 80, child: IconButton(//child:Text('登録'),
//             style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
//             onPressed: () {setState(()  async {start();});}, icon: Icon(Icons.play_circle,size: 70,color: Colors.blueGrey,),),),
//         ]));}
//   void start(){
//     showModalBottomSheet(isScrollControlled: true,
//         context: context,
//         shape: const RoundedRectangleBorder( // <-- SEE HERE
//           borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
//         builder: (context) {
//           return Container(height: 300,
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(child: Icon(Icons.self_improvement,size: 100,color:Colors.orange),),
//                   Container(margin:EdgeInsets.all(10),child: Text("深呼吸を５回" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
//                   Container(margin:EdgeInsets.all(10),child: Text("集中力を上げてから始めましょう" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
//                   Container(margin: EdgeInsets.only(top:20),width: 200, child: ElevatedButton(child:Text('START'),
//                       style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
//                       onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Start(widget.Id,widget.item,widget.name)),).then((value) {});});}),),
//                 ],
//               ),),);});
//   }
//   void set(){
//     for(int i = 0; i<widget.item.length; i++)
//       setState(() { cateList.add(MyCategory(widget.item[i]["名前"],widget.item[i]["ジャンル"],widget.item[i]["時間"],i.toString())); });
//
//   }
// }
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math' as math;
import 'V1V2Add.dart';
import 'V1V2Start.dart';

import 'package:flutter/material.dart';
class MyCategory {
  String title;
  String junl;
  int time;
  String key;
  MyCategory(this.title, this.junl, this.time, this.key,);
}
class V1V2 extends StatefulWidget {
  V1V2(this.Id,this.item,this.name,this.uid,this.CO);
  String Id;List item;String name;String uid;int CO;
  @override
  State<V1V2> createState() => _V1V2State();
}

class _V1V2State extends State<V1V2> {
  var vis = false; var visB = false;var isOn = true;
  var date ="";var index1 = 0;var time1 = "";var time2 = "";var time = 0;
  var text = "慣れてきた方・時間通りに行動したい方へおすすめ";
  var TimeCon = TextEditingController();
  Duration duration = const Duration(hours: 0, minutes: 10);
  late List<MyCategory> cateList;
  // final SlidableController slidableController = SlidableController();
  @override
  void initState() {
    super.initState();
    cateList = [];
    text = "慣れてきた方・時間通りに行動したい方へおすすめ";
    set();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title:SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child:Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),textAlign: TextAlign.center,))),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Add(widget.Id,widget.item,widget.name,widget.uid)),).then((value) { _loadData();});
          },),
        body:SingleChildScrollView(child:Column(children: [
          Visibility(visible: vis, child:  Container(margin:EdgeInsets.only(top:10,bottom: 10),child:TextButton(child:Text("変更を保存しますか？",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue,fontSize: 15),),onPressed: (){set2();update();},) ),),
          Container(child: ReorderableListView.builder(itemCount: cateList.length,shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
            onReorder: (oldIndex, newIndex) {vis = true;if (oldIndex < newIndex) {newIndex -= 1;}final MyCategory mycate = cateList.removeAt(oldIndex);setState(() {cateList.insert(newIndex, mycate);});},
            itemBuilder: (context, index) {var  aa = cateList[index].time ~/60 ;var  bb = cateList[index].time  % 60.round();
            return Card( key: Key(cateList[index].key),
              shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                child: Column(children: [
                  Row(children: [
                    Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
                        child:cateList[index].junl == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
                        Container(child:cateList[index].junl== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
                        Container(child:cateList[index].junl== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
                        Container(child:cateList[index].junl== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
                        Container(child:cateList[index].junl== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
                        Container(child:cateList[index].junl== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
                        Container(child:cateList[index].junl== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
                        Container(child:cateList[index].junl== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
                        Container(child:cateList[index].junl== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
                        Container(child:cateList[index].junl== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                        Container(child:cateList[index].junl== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                        Container(child:cateList[index].junl== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                        Container(child:cateList[index].junl== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                        Container(child:cateList[index].junl== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
                        Container(child:cateList[index].junl== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
                        Container(child:cateList[index].junl== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
                        Container(child:cateList[index].junl== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
                        Container(child:cateList[index].junl== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
                        Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
                    Expanded(child:FittedBox(fit: BoxFit.scaleDown,child: Text(cateList[index].title!,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
                    Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                    Container(child:Row(mainAxisAlignment: MainAxisAlignment.end,children: [ Container(child: IconButton(onPressed: () {setState((){index1 = index;time1 = aa.toString()+ "分" +bb.toString()+ "秒";set2();Edite ();});}, icon: Icon(Icons.edit,size: 25,color: Colors.blue,),),) ],)),Container(child: Icon(Icons.dehaze_sharp,color: Colors.grey,size: 25,),),
                  ],),
                  //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                ],),),);},),),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text("自動スキップ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,),),),
            Container(child:Switch(value: isOn, onChanged: (bool? value) {if (value != null) {setState(() {isOn = value;print("$isOn");if (isOn == false){text = "初回・タスク完了時間がわからない方へおすすめ";}else{text = "慣れてきた方・時間通りに行動したい方へおすすめ";};});}},),),],),
          Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10,),),),
          Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text("音声通知されます",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10,),),),
          Visibility(visible: visB, child: Container(margin: EdgeInsets.only(top:30,bottom: 10),width: 80,height: 80, child: IconButton(//child:Text('登録'),
            style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
            onPressed: () {setState(()  async {set2();start();});}, icon: Icon(Icons.play_circle,size: 70,color: Colors.blueGrey,),),)),
        ],) ));
  }
  void set(){cateList = []; if (widget.item.length == 0){visB = false;}else{visB = true;}
  for(int i = 0; i<widget.item.length; i++)
    setState(() { cateList.add(MyCategory(widget.item[i]["名前"],widget.item[i]["ジャンル"],widget.item[i]["時間"],i.toString())); });
  }
  void set2(){widget.item = [];
  for(int i = 0; i<cateList.length; i++)
    setState(() { widget.item.add({"名前":cateList[i].title,"ジャンル":cateList[i].junl,"時間":cateList[i].time,}); });
  }
  void start(){
    showModalBottomSheet(isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
        builder: (context) {
          return Container(height: 320,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child: Icon(Icons.self_improvement,size: 100,color:Colors.orange),),
                  Container(margin:EdgeInsets.all(10),child: Text("深呼吸を５回" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
                  Container(margin:EdgeInsets.all(10),child: Text("集中力を上げてから始めましょう" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
                  Container(margin: EdgeInsets.only(top:20,bottom: 20),width: 200, child: ElevatedButton(child:Text('スタート'),
                      style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                      onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Start(widget.Id,widget.item,widget.name,widget.uid,isOn,widget.CO)),).then((value) {});});}),),
                ],
              ),),);});
  }
  void _loadData()  {
    FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("ルーティン").where("Id",isEqualTo:widget.Id ).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {widget.item = doc["ルーティン"];});set();
        ;});});}
  Future<void> update() async {
    await FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("ルーティン").doc(widget.Id).update({"ルーティン":widget.item,});}


  void Edite (){showDialog(context: context, builder: (context) =>StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(actions: <Widget>[
          Container(width: double.infinity,
            child:Column(children: [
              Container(margin:EdgeInsets.all(10),child: Text("予定時間を変更する" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
              Container(margin:EdgeInsets.all(10),child: Text("予定時間" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
              Container(margin:EdgeInsets.all(10),child: Text(time1 ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
              Container(width: double.infinity, margin: EdgeInsets.only(top:30,bottom: 5,left: 10,right: 10),
                child: TextFormField(onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); _showDialog(
                    CupertinoTimerPicker(mode: CupertinoTimerPickerMode.hms, initialTimerDuration: duration,
                      onTimerDurationChanged: (Duration newDuration) {setState(() => duration = newDuration);TimeCon.value = TextEditingValue(text: duration.toString());time = duration.inSeconds;},
                    ));},controller: TimeCon,decoration: InputDecoration(labelText: '予定時間の変更', enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 3),)),),),
              Container(margin: EdgeInsets.only(top:20,bottom: 20), width:150,child: ElevatedButton(child:Text('変更する'),
                  style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
                  onPressed: () {EditeFix();Navigator.pop(context);}),),
              Container(margin: EdgeInsets.only(top:20,bottom: 20), width:150,child: ElevatedButton(child:Text('削除する'),
                  style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                  onPressed: () { setState(() { widget.item.removeAt(index1);set();Navigator.pop(context);vis = true;
                  });}),),
            ]),)],);}));}
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(context: context,
        builder: (BuildContext context) => Container(height: 216, padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(top: false, child: child,),
        ));}
  void EditeFix(){
    setState(() { widget.item[index1]["時間"] = time;set();vis = true;var  aa = time ~/60 ;var  bb = time  % 60.round();time1 = aa.toString()+ "分" +bb.toString()+ "秒" ; });
  }

}

class V1V2A extends StatefulWidget {
  V1V2A(this.Id,this.item,this.name,this.uid,this.CO);
  String Id;List item;String name;String uid;int CO;
  @override
  State<V1V2A> createState() => _V1V2AState();
}

class _V1V2AState extends State<V1V2A> {
  var vis = false; var visB = false;var isOn = true;
  var date ="";var index1 = 0;var time1 = "";var time2 = "";var time = 0;
  var text = "慣れてきた方・時間通りに行動したい方へおすすめ";
  var TimeCon = TextEditingController();
  Duration duration = const Duration(hours: 0, minutes: 10);
  late List<MyCategory> cateList;
  // final SlidableController slidableController = SlidableController();
  @override
  void initState() {
    super.initState();
    cateList = [];
    text = "慣れてきた方・時間通りに行動したい方へおすすめ";
    set();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title:SizedBox(child:FittedBox(fit: BoxFit.fitWidth,child:Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),textAlign: TextAlign.center,))),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
        ),
        body:SingleChildScrollView(child:Column(children: [
          Container(child: ReorderableListView.builder(itemCount: cateList.length,shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
            onReorder: (oldIndex, newIndex) {vis = true;if (oldIndex < newIndex) {newIndex -= 1;}final MyCategory mycate = cateList.removeAt(oldIndex);setState(() {cateList.insert(newIndex, mycate);});},
            itemBuilder: (context, index) {var  aa = cateList[index].time ~/60 ;var  bb = cateList[index].time  % 60.round();
            return Card( key: Key(cateList[index].key),
              shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                child: Column(children: [
                  Row(children: [
                    Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
                        child:cateList[index].junl == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
                        Container(child:cateList[index].junl== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
                        Container(child:cateList[index].junl== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
                        Container(child:cateList[index].junl== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
                        Container(child:cateList[index].junl== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
                        Container(child:cateList[index].junl== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
                        Container(child:cateList[index].junl== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
                        Container(child:cateList[index].junl== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
                        Container(child:cateList[index].junl== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
                        Container(child:cateList[index].junl== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                        Container(child:cateList[index].junl== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                        Container(child:cateList[index].junl== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                        Container(child:cateList[index].junl== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                        Container(child:cateList[index].junl== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
                        Container(child:cateList[index].junl== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
                        Container(child:cateList[index].junl== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
                        Container(child:cateList[index].junl== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
                        Container(child:cateList[index].junl== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
                        Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
                    Expanded(child:FittedBox(fit: BoxFit.scaleDown,child: Text(cateList[index].title!,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
                    Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                    Container(child: Icon(Icons.dehaze_sharp,color: Colors.grey,size: 25,),),
                  ],),
                  //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                ],),),);},),),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text("自動スキップ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,),),),
            Container(child:Switch(value: isOn, onChanged: (bool? value) {if (value != null) {setState(() {isOn = value;print("$isOn");if (isOn == false){text = "初回・タスク完了時間がわからない方へおすすめ";}else{text = "慣れてきた方・時間通りに行いたい方へおすすめ";};});}},),),],),
          Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10,),),),
          Container(margin:EdgeInsets.only(left: 10,right: 10),child: Text("音声通知されます",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10,),),),
          Visibility(visible: visB, child: Container(margin: EdgeInsets.only(top:30,bottom: 10),width: 80,height: 80, child: IconButton(//child:Text('登録'),
            style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
            onPressed: () {setState(()  async {set2();start();});}, icon: Icon(Icons.play_circle,size: 70,color: Colors.blueGrey,),),)),
        ],) ));
  }
  void set(){cateList = []; if (widget.item.length == 0){visB = false;}else{visB = true;}
  for(int i = 0; i<widget.item.length; i++)
    setState(() { cateList.add(MyCategory(widget.item[i]["名前"],widget.item[i]["ジャンル"],widget.item[i]["時間"],i.toString())); });
  }
  void set2(){widget.item = [];
  for(int i = 0; i<cateList.length; i++)
    setState(() { widget.item.add({"名前":cateList[i].title,"ジャンル":cateList[i].junl,"時間":cateList[i].time,}); });
  }
  void start(){
    showModalBottomSheet(isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
        builder: (context) {
          return Container(height: 300,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child: Icon(Icons.self_improvement,size: 100,color:Colors.orange),),
                  Container(margin:EdgeInsets.all(10),child: Text("深呼吸を５回" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
                  Container(margin:EdgeInsets.all(10),child: Text("集中力を上げてから始めましょう" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
                  Container(margin: EdgeInsets.only(top:20),width: 200, child: ElevatedButton(child:Text('スタート'),
                      style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                      onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Start(widget.Id,widget.item,widget.name,widget.uid,isOn,widget.CO)),).then((value) {});});}),),
                ],
              ),),);});
  }
}



