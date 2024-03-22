
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

import '../V4/V4.dart';
import '../main.dart';
class V1V2Finish extends StatefulWidget {
  V1V2Finish(this.Id,this.item,this.name,this.list,this.uid,this.CO);
  String Id;List item;String name;List list;String uid;int CO;
  @override
  State<V1V2Finish> createState() => _V1V2FinishState();
}

class _V1V2FinishState extends State<V1V2Finish> {
  var date ="";var index1 = 0;var time1 = "";var time2 = "";var time = 0;
  Duration duration = const Duration(hours: 0, minutes: 10);
  var TimeCon = TextEditingController();int count = 0;
  @override
  void initState() {
    super.initState();
    date1();_setCounterValue();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),), centerTitle: true,elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: widget.item.length, itemBuilder: (context, index,) { var  aa = widget.item[index]["時間"] ~/60 ;var  bb = widget.item[index]["時間"]  % 60.round();var  aa1 = widget.list[index] ~/60 ;var  bb1 = widget.list[index]  % 60.round();
                  return GestureDetector(onTap: ()  {},
                      child:Card(
                        shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(children: [
                              Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
                                  child:widget.item[index]["ジャンル"] == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "身支度"?Icon(Icons.water_drop,color: Colors.blue,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
                                  Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
                              Expanded(child:FittedBox(fit: BoxFit.scaleDown,child: Text(widget.item[index]["名前"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
                              Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                              Container(margin:EdgeInsets.all(5),child: Text(aa1.toString()+ "分" +bb1.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10),),),
                              Container(child:widget.CO == 0?
                              Container(alignment:Alignment.centerRight,child:IconButton(color: Colors.blue,onPressed: (){index1 = index;time1 = aa.toString()+ "分" +bb.toString()+ "秒";time2 = aa1.toString()+ "分" +bb1.toString()+ "秒";Edite();}, icon: Icon(Icons.edit,size:30),),):Container()),
                            ],),
                            //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                          ],),),));},),),
                  Container(margin:EdgeInsets.only(top:30,left: 20,right: 20),child: Text("お疲れ様でした！",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 20),child: Text("ルーティン終了をスタッフに報告しますか？",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey[200],fontSize: 15),textAlign: TextAlign.center,),),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                    Container(margin: EdgeInsets.only(top:20,bottom: 50), width:150,child: ElevatedButton(child:Text('報告する'),
                        style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
                        onPressed: () {Firebase();Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V4()),).then((value) {});}),),
                    Container(margin: EdgeInsets.only(top:20,bottom: 50),width:150, child: ElevatedButton(child:Text('報告しない'),
                        style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                        onPressed: () {
                          Firebase();Navigator.popUntil(context, (_) => count++ >= 4);
                        }),),
                  ],),
                ])));}

  void _setCounterValue() async {SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setInt(date, 1);}

  void date1 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');date = outputFormat.format(now);}

  void Edite (){showDialog(context: context, builder: (context) => AlertDialog(actions: <Widget>[
    Container(width: double.infinity,
      child:Column(children: [
        Container(margin:EdgeInsets.all(10),child: Text("予定時間を変更する" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
        Container(margin:EdgeInsets.all(10),child: Text("予定時間" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
        Container(margin:EdgeInsets.all(10),child: Text(time1 ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
        Container(margin:EdgeInsets.all(10),child: Text("今回かかった時間" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
        Container(margin:EdgeInsets.all(10),child: Text(time2 ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
        Container(width: double.infinity, margin: EdgeInsets.only(top:30,bottom: 5,left: 10,right: 10),
          child: TextFormField(onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); _showDialog(
              CupertinoTimerPicker(mode: CupertinoTimerPickerMode.hms, initialTimerDuration: duration,
                onTimerDurationChanged: (Duration newDuration) {setState(() => duration = newDuration);TimeCon.value = TextEditingValue(text: duration.toString());time = duration.inSeconds;},
              ));},controller: TimeCon,decoration: InputDecoration(labelText: '予定時間の変更', enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 3),)),),),
        Container(margin: EdgeInsets.only(top:20,bottom: 20), width:150,child: ElevatedButton(child:Text('変更する'),
            style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
            onPressed: () {EditeFix();Navigator.pop(context);}),),
      ]),)],));}
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(context: context,
        builder: (BuildContext context) => Container(height: 216, padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(top: false, child: child,),
        ));}
  void Firebase (){FirebaseFirestore.instance.collection("users").doc(widget.uid).collection("ルーティン").doc(widget.Id).update({"ルーティン": widget.item,});}
  void EditeFix(){
    setState(() { widget.item[index1]["時間"] = time;});
  }
}



class V1V2FinishA extends StatefulWidget {
  V1V2FinishA(this.Id,this.item,this.name,this.list,this.uid);
  String Id;List item;String name;List list;String uid;
  @override
  State<V1V2FinishA> createState() => _V1V2FinishAState();
}

class _V1V2FinishAState extends State<V1V2FinishA> {
  var date ="";var index1 = 0;var time1 = "";var time2 = "";var time = 0;int count = 0;
  Duration duration = const Duration(hours: 0, minutes: 10);
  var TimeCon = TextEditingController();
  @override
  void initState() {
    super.initState();
    date1();_setCounterValue();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),), centerTitle: true,elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: widget.item.length, itemBuilder: (context, index,) { var  aa = widget.item[index]["時間"] ~/60 ;var  bb = widget.item[index]["時間"]  % 60.round();var  aa1 = widget.list[index] ~/60 ;var  bb1 = widget.list[index]  % 60.round();
                  return GestureDetector(onTap: ()  {},
                      child:Card(
                        shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(children: [
                              Container(alignment: Alignment.centerRight,margin:EdgeInsets.all(5),
                                  child:widget.item[index]["ジャンル"] == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "身支度"?Icon(Icons.water_drop,color: Colors.blue,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
                                  Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
                              Expanded(child:FittedBox(fit: BoxFit.scaleDown,child: Text(widget.item[index]["名前"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),)),
                              Container(margin:EdgeInsets.all(5),child: Text(aa.toString()+ "分" +bb.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                              Container(margin:EdgeInsets.all(5),child: Text(aa1.toString()+ "分" +bb1.toString()+ "秒" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10),),),
                            ],),
                            //   Container(child: Text("｜",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                          ],),),));},),),
                  Container(margin:EdgeInsets.only(top:30,left: 20,right: 20),child: Text("お疲れ様でした！",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),
                  Container(margin:EdgeInsets.only(top:10,left: 20,right: 20),child: Text("ルーティン終了をスタッフに報告しますか？",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey[200],fontSize: 15),textAlign: TextAlign.center,),),
                  Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                    Container(margin: EdgeInsets.only(top:20,bottom: 50), width:150,child: ElevatedButton(child:Text('報告する'),
                        style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
                        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V4()),).then((value) {});}),),
                    Container(margin: EdgeInsets.only(top:20,bottom: 50),width:150, child: ElevatedButton(child:Text('報告しない'),
                        style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                        onPressed: () {;Navigator.popUntil(context, (_) => count++ >= 4); }),),
                  ],),
                ])));}

  void _setCounterValue() async {SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setInt(date, 1);}

  void date1 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');date = outputFormat.format(now);}

}