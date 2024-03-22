
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'SignUp.dart';

void main() async {
  // 初期化処理を追加
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

/* --- 省略 --- */

// ログイン画面用Widget
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String infoText = '';
  String email = '';
  String name = '';
  String password = '';
  var uid = "";

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(margin: EdgeInsets.only(top: 50, bottom: 50,),padding: EdgeInsets.all(20),
                decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey), borderRadius: BorderRadius.circular(10),),
                child: Column(children: [
                  Container(margin: EdgeInsets.only(top: 10, bottom: 10,),
                    child: Text("ログイン", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20)),),
                  Container(width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: TextFormField(decoration: InputDecoration(
                        labelText: 'メールアドレス',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blueGrey, width: 3),)),
                      onChanged: (String value) {
                        setState(() {
                          email = value;
                        });
                      },),),
                  Container(width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: TextFormField(decoration: InputDecoration(
                        labelText: 'パスワード',
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey, width: 3),)),
                      onChanged: (String value) {
                        setState(() {password = value;});
                      },),),
                  Container(padding: EdgeInsets.all(8), child: Text(infoText),),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
                    width: double.infinity,
                    child: ElevatedButton(child: Text("ログイン"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white,),
                      onPressed: () async {
                        try {
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final result = await auth.signInWithEmailAndPassword(
                            email: email, password: password,);
                          SharedPreferences prefs = await SharedPreferences.getInstance(); prefs.setString("email", email);
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return MyApp();
                            }),);
                        } catch (e) {}
                      },),),
                ],),),
              Container(padding: EdgeInsets.only(top:20,bottom: 20,left: 40,right: 40),width: double.infinity,
                child: ElevatedButton(child: Text('アカウントをお持ちでない方'),style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white,),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {return SignUp();}),);
                  },),),
            ],),),),);
  }
}