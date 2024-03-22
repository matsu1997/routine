import 'dart:math';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:routine/V4/V4First.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'Login.dart';

void main() async {
  // 初期化処理を追加
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

/* --- 省略 --- */

// ログイン画面用Widget
class SignUp extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUp> {
  // メッセージ表示用
  String infoText = '';

  // 入力したメールアドレス・パスワード
  String email = '';
  String name = '';
  String password = '';
  var uid = "";
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => initPlugin());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: Size.fromHeight(10.0),
          child: AppBar(backgroundColor: Colors.white,elevation: 0,)),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(padding: EdgeInsets.all(20),decoration: BoxDecoration( border: Border.all(color: Colors.blueGrey), borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Container(margin: EdgeInsets.only(top:10,bottom: 10,),child: Text("アカウント登録",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20)),),
                Container(width: double.infinity, margin: EdgeInsets.only(top:10,bottom: 5,left: 10,right: 10),
                  child: TextFormField(decoration: InputDecoration(labelText: 'ユーザーの名前' ,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey,width: 3),)),
                    onChanged: (String value) {setState(() {name = value;});},),),
                Container(width: double.infinity, margin: EdgeInsets.only(top:5,bottom: 5,left: 10,right: 10),
                  child: TextFormField(decoration: InputDecoration(labelText: 'メールアドレス' ,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey,width: 3),)),
                    onChanged: (String value) {setState(() {email = value;});},),),
                Container(width: double.infinity, margin: EdgeInsets.only(top:5,left: 10,right: 10),
                  child: TextFormField(decoration: InputDecoration(labelText: 'パスワード' ,enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey,width: 3),)),
                    onChanged: (String value) {setState(() {password = value;});},),),
                Container(padding: EdgeInsets.all(8), child: Text(infoText),),
                Container(width: double.infinity,height: 30,
                  child: ElevatedButton(child: Text("プライバシーポリシー"),
                    onPressed: () async {final url = "https://note.com/matsu_1111111/n/n741c2c71cc1e";
                    if (await canLaunch(url)) {await launch(url);}},
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0, onPrimary: Colors.blue,),),),
                Container(width: double.infinity,height: 30,
                  child: ElevatedButton(child: Text("利用規約"),
                    onPressed: () async {final url = "https://note.com/matsu_1111111/n/n264c7b5695fd";
                    if (await canLaunch(url)) {await launch(url);}},
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0, onPrimary: Colors.blue,),),),
                Container(width: double.infinity,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white,),
                      child: Text('上記２つに同意してユーザー登録'),
                      onPressed: () async {
                        if (email != "" || name != "" || password != ""){
                          try {
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            await auth.createUserWithEmailAndPassword(
                              email: email, password: password,);
                            add();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4Sign()),).then((value) {});
                          } catch (e) {
                            setState(() {infoText = "登録に失敗しました：${e.toString()}";});}
                        }else{
                          setState(() {infoText = "登録に失敗しました";});}}
                  ),),
              ],),),
              Container(padding: EdgeInsets.only(top:30,bottom: 30,left: 20,right: 20),width: double.infinity,
                child: ElevatedButton(
                  child: Text('既にアカウントをお持ちの方'),style: ElevatedButton.styleFrom(primary: Colors.blue, onPrimary: Colors.white,),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return Login();}),);
                  },),),
              Container(padding: EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),decoration: BoxDecoration( border: Border.all(color: Colors.blueGrey), borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Container(margin: EdgeInsets.only(top:10,bottom: 10,),child: Text("アカウント登録しないで使う",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20)),),
                Container(child: Text("アンインストール時にデータの引き継ぎができません",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 10)),),
                Container(width: double.infinity,
                  child: ElevatedButton(child: Text("プライバシーポリシー"),
                    onPressed: () async {final url = "https://note.com/matsu_1111111/n/n741c2c71cc1e";
                    if (await canLaunch(url)) {await launch(url);}},
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0, onPrimary: Colors.blue,),),),
                Container(width: double.infinity,height: 30,
                  child: ElevatedButton(child: Text("利用規約"),
                    onPressed: () async {final url = "https://note.com/matsu_1111111/n/n264c7b5695fd";
                    if (await canLaunch(url)) {await launch(url);}},
                    style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0, onPrimary: Colors.blue,),),),
                Container(width: double.infinity,
                  child: ElevatedButton(child: Text('上記２つに同意して使う'),style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white,),
                    onPressed: () async {add1();},),),
              ],),),


            ],),),),);}

  Future<void> add1() async {
    uid = randomString(20);
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      "email" : "",
      "uid":uid,
      "userName":"",
      "createdAt": Timestamp.now(),
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("アカウント", uid);_setCounterValue(); _setCounterValue();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => V4Sign()),).then((value) {});
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
      },
    );
    return new String.fromCharCodes(codeUnits);
  }

  Future<void> add() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        "email" : email,
        "uid":user?.uid,
        "userName":name,
        "createdAt": Timestamp.now(),
      });
    });_setCounterValue();SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setString("email", email);}
  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
  void _setCounterValue() async {SharedPreferences prefs = await SharedPreferences.getInstance();prefs.setInt("最初", 1);}
}


