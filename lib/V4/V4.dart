
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:routine/V4/V4First.dart';
import 'package:routine/V4/V4Oner.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

import '../SignUp/SignUp.dart';
import '../main.dart';
class V4 extends StatefulWidget {
  @override
  State<V4> createState() => _V4State();
}

class _V4State extends State<V4> {
  var item = [];var map = {};
  var uid = "";var date = "";var dateSt2 = "";
  var user = "";var name = "";
  var co = 0;
  get onEng => null;
  var email = "";
  late TextEditingController _bodyController;
  void initState() {
    super.initState();_bodyController = TextEditingController();
    _getCounterValue();
    signup();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue[200],
          title: Text('報告',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          actions: <Widget>[IconButton(onPressed: () {if (email == "t@t.ttt"){start1();}else{start();}}, icon: Icon(Icons.flag_circle_rounded,size:30,color: Colors.white,))],
        ),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
          child:Container(color: Colors.blue[200],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(reverse:true,itemCount: item.length, itemBuilder: (context, index) {
                    return Card(elevation:0,color:Colors.blue[200],child: Container(margin: EdgeInsets.all(5),color: Colors.transparent,
                        child:Column(children: [
                          Container(margin:EdgeInsets.all(5),width:double.infinity,alignment:Alignment.center,child: Text(item[index]["曜日"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 15),),),
                          Container(child:item[index]["uid"] == "自分" ?Container(decoration: BoxDecoration(color: Colors.orange[200],borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(left:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),):
                          Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(right:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),))
                        ])));},),),
                Container(height: 68,color: Colors.white,
                    child:Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(padding: EdgeInsets.symmetric(horizontal: 16.0,),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40),),
                            child: TextField(controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,),onChanged: (String value) {setState(() {name = value;});},),),
                        ),
                        IconButton(
                          onPressed: () {send();FocusScope.of(context).requestFocus(new FocusNode());},
                          icon: Icon(Icons.send), iconSize: 28, color: Colors.blue,
                        ),],))
              ],),),));}
  // send();FocusScope.of(context).requestFocus(new FocusNode());

  void _loadData()  {item = [];
  FirebaseFirestore.instance.collection('users').doc(uid).collection("メッセージ").get().then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {setState(() {item = doc["メッセージ"];});});});
  }
  Future<void> send() async {date2();map = {"メッセージ":name,"uid":"自分","曜日":dateSt2,};var map1 = {"メッセージ":name,"uid":uid,"名前":"とし","曜日":Timestamp.now(),};item.insert(0,map);
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('メッセージ').doc("uid").set({
    "メッセージ" : item,
  });
  await FirebaseFirestore.instance.collection('管理メッセージ').doc("uid").update({"メッセージ": FieldValue.arrayUnion([map1])});
  setState(() {item;});_bodyController.clear();name = "";
  }
  void signup() async {SharedPreferences prefs = await SharedPreferences.getInstance();uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid;_loadData();}});}else{_loadData();};}
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);
  }
  void _getCounterValue() async { SharedPreferences prefs = await SharedPreferences.getInstance();email = prefs.getString("email")?? "";print(email);
  date1();
  var _counter = prefs.getInt(date)?? 0;print(date);
  if (_counter == 0){ Navigator.pop(context);Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4First()),).then((value) {});
  }else{}
  }
  void date1 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');date = outputFormat.format(now);}
  void date2 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('MM/dd/HH:mm');dateSt2 = outputFormat.format(now);}

  void start(){showModalBottomSheet(isScrollControlled: true, context: context,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(height: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(child: Icon(Icons.message,size: 80,color:Colors.orange),),
            Container(margin:EdgeInsets.all(10),child: Text("報告内容" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
            Container(margin:EdgeInsets.all(5),child: Text("今日習慣化できたこと\n今日頑張れたこと\nあなたの目標や夢\nアプリの不具合について" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15,height: 2),textAlign: TextAlign.center,),),
          ],),),);});}
  void start1(){showModalBottomSheet(isScrollControlled: true, context: context,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(height: 300,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(margin: EdgeInsets.only(top:20),width: 200, child: ElevatedButton(child:Text('START'),
                style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4Oner()),).then((value) {});});}),),
          ],),),);});}
}


class V4OnerV extends StatefulWidget {
  V4OnerV(this.uid,this.index1,this.List1);
  String uid;int index1 = 0; Map List1;
  @override
  State<V4OnerV> createState() => _V4OnerVState();
}

class _V4OnerVState extends State<V4OnerV> {
  var item = [];var map = {};
  var uid = "";var date = "";var dateSt2 = "";
  var user = "";var name = "";
  var co = 0;
  get onEng => null;
  late TextEditingController _bodyController;
  void initState() {
    super.initState();_bodyController = TextEditingController();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue[200],
          title: Text('報告',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          // actions: <Widget>[IconButton(onPressed: () {start1();}, icon: Icon(Icons.flag_circle_rounded,size:30,color: Colors.white,))],
        ),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
          child:Container(color: Colors.blue[200],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(reverse:true,itemCount: item.length, itemBuilder: (context, index) {
                    return Card(elevation:0,color:Colors.blue[200],child: Container(margin: EdgeInsets.all(10),color: Colors.transparent,
                        child:Column(children: [
                          Container(margin:EdgeInsets.all(5),width:double.infinity,alignment:Alignment.center,child: Text(item[index]["曜日"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 15),),),
                          Container(child:item[index]["uid"] == "自分" ?Container(decoration: BoxDecoration(color: Colors.orange[300],borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(left:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),):
                          Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(right:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),))
                        ])));},),),
                Container(height: 68,color: Colors.white,
                    child:Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(padding: EdgeInsets.symmetric(horizontal: 16.0,),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40),),
                            child: TextField(controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,),onChanged: (String value) {setState(() {name = value;});},),),
                        ),
                        IconButton(
                          onPressed: () {send();FocusScope.of(context).requestFocus(new FocusNode());},
                          icon: Icon(Icons.send), iconSize: 28, color: Colors.blue,
                        ),],))
              ],),),));}
  // send();FocusScope.of(context).requestFocus(new FocusNode());
  Future<void> send() async {date2();map = {"メッセージ":name,"uid":"開発者","曜日":dateSt2,};var map1 = {"メッセージ":name,"uid":"uid","名前":"開発者","曜日":Timestamp.now(),};item.insert(0,map);
  await FirebaseFirestore.instance.collection('users').doc(widget.uid).collection('メッセージ').doc("uid").set({
    "メッセージ" : item,
  });
  await FirebaseFirestore.instance.collection("管理メッセージ").doc("uid").update({"メッセージ": FieldValue.arrayRemove([widget.List1])});
  setState(() {item;});_bodyController.clear();name = "";
  }
  void _loadData()  {item = [];
  FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("メッセージ").get().then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {setState(() {item = doc["メッセージ"];});});});
  }
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);
  }
  void date1 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('yyyy年MM月dd日');date = outputFormat.format(now);}
  void date2 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('MM/dd/HH:mm');dateSt2 = outputFormat.format(now);}


}

class V1V4 extends StatefulWidget {
  @override
  State<V1V4> createState() => _V1V4State();
}

class _V1V4State extends State<V1V4> {
  var item = [];var map = {};
  var uid = "";var date = "";var dateSt2 = "";
  var user = "";var name = "";
  var co = 0;int count = 0;
  get onEng => null;
  late TextEditingController _bodyController;
  void initState() {
    super.initState();_bodyController = TextEditingController();
    signup();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor:Colors.blue[200],
            title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            elevation: 0,automaticallyImplyLeading: false,
            actions: <Widget>[  IconButton(onPressed: () { Navigator.popUntil(context, (_) => count++ >= 5);}, icon: Icon(Icons.highlight_off,size:30,color: Colors.white,)),]),
        body: GestureDetector( onTap: () => FocusScope.of(context).unfocus(),
          child:Container(color: Colors.blue[200],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(reverse:true,itemCount: item.length, itemBuilder: (context, index) {
                    return Card(elevation:0,color:Colors.blue[200],child: Container(margin: EdgeInsets.all(10),color: Colors.transparent,
                        child:Column(children: [
                          Container(margin:EdgeInsets.all(5),width:double.infinity,alignment:Alignment.center,child: Text(item[index]["曜日"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,fontSize: 15),),),
                          Container(child:item[index]["uid"] == "自分" ?Container(decoration: BoxDecoration(color: Colors.orange[200],borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(left:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),):
                          Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10),), margin:EdgeInsets.only(right:0),
                            child:Column(children: [
                              Container(margin:EdgeInsets.only(left: 10,right: 10,top:10,bottom: 10),width:double.infinity,child: Text(item[index]["メッセージ"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15,height: 1.5,letterSpacing: 2,),),),
                            ],),))
                        ])));},),),
                Container(height: 68,color: Colors.white,
                    child:Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(padding: EdgeInsets.symmetric(horizontal: 16.0,),
                            decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(40),),
                            child: TextField(controller: _bodyController,decoration: InputDecoration(border: InputBorder.none,),onChanged: (String value) {setState(() {name = value;});},),),
                        ),
                        IconButton(
                          onPressed: () {send();FocusScope.of(context).requestFocus(new FocusNode());},
                          icon: Icon(Icons.send), iconSize: 28, color: Colors.blue,
                        ),],))
              ],),),));}
  // send();FocusScope.of(context).requestFocus(new FocusNode());

  void _loadData()  {item = [];
  FirebaseFirestore.instance.collection('users').doc(uid).collection("メッセージ").get().then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {setState(() {item = doc["メッセージ"];});});});
  }
  Future<void> send() async {date2();map = {"メッセージ":name,"uid":"自分","曜日":dateSt2,};var map1 = {"メッセージ":name,"uid":uid,"名前":"とし","曜日":Timestamp.now(),};item.insert(0,map);
  await FirebaseFirestore.instance.collection('users').doc(uid).collection('メッセージ').doc("uid").set({
    "メッセージ" : item,
  });
  await FirebaseFirestore.instance.collection('管理メッセージ').doc("uid").update({"メッセージ": FieldValue.arrayUnion([map1])});
  setState(() {item;});_bodyController.clear();name = "";
  }
  void signup() async {SharedPreferences prefs = await SharedPreferences.getInstance();uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid; prefs.setString("アカウント", uid);_loadData();}});}else{_loadData();};}
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);
  }
  void date2 (){DateTime now = DateTime.now();DateFormat outputFormat = DateFormat('MM/dd/HH:mm');dateSt2 = outputFormat.format(now);}

  void start(){showModalBottomSheet(isScrollControlled: true, context: context,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(height: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(child: Icon(Icons.message,size: 80,color:Colors.orange),),
            Container(margin:EdgeInsets.all(10),child: Text("報告内容" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),),),
            Container(margin:EdgeInsets.all(5),child: Text("・今日習慣化できたこと" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
            Container(margin:EdgeInsets.all(5),child: Text("・今日頑張れたこと" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
            Container(margin:EdgeInsets.all(5),child: Text("・あなたの目標や夢" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
            Container(margin:EdgeInsets.all(5),child: Text("・アプリの不具合について" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),),),
          ],),),);});}
  void start1(){showModalBottomSheet(isScrollControlled: true, context: context,
      shape: const RoundedRectangleBorder( borderRadius: BorderRadius.vertical(top: Radius.circular(25.0),),),
      builder: (context) {return Container(height: 300,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(margin: EdgeInsets.only(top:20),width: 200, child: ElevatedButton(child:Text('START'),
                style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                onPressed: () {setState(()  { Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4Oner()),).then((value) {});});}),),
          ],),),);});}
}