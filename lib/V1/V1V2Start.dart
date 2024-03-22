

import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart'as prefix;
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'V1V2Finish.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio/just_audio.dart' as ja;
class V1V2Start extends StatefulWidget  {
  V1V2Start(this.Id,this.item,this.name,this.uid,this.on,this.CO);
  String Id;List item;String name;String uid;bool on;int CO;
  @override
  State<V1V2Start> createState() => _V1V2StartState();
}


class _V1V2StartState extends State<V1V2Start> with TickerProviderStateMixin , WidgetsBindingObserver {
  @override
  final _player = ja.AudioPlayer(
    // Handle audio_session events ourselves for the purpose of this demo.
    handleInterruptions: false,
    androidApplyAudioAttributes: false,
    handleAudioSessionActivation: false,
  );
  final flnp = FlutterLocalNotificationsPlugin();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final FlutterTts tts = FlutterTts();  FlutterTts flutterTts = FlutterTts();
  double progress = 1.0;
  var time = 0;var timeAdd = 0;var timeOn = 0;var timeOnAll = 0;var co = 0;
  var time0 = "";
  late Timer _timer ;
  late DateTime _time;
  late Timer timer1;
  var count = 0;
  var dif = 0;
  var uid = "";
  var time1 = "";
  var date = "";
  var item = [];var list = [];var listTime = [];
  late DateTime  now;late DateTime  now1;
  late AnimationController controller;
  bool isPlaying = false;
  var plus = false;var on = false;
  late Duration count1 ;
  int aa = 0;
  var coB = true;var coT = "一時停止";
  late DateTime addDateTime;var addTime = 0;var timeAll = 0;
  var nowA = DateTime.now();var nowB = DateTime.now();var nowC = DateTime.now();
  DateFormat outputFormat = DateFormat('HH:mm');
  String get countText {
    count1 = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count1.inHours}:${(count1.inMinutes % 60).toString().padLeft(2, '0')}:${(count1.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();initializeService(); initAudioService();
    AudioSession.instance.then((audioSession) async {
      await audioSession.configure(AudioSessionConfiguration.speech());
      _handleInterruptions(audioSession);
    });

    if (widget.on == true){firstOn();on = false;}else{first();on = true;}
    //_controller = VideoPlayerController.asset('music/test.mp3');_controller.initialize().then((_) {setState(() {}); _controller.play();});
    // ambiguate(WidgetsBinding.instance)!.addObserver(this);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.black,));
    _player.setAudioSource(AudioSource.asset('music/test.mp3'));

    _init();
  }

  void _init() async {

    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {
      // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      //  await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'));_player.loopMode;
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    controller.dispose();
    super.dispose();initAudioService11();
    flutterLocalNotificationsPlugin.cancelAll();_timer.cancel();
  }

  Widget build(BuildContext context) {
    return  WillPopScope( //こちらを追加
        onWillPop: () async => false,
    child:  Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,automaticallyImplyLeading: false,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          actions: <Widget>[  IconButton(//child:Text('登録'),
                style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
               onPressed: () {Navigator.pop(context); flutterLocalNotificationsPlugin.cancelAll();_player.pause();_timer.cancel(); }, icon: Icon(Icons.highlight_off,color: Colors.blueGrey,),),
          ],
        ),
        body: Container(margin:EdgeInsets.only(top:5),
            child: Column(
                children: <Widget>[
                  StreamBuilder<Map<String, dynamic>?>(
                    stream: FlutterBackgroundService().on('update'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {return Container(child: Container());}return Container();},),
                  Container(margin:EdgeInsets.all(20),decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 2, offset: Offset(0.5, 0.5),),], color: Colors.white,),
                      child:Column(children:[Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                        Container(alignment: Alignment.center,margin:EdgeInsets.only(top:20),
                            child:widget.item[count]["ジャンル"] == "勉強"?Icon(Icons.school,color: Colors.orangeAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "お風呂"?Icon(Icons.bathroom_outlined,color: Colors.blue,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "運動"?Icon(Icons.directions_run,color: Colors.red,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "食事"?Icon(Icons.restaurant_menu,color: Colors.lightGreenAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "仕事"?Icon(Icons.work,color: Colors.orange,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "瞑想"?Icon(Icons.self_improvement,color: Colors.orange,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "移動"?Icon(Icons.train,color: Colors.blueGrey,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "休憩"?Icon(Icons.audiotrack_rounded,color: Colors.pinkAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "用事"?Icon(Icons.task,color: Colors.deepOrange,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "買い物"?Icon(Icons.shopping_cart,color: Colors.purpleAccent,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "育児"?Icon(Icons.baby_changing_station,color: Colors.brown[100],size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "人付き合い"?Icon(Icons.people_alt_outlined,color: Colors.pink,size: 30,):
                            Container(child:widget.item[count]["ジャンル"]== "娯楽"?Icon(Icons.music_note,color: Colors.yellow,size: 30,):
                            Container(child:Icon(Icons.directions_run,color: Colors.blue,size: 30),))))))))))))))))))),
                        Container(margin:EdgeInsets.only(top:20,left: 10),child:  Text(widget.item[count]["名前"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),
                        ),
                        Container(margin:EdgeInsets.only(top:25,left: 10),child: Text(countText,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),),
                      ]),
                        Divider(color: Colors.blueGrey,thickness: 3,indent: 30,endIndent: 30,),
                        Visibility(visible: plus, child:  Container(margin:EdgeInsets.only(top:10,bottom: 10),child: Text(DateFormat.Hms().format(_time),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red,fontSize: 15),textAlign: TextAlign.center,),),),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                          Column(children: [IconButton(style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.black, shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid,),),),
                            icon:Icon(coB ? Icons.pause : Icons.play_arrow,size: 50,),  onPressed: () {stop(); },),
                            Container(margin:EdgeInsets.only(top:10,left: 10,bottom: 20),child: Text(coT,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10),textAlign: TextAlign.center,),),
                          ],),
                          Visibility(visible: on, child: Column(children: [IconButton( style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.black, shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid,),),),
                            onPressed: () {done();}, icon:Icon(Icons.check_circle_outline,size: 50),),
                            Container(margin:EdgeInsets.only(top:10,left: 15,bottom: 20),child: Text("完了",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10),textAlign: TextAlign.center,),),
                          ],)),
                          Column(children: [IconButton( style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.black, shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid,),),),
                            onPressed: () { if (widget.on == true){skipOn();}else{skip();}}, icon:Icon(Icons.skip_next,size: 50),),
                            Container(margin:EdgeInsets.only(top:10,left: 15,bottom: 20),child: Text("スキップ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10),textAlign: TextAlign.center,),),
                          ],), ],),])),
                  Expanded(child: ListView.builder(itemCount: widget.item.length, itemBuilder: (context, index,) { var  aa = widget.item[index]["時間"] ~/60 ;var  bb = widget.item[index]["時間"]  % 60.round();var  aa1 = list[index] ~/60 ;var  bb1 = list[index]  % 60.round();
                  return GestureDetector(
                      onTap: ()  {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(item[index]["Id"],item[index]["ルーティン"])),).then((value) {});
                      },
                      child:Card(
                        shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                          child: Column(children: [
                            Row(children: [
                              Container(margin:EdgeInsets.all(5), child:index == count?Icon(Icons.play_arrow_sharp,color: Colors.orangeAccent,size: 30,): Container(width: 30,height: 30,)),
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
                                  Container(child:widget.item[index]["ジャンル"]== "趣味"?Icon(Icons.sailing_rounded,color: Colors.redAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "睡眠"?Icon(Icons.bed,color: Colors.blue[100],size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "家事"?Icon(Icons.kitchen,color: Colors.green,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "掃除"?Icon(Icons.cleaning_services_outlined,color: Colors.blueAccent,size: 30,):
                                  Container(child:widget.item[index]["ジャンル"]== "身支度"?Icon(Icons.water_drop,color: Colors.lightBlueAccent,size: 30,):
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
                   Container(margin:EdgeInsets.only(top:0,left: 0,bottom: 30),child: Text("推定終了時間:" + date,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),textAlign: TextAlign.center,),),
                //   Container(margin: EdgeInsets.only(top:10,bottom: 30),width: 70,height: 70, child: IconButton(//child:Text('登録'),
                //     style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                //     onPressed: () {
                //       Navigator.pop(context); flutterLocalNotificationsPlugin.cancelAll();_player.pause();_timer.cancel(); }, icon: Icon(Icons.highlight_off,size: 70,color: Colors.blueGrey,),),),
                ]))));}
  void set (){setState(() {
    if (count    < widget.item.length){time = widget.item[count]["時間"];}else{}
    _time = DateTime.utc(0, 0, 0);
    controller = AnimationController(vsync: this, duration: Duration(seconds: time));
    controller.addListener(() {notify();
    if (controller.isAnimating) {setState(() {progress = controller.value;});
    } else {setState(() {progress = 1.0;isPlaying = false;});}});
  });}

  void startStopWatch (){
    _timer = Timer.periodic(Duration(seconds: 1), // 1秒毎に定期実行
          (Timer timer) async { timeAdd = timeAdd + 1;timeOnAll = timeOnAll + 1;await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'),);_player.play();
      if(Platform.isAndroid) {
        if (timeAdd  + 7 == widget.item[count]["時間"]){notify1();notify2();}
        if (timeAdd  + 3 == widget.item[count]["時間"]){
          ;_player.stop();await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'));_player.play();
          if (count + 1  < widget.item.length){
            _speak(widget.item[count]["名前"]+"の終了時間です。" + "次は"+widget.item[count + 1]["名前"]+"です。",);
          }else{
            _speak(widget.item[count]["名前"]+"の終了時間です。お疲れ様でした!" );//timer1.cancel();
          }}//else{await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'));_player.play();}
      } else if(Platform.isIOS) {
        if (timeAdd  + 4 == widget.item[count]["時間"]){notify1();notify2();}
        if (timeAdd  + 3 == widget.item[count]["時間"]){
          ;_player.stop();await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'));_player.play();
          if (count + 1  < widget.item.length){
            _speak(widget.item[count]["名前"]+"の終了時間です。" + "次は"+widget.item[count + 1]["名前"]+"です。",);
          }else{
            _speak(widget.item[count]["名前"]+"の終了時間です。お疲れ様でした!" );
            //timer1.cancel();
          }}//else{await _player.setAudioSource(AudioSource.asset('music/blunk1.mp3'));_player.play();}
      }
      setState(() {_time = _time.add(Duration(seconds: 1)); if (widget.on == true){setOn ();}else{}
      if (timeAdd < widget.item[count]["時間"] ){plus = false;}else{plus = true;}});
      },);
  }

  void stop (){
    if (coB == true){nowB = DateTime.now();coB = false;coT = "再開"; controller.stop();final flnp = FlutterLocalNotificationsPlugin();flnp.cancelAll();
    time1 = DateFormat.Hms().format(_time); _timer.cancel();
    if (_timer != null && _timer.isActive) _timer.cancel();
    setState(() {isPlaying = false;});}
    else{setState(() {
      nowC = DateTime.now();var dif = nowC.difference(nowB).inSeconds; timeAll = timeAll + dif;addDateTime = nowA.add(Duration(seconds: timeAll));date = outputFormat.format(addDateTime);
      isPlaying = true;coB = true;coT = "一時停止"; if (timeAdd < widget.item[count]["時間"] ){controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);}else{}startStopWatch ();});};
  }
  // void stopOn (){
  //   if (coB == true){coB = false;coT = "再開";_timer.cancel();controller.stop();final flnp = FlutterLocalNotificationsPlugin();flnp.cancelAll();
  //   time1 = DateFormat.Hms().format(_time);
  //   if (_timer != null && _timer.isActive) _timer.cancel();
  //   setState(() {isPlaying = false;});}
  //   else{setState(() { isPlaying = true;coB = true;coT = "一時停止";
  //     if (timeAdd < widget.item[count]["時間"] ){controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
  //   }else{}startStopWatch ();timeOn = 0;for(int i = count + 1; i<widget.item.length; i++){aa =  widget.item[i]["時間"];timeOn = timeOn + aa;
  //   }});
  //   };
  // }


  Future<void> done () async {
    timeAll = timeAll + timeAdd - widget.item[count]["時間"] as int;addDateTime = nowA.add(Duration(seconds: timeAll));date = outputFormat.format(addDateTime);
    await flutterLocalNotificationsPlugin.cancel(count);//timer1.cancel();
    if (count +1  < widget.item.length){
      setState(() {list[count] = timeAdd;  addTime = addTime + timeAdd - widget.item[count]["時間"] as int;
      ;count = count + 1;set();timeAdd = 0;if (coB == false){coB == false;stop();}
      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
      isPlaying = true;});
    }else{setState(() {list[count] = timeAdd;timeAdd = 0;}); flutterLocalNotificationsPlugin.cancelAll();_player.pause();Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Finish(widget.Id,widget.item,widget.name,list,widget.uid,widget.CO)),).then((value) {});};}

  Future<void> skip () async {
    timeAll = timeAll + timeAdd - widget.item[count]["時間"] as int;addDateTime = nowA.add(Duration(seconds: timeAll));date = outputFormat.format(addDateTime);
    if (count +1 < widget.item.length){
      setState(() {list[count] = timeAdd; timeAdd = 0;addTime = addTime + timeAdd - widget.item[count]["時間"] as int;
      count = count + 1;set();if (coB == false){coB == false;stop();}
      });}else{list[count] = timeAdd; flutterLocalNotificationsPlugin.cancelAll();_player.pause();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Finish(widget.Id,widget.item,widget.name,list,widget.uid,widget.CO)),).then((value) {});};}

  Future<void> skipOn () async {
    timeOnAll = timeOnAll + widget.item[count]["時間"] as int;- timeAdd;
    timeAll = timeAll + timeAdd - widget.item[count]["時間"] as int;addDateTime = nowA.add(Duration(seconds: timeAll));date = outputFormat.format(addDateTime);
   timeOn = 0;
    if (count +1 < widget.item.length){
      setState(() {list[count] = timeAdd; timeAdd  = 0;addTime = addTime + timeAdd - widget.item[count]["時間"] as int;
      count = count + 1;
      for(int i = count; i<widget.item.length; i++){
        aa =  widget.item[i]["時間"];timeOn = timeOn + aa;//listTime.add(timeOn);
      }
      if (coB == false){coB == false;stop();}
      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
      isPlaying = true;
      });}else{list[count] = timeAdd;_player.pause();Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Finish(widget.Id,widget.item,widget.name,list,widget.uid,widget.CO)),).then((value) {});};}

  void first (){for(int i = 0; i<widget.item.length; i++)setState(() { list.add(0);});
  set();startStopWatch();
  for(int i = 0; i<widget.item.length; i++){aa =  widget.item[i]["時間"];timeOn = timeOn + aa;listTime.add(timeOn);}
  addDateTime = nowA.add(Duration(seconds: timeOn));date = outputFormat.format(addDateTime);timeAll = timeOn;
  controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
  setState(() {isPlaying = true;});
  }
  firstOn(){
    for(int i = 0; i<widget.item.length; i++)list.add(widget.item[i]["時間"]);
    set();
    for(int i = 0; i<widget.item.length; i++){
      aa =  widget.item[i]["時間"];timeOn = timeOn + aa;listTime.add(timeOn);
    }count = 0;startStopWatch();
    addDateTime = nowA.add(Duration(seconds: timeOn));date = outputFormat.format(addDateTime);timeAll = timeOn;
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    setState(() {isPlaying = true;});
  }

  void notify() {
    time = controller.duration!.inSeconds;
    time0 = '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}';
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification();}}


  void  setOn (){count = 0;
  for(int i = 0; i<listTime.length; i++){
    if (listTime[i] <= timeOnAll ){count = count + 1;if (count   < widget.item.length){}else{_timer.cancel();_player.pause();Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Finish(widget.Id,widget.item,widget.name,list,widget.uid,widget.CO)),).then((value) {});};}else{
      if (count != co){ if (count   < widget.item.length){timeAdd = 0;co = co +1;set();controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);isPlaying = true;
      }else{ flutterLocalNotificationsPlugin.cancelAll();_timer.cancel();_player.pause();Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2Finish(widget.Id,widget.item,widget.name,list,widget.uid,widget.CO)),).then((value) {});};
      }else{}}
  }}


  Future<void> notify1() {
    if (count + 1  < widget.item.length){

      return flnp.initialize(InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'),),).then((_) => flnp.zonedSchedule(count, widget.item[count]["名前"]+"終了" , "次は"+widget.item[count + 1]["名前"],
        tz.TZDateTime.now(tz.UTC).add(Duration(seconds: 1)),
        NotificationDetails(android:  AndroidNotificationDetails(widget.item[count]["名前"]+"終了", "次は"+widget.item[count + 1]["名前"], importance: Importance.high, priority: Priority.high,),),
        androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,));
    }else{
      return flnp.initialize(InitializationSettings(android: AndroidInitializationSettings('@mipmap/ic_launcher'),),).then((_) => flnp.zonedSchedule(count, widget.item[count]["名前"]+"終了" , "お疲れ様でした!",
        tz.TZDateTime.now(tz.UTC).add(Duration(seconds: 1)),
        NotificationDetails(android:  AndroidNotificationDetails(widget.item[count]["名前"]+"終了", "お疲れ様でした!", importance: Importance.high, priority: Priority.high,),),
        androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,));
    }}

  Future<void> notify2() {
    if (count  +1 < widget.item.length){
      return flnp.initialize(
        InitializationSettings(iOS: DarwinInitializationSettings(),),
      ).then((_) => flnp.zonedSchedule(count, widget.item[count]["名前"]+"終了" , "次は"+widget.item[count + 1]["名前"],
        tz.TZDateTime.now(tz.UTC).add(Duration(seconds:1)),
        NotificationDetails(iOS:  DarwinNotificationDetails(),),
        androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      ));
    }else{
      return flnp.initialize(
        InitializationSettings(iOS: DarwinInitializationSettings(),),
      ).then((_) => flnp.zonedSchedule(count, widget.item[count]["名前"]+"終了" , "お疲れ様でした!",
        tz.TZDateTime.now(tz.UTC).add(Duration(seconds:1)),
        NotificationDetails(iOS:  DarwinNotificationDetails(),),
        androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      ));
    }}

  Future<void> _speak(String  text) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage("ja-JP");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }
  Future<void> initializeService() async {
    final service = FlutterBackgroundService();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground', // id
      'MY FOREGROUND SERVICE', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin.initialize(const InitializationSettings(iOS: DarwinInitializationSettings(),),);
    }
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),);
    service.startService();
  }
  @pragma('vm:entry-point')
  Future<bool> onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    final log = preferences.getStringList('log') ?? <String>[];
    log.add(DateTime.now().toIso8601String());
    await preferences.setStringList('log', log);

    return true;
  }
  @pragma('vm:entry-point')
  void onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("hello", "world");
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });
      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          flutterLocalNotificationsPlugin.show(
            30, 'COOL SERVICE', 'Awesome ${DateTime.now()}',
            const NotificationDetails(android: AndroidNotificationDetails(
              'my_foreground', 'MY FOREGROUND SERVICE', icon: 'ic_bg_service_small', ongoing: true,
            ),),);
        }}
      final deviceInfo = DeviceInfoPlugin();
      String? device;
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.model;
      }

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.model;
      }

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "device": device,
        },
      );
    });
  }



  Future initAudioService() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playback,
      avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.mixWithOthers,
      avAudioSessionMode: AVAudioSessionMode.defaultMode,
      avAudioSessionRouteSharingPolicy:
      AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: AndroidAudioAttributes(
        contentType: AndroidAudioContentType.music,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.media,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gainTransientMayDuck,
      androidWillPauseWhenDucked: true,
    ));
    //INITIALIZE audio_service
    // return await AudioService.init(
    //   builder: () => AudioPlayerService(),
    //   config: const AudioServiceConfig(
    //     androidNotificationChannelId: 'com.YOUR_COMPANY.YOUR_APP_NAME.audio',
    //     androidNotificationChannelName: 'Audio Service Demo',
    //     androidNotificationOngoing: true,
    //     androidStopForegroundOnPause: true,
    //   ),
    // );

  }


  Future<void> _handleInterruptions(AudioSession audioSession) async {
    // just_audio can handle interruptions for us, but we have disabled that in
    // order to demonstrate manual configuration.
    bool playInterrupted = false;
    audioSession.becomingNoisyEventStream.listen((_) {
      print('PAUSE');
      //  _player.pause();
    });
    _player.playingStream.listen((playing) {
      playInterrupted = false;
      if (playing) {
        audioSession.setActive(true);
      }
    });
    audioSession.interruptionEventStream.listen((event) async {
      print('interruption begin: ${event.begin}');
      print('interruption type: ${event.type}');
      if (event.begin) {
        switch (event.type) {
          case AudioInterruptionType.duck:
            if (audioSession.androidAudioAttributes!.usage ==
                AndroidAudioUsage.game) {
              _player.setVolume(_player.volume / 1.5);
            }
            playInterrupted = false;
            break;
          case AudioInterruptionType.pause:
          case AudioInterruptionType.unknown:
          // if (_player.playing) {
          //    //_player.pause();
          //    final session = await AudioSession.instance;
          //    // Activate the audio session before playing audio.
          //    if (await session.setActive(true)) {
          //      // Now play audio.
          //      _player.play();
          //    } else {
          //      // The request was denied and the app should not play audio
          //    }
          //    playInterrupted = true;
          // }
            initAudioService();
            break;
        }
      } else {
        switch (event.type) {
          case AudioInterruptionType.duck:
            _player.setVolume(min(1.0, _player.volume * 2));
            playInterrupted = false;
            break;
          case AudioInterruptionType.pause:
            if (playInterrupted) _player.play();
            playInterrupted = false;
            break;
          case AudioInterruptionType.unknown:
            playInterrupted = false;
            break;
        }
      }
    });
    audioSession.devicesChangedEventStream.listen((event) {
      print('Devices added: ${event.devicesAdded}');
      print('Devices removed: ${event.devicesRemoved}');
    });
  }

  Future<void> _handleInterruptions1(AudioSession audioSession) async {
    audioSession.setActive(false);
  }
  Future<void> initializeService1() async {
    final service = FlutterBackgroundService();
    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart1,
        autoStart: false,
        isForegroundMode: false,
        notificationChannelId: 'my_foreground',
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: false,
        onForeground: onStart1,
      ),);
    service.startService();
  }

  @pragma('vm:entry-point')
  void onStart1(ServiceInstance service) async {
    service.stopSelf();
  }
  Future initAudioService11() async {
    final session = await AudioSession.instance;
    session.setActive(false);initializeService1();
    AudioSession.instance.then((audioSession) async {await audioSession.configure(AudioSessionConfiguration.speech());_handleInterruptions1(audioSession);});
    _player.dispose();
  }
}



