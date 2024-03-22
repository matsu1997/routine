
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:just_audio/just_audio.dart';
import 'package:routine/SignUp/delete1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../SignUp/SignUp.dart';
import 'V1Add.dart';
import 'V1V2.dart';
import '../SignUp/delete1.dart';
class V1 extends StatefulWidget {
  @override
  State<V1> createState() => _V1State();
}
enum Menu {Sign,delete,request,  }
class _V1State extends State<V1> {
  @override
  var rand = new math.Random();
  var uid = "";
  var count = 0;
  String date = "";
  var aa = "Icons.refresh_rounded";
  var item = [];
  var frame = [["前進をしない人は、後退をしているのだ。","ゲーテ"],["急がずに、だが休まずに。","ゲーテ"],["楽観主義者はドーナツを見て、悲観主義者はその穴をみる。","オスカー・ワイルド"],["一貫性というのは、想像力を欠いた人間の最後のよりどころである。","オスカー・ワイルド"],["人生で必要なものは無知と自信だけだ。これだけで成功は間違いない。","マーク・トウェイン"],["毎日が新しい日なんだ。","ヘミングウェイ"],["誰かを信頼できるかを試すのに一番良い方法は、彼らを信頼してみることだ。","ヘミングウェイ"],["誰かの為に生きてこそ、人生には価値がある","アインシュタイン"],["あなたが始めるべきだ。他の人が協力的であるかどうかなど考えることなく","アルフレッド・アドラー"],["すべての者は生まれながらに知恵を求める","アリストテレス"],["すべての人間の一生は、神の手によって書かれた童話にすぎない","アンデルセン"],["チャンスに出会わない人間は、一人もいない。それをチャンスにできなかっただけである","アンドリュー・カーネギー"],["希望があるところに人生もある。希望が新しい勇気をもたらし、再び強い気持ちにしてくれる","アンネフランク"],["歩け、歩け。続ける事の大切さ","伊能忠敬"],["夢見ることができれば、それは実現できる","ウォルト・ディズニー"],["愛することは、ほとんど信じることである","ヴィクトル・ユーゴー"],["ヴィクトール・フランクル","学は貴し。されども精神の貴きに如かず"],["愛は、人と人を結びつける力なのです","エーリッヒ・フロム"],["天才とは1％のひらめきと99％の努力である","エジソン"],["どんな関係においても大切なことは、何を受け取ったかではなく、何を与えたかです。","エレノア・ルーズベルト"],["最後に息を引き取るまで、夕暮れは暗闇にはなりません","カーネルサンダース"],["敵は多ければ多いほど面白い","勝海舟"],["それでも地球は動いている","ガリレオ・ガリレイ"],["明日死ぬかのように生きよ。永遠に生きるかのように学べ","ガンジー"], ["哲学は学べない。学べるのは哲学することだけである","カント"], ["正義とは、愛に反するものを正していく愛のことなのです","キング牧師"], ["目の前の仕事に専念せよ。太陽光も一点に集めなければ発火しない","グラハム・ベル"], ["小さなことこそ大切だというのが、ずっと私の信条だ","コナン・ドイル"], ["インドへの航海の実行には、知性も数学も地図も活用しなかった","コロンブス"], ["健康で強い体があれば毎日喜んで働く","ショパン"], ["真の賢者は己の愚を知る者なり","ソクラテス"], ["笑いと涙には憎しみと恐怖への解毒剤になる力があると私は信じている","チャップリン"], ["人を非難するのは、ちょうど天に向かってつばをするようなもので、 必ず我が身に返ってくる","デール・カーネギー"], ["リーダーとは『希望を配る人』のことだ","ナポレオン"],
    ["翼を持たずに生まれてきたのなら、翼をはやすためにどんな障害も乗り越えなさい","ココ・シャネル"],["時には、問いが複雑になっているだけで、答えはごくシンプルなことだったりします","ドクター・スース"],["世の中には辛いことがたくさんありますが、それに打ち勝つことでも溢れています","ヘレン・ケラー"],["愛する人が死ぬことはあり得ないの。だって愛は不滅だから","エミリー・ディキンソン"],["自分が他人より劣っているなどと思わせることは、他の誰にもできないわ","エレノア・ルーズベルト"],["善人になるためには、善い行いをするだけだ","ジョン・アダムズ"],["人生は自転車に乗ることに似ています。バランスを保つためには、動き続けなくてはならないのです","アルバート・アインシュタイン"],["暗闇の中でこそ、星が見える","マーティン・ルーサー・キングjr"],["顔をいつも太陽のほうにむけていれば、影なんて見なくて済むはず","ヘレン・ケラー"],["親切な行いは、たとえそれがどんなに些細なことであったとしても、無駄にはなりません","イソップ"],["『目には目を』という考え方では、世界中の目をつぶしてしまうことになります","マハトマ・ガンジー"],["平和は常に美しい","ウォルト・ホイットマン"],["戦争に勝つことが全てではない。平和を作ることが大切だ","アリストテレス"],["私は平和を見つけたのではなく、求めたのです","トマス・ア・ケンピス"],["平和は遂行に値する、唯一の闘争である","アルベール・カミュ"],["心の平和を与える代償として人生が要求するのは、勇気である","アメリア・イアハート"]];
  var frameSt1 = "";var frameSt2 = "";
  var index1 = 0;
  void initState() {
    super.initState();signup();
    frameSet ();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar:PreferredSize(preferredSize: Size.fromHeight(80.0),
            child: AppBar(backgroundColor: Colors.white,elevation: 0,
              actions: [
                PopupMenuButton(
                  onSelected: popupMenuSelected,
                  icon:Icon(Icons.pending_outlined,color: Colors.black,),
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<Menu>>[
                    const PopupMenuItem( child: const ListTile( leading:Icon(Icons.account_circle),
                        title:Text("アカウントにログイン")), value: Menu.Sign,),
                    const PopupMenuItem( child: const ListTile( leading:Icon(Icons.delete_forever),
                        title:Text("アカウントを削除")), value: Menu.delete,),
                    const PopupMenuItem( child: const ListTile( leading:Icon(Icons.star),
                        title:Text("このアプリを評価する")), value: Menu.request),
                  ],
                )
              ],
            )),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1Add(uid)),).then((value) {_loadData();frameSet ();});
          },
        ),
        body: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(top:10,left: 20,right: 10),child: Icon(Icons.school_rounded,size: 30,color:Colors.blue),), Container(margin:EdgeInsets.only(top:10,right: 20),child: Text("偉人の名言",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),],),
          Divider(color: Colors.blueGrey,thickness: 3,indent: 120,endIndent: 120,),
          Container(width:double.infinity,margin:EdgeInsets.all(10),child: Text(frameSt1,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center,),),Container(width:double.infinity,child: Text(frameSt2,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),textAlign: TextAlign.center,),),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(margin:EdgeInsets.only(top:20,left: 20,right: 10),child: Icon(Icons.sunny_snowing,size: 30,color:Colors.orange),), Container(margin:EdgeInsets.only(top:20,right: 20),child: Text("ルーティン",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20),textAlign: TextAlign.center,),),],),
          Divider(color: Colors.blueGrey,thickness: 3,indent: 120,endIndent: 120,),
          //   Container(width:double.infinity,height:30,alignment:Alignment.centerRight,child:IconButton( style: ElevatedButton.styleFrom(primary: Colors.white, onPrimary: Colors.blue, shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid,),),), onPressed: () {}, icon:Icon(Icons.calendar_month_rounded,size: 25,color: Colors.blue,),),),
          Expanded(child: Container(margin:EdgeInsets.only(top:0),child: ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),itemCount: item.length, itemBuilder: (context, index,) {
            return GestureDetector(
                onTap: ()  {Navigator.of(context).push(MaterialPageRoute(builder: (context) => V1V2(item[index]["Id"]as String,item[index]["ルーティン"]as List,item[index]["名前"]as String,uid,0)),).then((value) {_loadData();});},
                child:Card(
                  shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  child: Container( decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(10),),margin: EdgeInsets.all(10),
                    child: Row(children: [
                      Expanded(child: Container(alignment: Alignment.center,margin:EdgeInsets.only(left: 50),child: Text(item[index]["名前"] as String,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center,)),),
                      Container(alignment: Alignment.centerRight,width: 50,height: 50, child: IconButton(//child:Text('登録'),
                          style: ElevatedButton.styleFrom(primary: Colors.green, onPrimary: Colors.white, shape: const StadiumBorder(),),
                          onPressed: () {index1 = index;delete();}, icon: Icon(Icons.highlight_off,size: 30,color: Colors.blueGrey,)),),
                    ],),),));},),),
          )]));}

  void _loadData()  {item = []; FirebaseAuth.instance.authStateChanges().listen((User? user) {
    FirebaseFirestore.instance.collection('users').doc(uid).collection("ルーティン").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item.add(doc);});
        ;});});});}
  void frameSet (){setState(() { count = rand.nextInt(frame.length);frameSt1 = frame[count][0]; frameSt2 = frame[count][1];;});}
  void signup() async {SharedPreferences prefs = await SharedPreferences.getInstance();uid = prefs.getString("アカウント")?? "";
  if (uid == ""){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {Navigator.push(context, MaterialPageRoute(builder: (context) {return SignUp();}));})
        ;} else {uid = user.uid; prefs.setString("アカウント", uid);_loadData();}});}else{_loadData();};}

  void delete (){
    showDialog(context: context, builder: (context) => AlertDialog(actions: <Widget>[
      Container(width: double.infinity,
        child:Column(children: [
          Container(margin:EdgeInsets.all(10),child: Text("ルーティンを削除しますか？" ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 18),textAlign: TextAlign.center,),),
          Container(margin:EdgeInsets.all(0),child: Text(item[index1]["名前"] ,style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize: 15),textAlign: TextAlign.center,),),
          Container(margin: EdgeInsets.only(top:20,bottom: 20), width:150,child: ElevatedButton(child:Text("削除"),
            style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white, shape: const StadiumBorder(),),
            onPressed: () {setState(() {FirebaseFirestore.instance.collection('users').doc(uid).collection("ルーティン").doc(item[index1]["Id"]).delete();Navigator.pop(context);item.removeAt(index1);});},)),
        ]),)],));
  }
  void popupMenuSelected(Menu selectedMenu){
    switch(selectedMenu) {
      case Menu.Sign:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
        break;
      case Menu.delete:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => delete1()));
        break;
      case Menu.request: _requestReview();
      break;
      default:
        break;
    }}
  Future<void> _requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }
}
