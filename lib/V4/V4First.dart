
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../main.dart';
import 'V4.dart';
class V4First extends StatefulWidget {
  @override
  State<V4First> createState() => _V4FirstState();
}

class _V4FirstState extends State<V4First> {
  var date = "";
  @override

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return  WillPopScope( //こちらを追加
        onWillPop: () async => false,
    child: Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(margin:EdgeInsets.only(top:20,left: 50,right: 50),child:  Image.asset("images/chat.png"),),
                  Container(margin:EdgeInsets.only(top:30),child: Text("ルーティン終了を報告",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 25),),),
                  Divider(color: Colors.blueGrey,height: 10,thickness: 3,indent: 60,endIndent: 60,),
                  Container(margin:EdgeInsets.only(top:20,bottom:20,left: 20,right: 20),child: Text("開発者の私に\n「今日はこんなルーティン出来たよ!」など毎日の成果を教えてください!\nどんなに短いルーティンでも構いません。\nあなたの報告を楽しみにしています!",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 18,height: 3),textAlign: TextAlign.center,),),
                  Container(margin: EdgeInsets.only(top:50),width: 200,
                    child: ElevatedButton(child: const Text('ルーティンを始める'),
                      style: ElevatedButton.styleFrom(primary: Colors.yellow[800], onPrimary: Colors.white, shape: const StadiumBorder(),),
                      onPressed: () { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return MyApp();}),);},
                    ),),
                ]))));}
}


class V4Sign extends StatefulWidget {
  @override
  State<V4Sign> createState() => _V4SignState();
}

class _V4SignState extends State<V4Sign> {
  var date = "";
  @override

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return  WillPopScope( //こちらを追加
        onWillPop: () async => false,
    child:Scaffold(backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(margin:EdgeInsets.only(top:20,left: 50,right: 50),child:  Image.asset("images/chat.png"),),
                  Container(margin:EdgeInsets.only(top:30),child: Text("身につけたいルーティンを宣言",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
                  Divider(color: Colors.blueGrey,height: 10,thickness: 3,indent: 60,endIndent: 60,),
                  Container(margin:EdgeInsets.only(top:20,bottom:0,left: 20,right: 20),child: Text("開発者の私に\n身につけたいルーティンを教えてください!\nどんなに短いルーティンでも構いません。\nまずは宣言してみましょう!",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15,height: 3),textAlign: TextAlign.center,),),
                  Container(margin: EdgeInsets.only(top:30),width: 200, child: ElevatedButton(child: const Text('宣言する',style: TextStyle(fontWeight: FontWeight.bold,)),
                    style: ElevatedButton.styleFrom(primary: Colors.yellow[800], onPrimary: Colors.white, shape: const StadiumBorder(),),
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V4()),).then((value) {});},
                  ),),
                  Container(margin: EdgeInsets.only(top:30),width: 200, child: ElevatedButton(child: const Text('宣言しない',style: TextStyle(fontWeight: FontWeight.bold,)),
                    style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                    onPressed: () { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return MyApp();}),);},
                  ),),
                ])) ));}
}