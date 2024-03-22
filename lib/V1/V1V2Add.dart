import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class V1V2Add extends StatefulWidget {
  V1V2Add(this.Id,this.item,this.name,this.uid);
  String Id;List<dynamic> item;String name;String uid;
  @override
  State<V1V2Add> createState() => _V1V2AddState();
}

class _V1V2AddState extends State<V1V2Add> {
  var name = "";var Junl = "";var time = 0;var map = {};
  var item = ["勉強","運動","食事","仕事","瞑想","移動","休憩","お風呂","用事","掃除","趣味","睡眠","家事","身支度","買い物","育児","人付き合い","娯楽","その他"];
  var KenCon = TextEditingController();var TimeCon = TextEditingController();
  Duration duration = const Duration(hours: 0, minutes: 10);

  var list = [];
  @override
  void initState() {
    super.initState();print(widget.item);
    list = widget.item;
  }

  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          // actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(aa as IconData?))],
        ),
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Container(width: double.infinity, margin: EdgeInsets.only(top:15,bottom: 5,left: 10,right: 10),
                    child: TextFormField(decoration: InputDecoration( filled: true,fillColor: Colors.orange.shade50,labelText: 'やること', enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.amber,width: 3),),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.amber,width: 3,)),),//controller: f2C,
                      onChanged: (String value) {setState(() {name = value;});},),),
                  Container(width: double.infinity, margin: EdgeInsets.only(top:30,bottom: 5,left: 10,right: 10),
                    child: TextFormField(onTap: () { FocusScope.of(context).requestFocus(new FocusNode());showPicker();},controller: KenCon,decoration: InputDecoration( filled: true,fillColor: Colors.blue.shade50,labelText: 'ジャンルを選択', enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.blue,width: 3),),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.blue,width: 3,)),),//controller: f2C,
                    ),),
                  Container(width: double.infinity, margin: EdgeInsets.only(top:30,bottom: 5,left: 10,right: 10),
                    child: TextFormField(onTap: () { FocusScope.of(context).requestFocus(new FocusNode()); _showDialog(
                        CupertinoTimerPicker(mode: CupertinoTimerPickerMode.hms, initialTimerDuration: duration,
                          onTimerDurationChanged: (Duration newDuration) {setState(() => duration = newDuration);TimeCon.value = TextEditingValue(text: duration.toString());time = duration.inSeconds;},
                        ));},controller: TimeCon,decoration: InputDecoration( filled: true,fillColor: Colors.red.shade50,labelText: '時間', enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.red,width: 3),),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.red,width: 3,)),),//controller: f2C,
                    ),),
                  Container(margin: EdgeInsets.only(top:50),width: 200, child: ElevatedButton(child:Text('登録'),
                      style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                      onPressed: () {setState(()  {add();});}),),
                ])));}

  void showPicker() {
    final _pickerItems = item.map((item) => Text(item)).toList();
    var selectedIndex = 0;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(height: 216,
          child: GestureDetector(
            onTap: () {Navigator.pop(context);},
            child: CupertinoPicker(backgroundColor: Colors.white,
              itemExtent: 32,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },),),);},).then((_) {
      if (selectedIndex != null) {setState(() {KenCon.value = TextEditingValue(text: item[selectedIndex].toString());Junl = item[selectedIndex]; });}});}
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          // The Bottom margin is provided to align the popup above the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
          // Use a SafeArea widget to avoid system overlaps.
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }
  void  add() {map = {"ジャンル": Junl, "名前": name, "時間": time,};list.add(map);print(list);
  FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("ルーティン").doc(widget.Id).update({
    "ルーティン":list,});Navigator.pop(context);}

}