
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'V4.dart';
class V4Oner extends StatefulWidget {
  @override
  State<V4Oner> createState() => _V4OnerState();
}

class _V4OnerState extends State<V4Oner> {
  var item = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
          actions: <Widget>[IconButton(onPressed: () {_loadData();}, icon: Icon(Icons.arrow_circle_right_rounded))],
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(itemCount: item.length, itemBuilder: (context, index,) {
                      return GestureDetector(
                          onTap: ()  {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4OnerV(item[index]["uid"],index,item[index])),).then((value) {});
                          },
                          child:Card(
                            shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            child: Container(margin: EdgeInsets.all(10),color: Colors.grey[50],
                              child: Column(children: [
                                Container(margin:EdgeInsets.all(5),child: Text(item[index]["uid"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                              ],),),));}
                      ,),), ])));}


  void _loadData()  { item = [];
  FirebaseFirestore.instance.collection('管理メッセージ').get().then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {setState(() {item= doc["メッセージ"];});});});
  }
}