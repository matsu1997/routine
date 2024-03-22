
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routine/V4/V4First.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../SignUp/SignUp.dart';
import '../V1/V1V2.dart';
class V2 extends StatefulWidget {
  @override
  State<V2> createState() => _V2State();
}

class _V2State extends State<V2> {
  var uid = "";var text = "";
 // ["勉強","運動","食事","仕事","移動","休憩","お風呂","用事","趣味","睡眠","家事","身支度","買い物","育児","人付き合い","娯楽","その他"];
  var item = [{"名前":"朝1H20M\n学習と朝食◯","Id":"das3rdf4D4dWss","曜日":[],"ルーティン":[{"ジャンル":"掃除","名前":"ベッドメイキング","時間":60,},{"ジャンル":"身支度","名前":"朝日を浴びながら水を飲む","時間":60,},{"ジャンル":"食事","名前":"朝ご飯","時間":1200,},{"ジャンル":"身支度","名前":"身支度","時間":1200,},{"ジャンル":"瞑想","名前":"瞑想","時間":600,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"その他","名前":"出かける前の確認","時間":180,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ,{"名前":"朝1H\n学習と朝食×","Id":"yudh2uhjnGaUUU","曜日":[],"ルーティン":[{"ジャンル":"掃除","名前":"ベッドメイキング","時間":60,},{"ジャンル":"身支度","名前":"朝日を浴びながら水を飲む","時間":60,},{"ジャンル":"身支度","名前":"身支度","時間":1200,},{"ジャンル":"瞑想","名前":"瞑想","時間":600,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"その他","名前":"出かける前の確認","時間":300,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ,{"名前":"朝1H20\n運動と朝食◯","Id":"2kjduzkghJJuBa1","曜日":[],"ルーティン":[{"ジャンル":"掃除","名前":"ベッドメイキング","時間":60,},{"ジャンル":"身支度","名前":"朝日を浴びながら水を飲む","時間":60,},{"ジャンル":"瞑想","名前":"瞑想","時間":600,},{"ジャンル":"運動","名前":"運動","時間":1500,},{"ジャンル":"身支度","名前":"身支度","時間":900,},{"ジャンル":"食事","名前":"朝ご飯","時間":1200,},{"ジャンル":"身支度","名前":"歯磨き","時間":300,},{"ジャンル":"その他","名前":"出かける前の確認","時間":180,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ,{"名前":"朝2H\n学習と運動と朝食◯","Id":"2YiUHjhwy1","曜日":[],"ルーティン":[{"ジャンル":"掃除","名前":"ベッドメイキング","時間":60,},{"ジャンル":"身支度","名前":"朝日を浴びながら水を飲む","時間":60,},{"ジャンル":"瞑想","名前":"瞑想","時間":600,},{"ジャンル":"運動","名前":"運動","時間":1500,},{"ジャンル":"身支度","名前":"身支度","時間":900,},{"ジャンル":"食事","名前":"朝ご飯","時間":1200,},{"ジャンル":"身支度","名前":"歯磨き","時間":300,},{"ジャンル":"その他","名前":"出かける前の確認","時間":180,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
   // ,{"名前":"","Id":"","曜日":[],"ルーティン":[{"ジャンル":"","名前":"","時間":0,},{"ジャンル":"","名前":"","時間":0,},{"ジャンル":"","名前":"","時間":0,},{"ジャンル":"","名前":"","時間":0,},{"ジャンル":"","名前":"","時間":0,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ];
  var item1 = [{"名前":"帰宅後1H10\n学習","Id":"78YhLnnjt65","曜日":[],"ルーティン":[{"ジャンル":"身支度","名前":"手洗いうがい","時間":60,},{"ジャンル":"身支度","名前":"部屋着に着替える","時間":240,},{"ジャンル":"瞑想","名前":"瞑想","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ,{"名前":"帰宅後2H10\n学習","Id":"hgyQ5ff7V","曜日":[],"ルーティン":[{"ジャンル":"身支度","名前":"手洗いうがい","時間":60,},{"ジャンル":"身支度","名前":"部屋着に着替える","時間":240,},{"ジャンル":"瞑想","名前":"瞑想","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
    ,{"名前":"帰宅後3H10\n学習","Id":"iuQ43DHTih896","曜日":[],"ルーティン":[{"ジャンル":"身支度","名前":"手洗いうがい","時間":60,},{"ジャンル":"身支度","名前":"部屋着に着替える","時間":240,},{"ジャンル":"瞑想","名前":"瞑想","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}

  ];
  var item2 = [{"名前":"夕食後3H\n学習・お風呂・歯磨き","Id":"asdu73jdjSHSh","曜日":[],"ルーティン":[{"ジャンル":"食事","名前":"飲み物を入れ机に座る","時間":60,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"お風呂","名前":"お風呂","時間":1800,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"休憩","名前":"休憩","時間":300,},{"ジャンル":"勉強","名前":"学習","時間":1500,},{"ジャンル":"身支度","名前":"歯磨き","時間":300,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
     ,{"名前":"お風呂〜寝るまでの2H\nストレッチ・読書・瞑想","Id":"EYjg78bsb1jU","曜日":[],"ルーティン":[{"ジャンル":"食事","名前":"水を飲む","時間":60,},{"ジャンル":"運動","名前":"ストレッチ","時間":900,},{"ジャンル":"勉強","名前":"学習or趣味","時間":3600,},{"ジャンル":"用事","名前":"明日の予定を書く","時間":300,},{"ジャンル":"瞑想","名前":"瞑想","時間":600,},{"ジャンル":"勉強","名前":"読書","時間":1800,},],"通知許可":true,"通知音":"","通知頻度":"","開始時間":"","音声通知許可":true,}
  ];
  var index1 = 0;var co = 0;
  List<Map<String, Object>> map = [];
  var isOn = false;var isOn2 = false;
  @override
  void initState() {
    super.initState();signup();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(top:50,left: 20,right: 10),child: Icon(Icons.sunny_snowing,size: 30,color:Colors.orange),), Container(margin:EdgeInsets.only(top:50,right: 20),child: Text("朝のルーティン",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),],),
                  Divider(color: Colors.blueGrey,thickness: 3,indent: 100,endIndent: 100,),
                  Container(margin:EdgeInsets.only(top:10),child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: item.length, itemBuilder: (context, index,) {
                      return GestureDetector(
                          onTap: ()  {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2A(item[index]["Id"]as String,item[index]["ルーティン"]as List,item[index]["名前"]as String,uid,1)),).then((value) {});},
                          child:Card(
                            shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                              child: Row(children: [
                                Expanded(child: Container(alignment: Alignment.center,margin:EdgeInsets.only(left: 50),child: Text(item[index]["名前"] as String,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center,)),),
                                 Container(alignment: Alignment.centerRight,width: 50,height: 50, child: IconButton(//child:Text('登録'),
                                  style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                                  onPressed: () {co = 0;index1 = index;add();}, icon: Icon(Icons.add_circle_outline_rounded,size: 30,color: Colors.blueGrey,)),),
                              ],),),));},),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),child: Icon(Icons.wb_twilight_sharp,size: 30,color:Colors.deepOrange),), Container(margin:EdgeInsets.only(top:20,right: 20),child: Text("夕方のルーティン",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),],),
                  Divider(color: Colors.blueGrey,thickness: 3,indent: 100,endIndent: 100,),
                  Container(margin:EdgeInsets.only(top:10),child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: item1.length, itemBuilder: (context, index,) {
                    return GestureDetector(
                        onTap: ()  {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2A(item1[index]["Id"]as String,item1[index]["ルーティン"]as List,item1[index]["名前"]as String,uid,1)),).then((value) {});},
                        child:Card(
                          shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                          child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                            child: Row(children: [
                              Expanded(child: Container(alignment: Alignment.center,margin:EdgeInsets.only(left: 50),child: Text(item1[index]["名前"] as String,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center)),),
                              Container(alignment: Alignment.centerRight,width: 50,height: 50, child: IconButton(//child:Text('登録'),
                                  style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                                  onPressed: () {co = 1;index1 = index;add();}, icon: Icon(Icons.add_circle_outline_rounded,size: 30,color: Colors.blueGrey,)),),
                            ],),),));},),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),child: Icon(Icons.nights_stay,size: 30,color:Colors.blueGrey[800]),), Container(margin:EdgeInsets.only(top:20,right: 20),child: Text("夜のルーティン",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),],),
                  Divider(color: Colors.blueGrey,thickness: 3,indent: 100,endIndent: 100,),
                  Container(margin:EdgeInsets.only(top:10,bottom: 50),child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: item2.length, itemBuilder: (context, index,) {
                    return GestureDetector(
                        onTap: ()  {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2A(item2[index]["Id"]as String,item2[index]["ルーティン"]as List,item2[index]["名前"]as String,uid,1)),).then((value) {});},
                        child:Card(
                          shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                          child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                            child: Row(children: [
                              Expanded(child: Container(alignment: Alignment.center,margin:EdgeInsets.only(left: 50),child: Text(item2[index]["名前"] as String,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center,)),),
                              Container(alignment: Alignment.centerRight,width: 50,height: 50, child: IconButton(//child:Text('登録'),
                                  style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                                  onPressed: () {co = 2;index1 = index;add();}, icon: Icon(Icons.add_circle_outline_rounded,size: 30,color: Colors.blueGrey,)),),
                            ],),),));},),),
                ])));}
  void signup() async {SharedPreferences prefs = await SharedPreferences.getInstance();uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid;}});}else{};}
  void add (){
    switch(co){
      case 0: text = item[index1]["名前"] as String;map = item[index1]["ルーティン"] as List<Map<String, Object>>; break;
      case 1: text = item1[index1]["名前"] as String;map = item1[index1]["ルーティン"] as List<Map<String, Object>>;break;
      case 2: text = item2[index1]["名前"] as String; map = item2[index1]["ルーティン"] as List<Map<String, Object>>;;
    }
    showDialog(context: context, builder: (context) => AlertDialog(actions: <Widget>[
    Container(width: double.infinity,
      child:Column(children: [
        Container(margin:EdgeInsets.all(10),child: Text("ルーティンを保存しますか？" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 18),textAlign: TextAlign.center,),),
         Container(margin:EdgeInsets.all(0),child: Text(text ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),textAlign: TextAlign.center,),),
        Container(margin: EdgeInsets.only(top:20,bottom: 20), width:150,child: ElevatedButton(child:Text('保存'),
            style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
            onPressed: () {add1();Navigator.pop(context);}),),
      ]),)],));}

  Future<void> add1() async {var aa = randomString(20);
  await FirebaseFirestore.instance.collection('users').doc(uid).collection("ルーティン").doc(aa).set({
    "名前":text,"曜日":[],"開始時間":"","通知許可":isOn,"通知頻度":"","通知音":"","音声通知許可":isOn2,"Id":aa,"ルーティン":map,
  });}

  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },
    );
    return new String.fromCharCodes(codeUnits);
  }

}