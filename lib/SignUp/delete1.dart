import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class delete1 extends StatefulWidget {
  @override
  State<delete1> createState() => _delete1State();
}

class _delete1State extends State<delete1> {
  String uid = "uid";

  String getuid = "getuid";

  String deleteuser = "wait delete";

  late User me;

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("削除",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Center(
            child:Container(
              child: ElevatedButton(
                child: const Text('アカウントを削除'),
                onPressed: () {
                  try {
                    FirebaseAuth.instance.currentUser?.uid;
                    setState(() {
                      getuid = FirebaseAuth.instance.currentUser!.uid;
                    });
                  } on NoSuchMethodError catch (e) {
                    setState(() {
                      getuid = "null";
                    });
                  }
                  showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(
                            title: Text("アカウントを削除しますか？"),
                            content: Text("全データが消えます。"),
                            actions: <Widget>[
                              GestureDetector(
                                child: Text('いいえ'),
                                onTap: () {
                                  Navigator.pop(context);
                                },),
                              GestureDetector(
                                child: Text('はい'),
                                onTap: () {
                                  FirebaseFirestore.instance
                                      .collection(
                                      "users").doc(getuid)
                                      .delete();
                                  setState(() {});
                                  try {
                                    FirebaseAuth.instance.currentUser;

                                    FirebaseAuth.instance.currentUser?.delete();
                                    setState(() {
                                      deleteuser = "deleted";
                                    });
                                  } on NoSuchMethodError catch (e) {
                                    setState(() {
                                      deleteuser = "no exist user";
                                    });
                                  }
                                  Navigator.pop(context);



                                },)],));
                },
              ),
            )));
  }
}
