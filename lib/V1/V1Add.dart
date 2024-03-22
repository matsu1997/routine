//
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// class V1Add extends StatefulWidget {
//   V1Add(this.uid); String uid;
//   @override
//   State<V1Add> createState() => _V1AddState();
// }
//
// class _V1AddState extends State<V1Add> {
//   @override
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   final flnp = FlutterLocalNotificationsPlugin();
//   var name = "";
//   final tags = ["月","火","水","木","金","土","日"];var selectedTags = <String>[];
//   final tags2 = [Day.monday,Day.tuesday,Day.wednesday,Day.thursday,Day.friday,Day.saturday,Day.sunday];var selectedTags2 = <Day>[];
//   var isOn = false; var isOn2 = false;
//
//   TimeOfDay? newTime ;
//   void initState() {
//     super.initState();
//     _initializePlatformSpecifics();
//    // _requestIOSPermission();
//     _initializePlatformSpecifics();
//     tz.initializeTimeZones();
//     // ローカルロケーションのタイムゾーンを東京に設定
//     tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text("ルーティンを作成",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
//           // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
//         ),
//         body: SingleChildScrollView(
//             child: Column(
//                 children: <Widget>[
//                   Container(width: double.infinity,
//                     margin: EdgeInsets.only(top:15,bottom: 5,left: 10,right: 10),
//                     child: TextFormField(decoration: InputDecoration(labelText: 'ルーティン名', enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 3),)),//controller: f2C,
//                       onChanged: (String value) {
//                         setState(() {name = value;});},),),
//                   Container(  margin: EdgeInsets.only(top:15,bottom: 5,left: 10,right: 10),
//                       child: Wrap(runSpacing: 7, spacing: 7,
//                     children: tags.map((tag) {
//                       final isSelected = selectedTags.contains(tag);
//                       return InkWell(
//                         borderRadius: const BorderRadius.all(Radius.circular(10)),
//                         onTap: () {setState(() {
//                             if (isSelected) {// すでに選択されていれば取り除く
//                               selectedTags.remove(tag);
//                               selectedTags2.remove(tag);
//                             } else {// 選択されていなければ追加する
//                               selectedTags.add(tag);
//                             }}); print(selectedTags);},
//                         child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 200),
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                           decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(width: 2, color: Colors.orange,),
//                             color: isSelected ? Colors.orange : null,
//                           ),
//                           child: Text(tag, style: TextStyle(color: isSelected ? Colors.white : Colors.orange, fontWeight: FontWeight.bold,),),),);}).toList(),
//                   )),
//                   Container(margin:EdgeInsets.all(10),child: Row(children: [
//                     Container(child: Text("ルーティンの開始通知"),),Container(child: TextButton(child: Text("曜日別設定"),onPressed: (){},),)],),),
//                   Container(margin:EdgeInsets.all(10),color:Colors.blueGrey[50],child: Row(children: [
//                     Container(child: Text("開始時間"),),Container(child: TextButton(child: Text(newTime.toString()),onPressed: (){_selectTime();},),)],),),
//                   Container(margin:EdgeInsets.all(10),color:Colors.blueGrey[50],child: Row(children: [
//                     Container(child: Text("通知許可"),),Container(child:Switch(value: isOn, onChanged: (bool? value) {if (value != null) {setState(() {isOn = value;print("$isOn");});}},),)],),),
//                   Container(child: Text("タイマー終了通知"),),
//                     Container(margin:EdgeInsets.all(10),color:Colors.blueGrey[50],child: Row(children: [
//                     Container(child: Text("音声通知を許可"),),Container(child:Switch(value: isOn2, onChanged: (bool? value) {if (value != null) {setState(() {isOn2 = value;print("$isOn2");});}},),)],),),
//                   Container(margin: EdgeInsets.only(top:10),width: 200, child: ElevatedButton(child:Text('登録'),
//                       style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
//                       onPressed: () {setState(()  {add();_showNotification();_showNotification();});}),),
//                 ])));}
//
//   Future<void> add() async {var aa = randomString(20);
//     await FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("ルーティン").doc(aa).set({
//      "名前":name,"曜日":selectedTags,"開始時間":"","通知許可":isOn,"通知頻度":"","通知音":"","音声通知許可":isOn2,"Id":aa,"ルーティン":[],
//     });Navigator.pop(context);}
//   void _selectTime() async {
//      newTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (context, child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
//           child: child!,
//         );
//       },
//     );setState(()  {});
//   }
//   void _initializePlatformSpecifics() {
//     var initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification: (id, title, body, payload) async {
//         // your call back to the UI
//       },
//     );
//
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (NotificationResponse res) {
//           debugPrint('payload:${res.payload}');
//         });
//   }
//
//   Future<void> _showNotification() async {
//    // var time = Time(newTime as int);
//     var time = Time(7,20,0);
//     var androidChannelSpecifics = AndroidNotificationDetails(
//       'CHANNEL_ID',
//       'CHANNEL_NAME',
//       channelDescription: "CHANNEL_DESCRIPTION",
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: false,
//       timeoutAfter: 10,
//       styleInformation: DefaultStyleInformation(true, true),
//     );
//
//     var iosChannelSpecifics = DarwinNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(android: androidChannelSpecifics, iOS: iosChannelSpecifics);
//     await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
//       0,
//       'Test Title at ${time.hour}:${time.minute}.${time.second}',
//       'Test Body', //null
//       Day.sunday,//tags2 as Day,
//       time,
//       platformChannelSpecifics,
//       payload: 'Test Payload',);
//   }
//   String randomString(int length) {
//     const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//     const _charsLength = _randomChars.length;
//     final rand = new Random();
//     final codeUnits = new List.generate(
//       length,
//           (index) {
//         final n = rand.nextInt(_charsLength);
//         return _randomChars.codeUnitAt(n);
//       },
//     );
//     return new String.fromCharCodes(codeUnits);
//   }
// }



import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class V1Add extends StatefulWidget {
  V1Add(this.uid); String uid;
  @override
  State<V1Add> createState() => _V1AddState();
}

class _V1AddState extends State<V1Add> {
  @override
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final flnp = FlutterLocalNotificationsPlugin();
  var name = "";
  final tags = ["月","火","水","木","金","土","日"];var selectedTags = <String>[];
  final tags2 = [Day.monday,Day.tuesday,Day.wednesday,Day.thursday,Day.friday,Day.saturday,Day.sunday];var selectedTags2 = <Day>[];
  var isOn = false; var isOn2 = false;

  TimeOfDay? newTime ;
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    // ローカルロケーションのタイムゾーンを東京に設定
    tz.setLocalLocation(tz.getLocation("Asia/Tokyo"));
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("ルーティンを作成",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(width: double.infinity, margin: EdgeInsets.only(top:100,bottom: 5,left: 10,right: 10),
                    child: TextFormField(decoration: InputDecoration(  filled: true,fillColor: Colors.orange.shade50,labelText: 'ルーティン名', enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.amber,width: 3),),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.amber,width: 3,)),
                    ),//controller: f2C,
                      onChanged: (String value) {setState(() {name = value;});},),),
                  Container(margin: EdgeInsets.only(top:50),width: 200, child: ElevatedButton(child:Text('登録'),
                      style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                      onPressed: () {setState(()  {add();});}),),
                ])));}

  Future<void> add() async {var aa = randomString(20);
  await FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("ルーティン").doc(aa).set({
    "名前":name,"曜日":selectedTags,"開始時間":"","通知許可":isOn,"通知頻度":"","通知音":"","音声通知許可":isOn2,"Id":aa,"ルーティン":[],
  });Navigator.pop(context);}
  void _selectTime() async {
    newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );setState(()  {});}

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

