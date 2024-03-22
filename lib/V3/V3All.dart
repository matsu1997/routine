
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class V3All extends StatefulWidget {
  @override
  State<V3All> createState() => _V3AllState();
}

class _V3AllState extends State<V3All> {
  //chat.png    education.png   imagin.png  love.png
  // money.png   nature.png  peaple.png      workout.png
  var item = ["勉強","食事","飲み物","睡眠","瞑想"];
  var item2 = ["images/study.png","images/food.png","images/coffee.png","images/sleep.png","images/meditation.png",];
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
        ),
        body: Container(
            child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(itemCount: item.length, itemBuilder: (context, index,) {
                      return GestureDetector(
                          onTap: ()  {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3All1(item2[index])),).then((value) {});
                          },
                          child:Card(
                            shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                            child: Container(margin: EdgeInsets.all(10),color: Colors.grey[50],
                              child: Column(children: [
                                Container(margin:EdgeInsets.all(5),child: Text(item[index],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),),),
                              ],),),));}
                      ,),), ])));}

}

class V3All1 extends StatefulWidget {
  V3All1(this.Id);
  String Id ;
  @override
  State<V3All1> createState() => _V3All1State();
}

class _V3All1State extends State<V3All1> {
  var item1 = [
    //飲み物
    ["images/coffee.png","コーヒー(カフェイン入り)を飲むと食欲を抑えられる?","ダイエットしている人は試してみてね\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーは記憶力をUPさせる?","コーヒー摂取後、最大24時間向上するとか。\nカフェインの効果が出るのは摂取後約30分かかるので勉強の前に飲んでみよう\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーは脳卒中のリスクを減らす？","1日3・4杯のコーヒーを飲む人は脳卒中のリスクが低下するとか。日本人の死因原因の３位(令和2年)になります。\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーは集中力をUPさせる？","カフェインを約75-200mg摂取するとUPさせるとか。コーヒー１杯に約80mgのカフェインが入っています。\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーを飲むと肝臓がんを予防できる？","1日3.4杯で肝臓がんの前病変である肝疾患や肝硬変のリスクが50％低下させたりするとか。\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーは糖尿病を予防できる？","コーヒーを1日3,4杯飲む人は糖尿病リスクが低下するとか。男性で17%、女性で38%する\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーで持久力・敏捷性がUPする？","30分-2時間の運動でパフォーマンスUPが期待できるとか。運動約45m前に摂ると運動時に血中のカフェイン量がピークになる\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],
    ["images/coffee.png","コーヒーは朝飲まない方が良い？","寝起きは覚醒ホルモンが分泌するため、カフェインの効果が無意味になってしまうとか。\nおすすめの摂取タイミングは9:30-11:30,13:00-16:00\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"], ["images/coffee.png","定期的にカフェイン断ちをした方が良い？","毎日のようにカフェインを摂ると効果が薄れてきてしまう。なので1-2週間のカフェイン断ちを定期的に行った方が良い。\n離脱症状(眠気・不安感・イライラ・頭痛)が出る場合がある\n離脱症状を軽減させるために徐々にカフェインの摂取量を減らしてみましょう"], ["images/coffee.png","コーヒーの効果を長持ちさせるにはミルク？","ミルクに含まれる脂肪分がカフェインの吸収をゆっくりにしてくれるとか。集中力をキープしたい人は是非お試しください。\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"], ["images/coffee.png","コーヒーが筋肉痛を軽減する？","体重✖3mg(約1-2杯)で良いそう\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"], ["images/coffee.png","コーヒーにはアンチエイジング効果がある？","カフェインが体の炎症をブロックしてくれるそう。定期的にコーヒーを摂取する人は死亡率が低下するらしい。\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"], ["images/coffee.png","コーヒーの副作用も理解しておこう","カフェインへの耐性は人それぞれ。なので副作用を知る事でコーヒーの摂取量を考えてみましょう\n動悸・不安障害・めまい・イライラ・血圧上昇・不眠症・胃痛・筋肉の痙攣・幻覚・幻聴など\n＊カフェインに弱い人もいます。体調を観察しながら試してみよう"],["images/coffee.png","コーヒーで貧血になる？","コーヒーに含まれるタンニンが鉄分の吸収を阻害するため。めまいや立ちくらみなどが出始めたら考えてみましょう。"],
    ["images/coffee.png","ココアのメリット一覧","脳機能UP\nアンチエイジング\n高血圧の改善\n便秘の改善\n心疾患のリスクdow\nインフルエンザの感染予防\nピロリ菌・歯周病菌の抗菌作用\nリラックス効果\nダイエット効果\nなどなど。調子をみながら試してみてはいかがでしょうか？"],
    ["images/coffee.png","重曹を飲むメリット一覧","運動機能UP\n疲労回復\n便秘解消\n代謝UP\n二日酔い対策\nなどなど。1日の摂取量は3-5gぐらいですが,下痢を起こしたりする場合があるので体調をみながらお試しください。\n＊味はかなり不味いです。"],
    //食べ物
    ["images/food.png","プチ断食のススメ","プチ断食とは1日のうち14~16時間断食する方法。\nプチ断食の効果はダイエット・アンチエイジング・節約・食事が美味しく感じやすいなど。断食中は水やコーヒーやカロリーがないのは飲んでも良いそう。女性は特に断食でホルモンバランスが崩れやすい？という場合もあるので体調を見ながら取り組んでみてはいかがでしょうか？"],["images/food.png","勉強したけりゃジャンクフードは食べるな!について","ジャンクフードが記憶を司る海馬を破壊するのだとか。食欲のコントロールもできなくなり暴飲暴食に繋がるので食べて良いことは無さそうですね。"],["images/food.png","ブルーベリーがすごい？","まずは効果を羅列\n免疫力UP・記憶力UP・アンチエイジング・心疾患のリスク減\n摂取量は60~120gで良いそう。学生からご老人まで様々な人に嬉しい効果がありそう。ぜひお試しください。"],["images/food.png","脳を守るには以下の食材をとってみては？","鶏肉・魚・豆類・全粒穀物・野菜・ナッツ・ベリー類・オリーブオイル・ワイン\nこれらはMIND食事法と呼ばれるものです。逆に避けた方が良いのは、赤み肉・ファストフード・バター/マーガリン・チーズ・お菓子になります。意識してみてはいかがでしょうか？"],["images/food.png","緑茶の効果まとめ","ダイエット効果\n脳機能UP\n糖尿病対策\n抗菌作用\n虫歯対策\nがん予防"],["images/food.png","脳機能をUPさせる食材一覧","ブルーベリー\nブロッコリー\nサーモン\nほうれん草\nクルミ\nダークチョコレート\n緑茶\n発酵食品"],
    //瞑想
    ["images/meditation.png","瞑想の効果をご紹介","ストレスが軽減\n集中力UP\n感情のコントロールができるようになる\n睡眠の質が上がる\n脳疲労が軽減"],
    //睡眠
    ["images/sleep.png","ビタミンDで睡眠の質が上がる？","最近の研究でビタミンDの摂取で睡眠の質が改善されたというデータがあるそう。\n主な食材：しらす・鮭・肉・卵など。\n日光浴もOK"],["images/sleep.png","入浴は寝る1〜2時間前に入るのが良い？","睡眠の質が1番上がるのがこの時間だそうです。11時に寝る方は9時30分までにお風呂から上がるのが良いかもしれませんね。"],["images/sleep.png","寝る時は真っ暗で寝た方が良い？","弱い光でも睡眠中に当たる事でメンタルを病みやすいだとか。寝る前のブルーライトはもちろんの事、夜間灯も考えた方が良さそうですね。"],["images/sleep.png","寝る前に明日の予定を確認すると良い？","寝る前に明日のTODOリストを作ると睡眠の質が上がるのだとか。遠足の日はバッチリ目が覚めるのはこれに関係するのですかね。"],["images/sleep.png","寝る時は窓を開けた方が良い？","寝室の二酸化炭素量が低下すると、睡眠の質・翌日の集中力UPに関係するのだとか。風邪引かないように着込んだ方が良いかもしれませんね。"],["images/sleep.png","掛け布団は重い方が睡眠の質は上がる？","適度な圧迫感がリラックス効果があるそうです。体重の10%を目安に試してみると良いかもしれないですね。ただし寝返りをしにくくなるので体が痛くなる可能性もあると思います。"],["images/sleep.png","キウイで睡眠の質が上がる？","寝る1時間前に２個のキウイを食べると睡眠の質が上がったのだとか。キウイは抗酸化物質も豊富でアンチエイジングにも効果があるので、栄養+睡眠の質UPで健康に良いかと思います。"],["images/sleep.png","寝不足で太る？","ホルモンバランスが悪くなったり、誘惑に弱くなったり、活力の低下のせいで太るのではないかと。何をとっても睡眠不足が良いとはならないので睡眠には気をつけてみましょう。"],["images/sleep.png","寝過ぎは良くない？","9時間以上の睡眠で死亡率が上昇するのだとか。6~8時間ぐらいで自分のベストを探すと良いかもしれないですね。"], ["images/sleep.png","寝れない人は寝てはいけない？","寝付けない原因に「寝れない不安」があるそうで、だったら逆にベッドに入り「俺は絶対に寝ない！」と起きてようとすると寝ちゃうのだとか。不眠の方は一度お試しください。"],["images/sleep.png","深呼吸で入眠スピードが上がる？","吸う時間よりも吐く時間が長くなると副交感神経が優位になりリラックスするのだとか。4秒吸って8秒かけて吐くようにしてみてはいかがでしょうか？"],["images/sleep.png","ラベンダーの香りで睡眠の質が上がる？","これは想像ができるかと思いますが、リラックス効果が影響してるのだとか。枕に数滴垂らしたり、デヒューザーを使ってみてはいかがでしょうか？"],["images/sleep.png","コーヒーナップは午後の学習(仕事)の強い味方に！","午後の眠気や集中力の低下を吹き飛ばすのがコーヒーナップという昼寝の方法です。方法は昼寝の前にコーヒーを飲むだけ。コーヒーの覚醒効果は20~30分後に出てくるので気持ち良く起きれる訳なんですよね。目を閉じるだけでも昼寝の効果はあるので無理に寝ようとしなくても良いかと思います。30分以上の昼寝は夜の睡眠の質を下げるので一応アラームを30分にセットしてはいかがでしょうか？"],["images/sleep.png","寝るときは布団から足を出せ？","深部体温が下がると眠りに誘われるので末端を冷やすと良いという事らしい。ただし風邪を引かないように冷やしすぎない工夫は必要かもしれないですね。"],
    ["images/sleep.png","勉強後に6分寝ましょう","6分の睡眠でも記憶の定着に効果があるとか。「6分なんかで寝れないよ」と思われますが、目を閉じぼーっとするだけで良いのです。暗記を一通り終えたら少し横になるのが良いかと思います。"],
    //勉強
    ["images/study.png","紙vsデジタル\nどちらの書籍の方が勉強に良い？","結論、紙の勝利です。\n色んな研究で紙の書籍の方が文章の理解度が高かったそう。まだまだ紙も捨てたもんじゃないですね。"],["images/study.png","集中力維持には水を飲め？","体内の水分量が1.5%低下するだけで集中力などの認知能力が低下したそう。「喉が乾いたな」と感じるのはおよそ2%低下した時だそうなので、こまめに水分摂取した方が良さそうですね。"],["images/study.png","勉強方法は何が良い？","◯検索練習\n勉強した内容を思い出すことで記憶効率を上げる学習法のこと。例として、テスト・フラッシュカード・赤シートなどの事。結局これが最強なのかもしれない。\n \n◯教えるつもり勉強法\nこれは勉強後に覚えたことを誰かに教えるつもりで学習する方法。教えるためには内容をしっかり理解し要点をまとめないといけないと思うのが良いみたい。教える相手がいない人は「60分勉強したら5分間で覚えたことを独り言で話す」みたいでも良いかと思います。\n \n◯記憶の宮殿\n暗記能力を争う記憶力選手権の選手が愛用するテクニック。こちらに関しては図や写真で説明した方がわかりやすそうなので、是非「記憶の宮殿」で検索してみてください。\n\n今回は勉強法についてご紹介しました。一度試してみてはいかがでしょうか？"],["images/study.png","スタンディングデスクのススメ","メリット：集中力・生産性の向上。健康の維持。肩こりや腰痛の改善など。\nざっくりですが、生産性が50%近く向上したり、死亡率が低下したという研究結果があり、最初は疲れやすいかと思いますが慣れれば楽だという方も多いようです。試してみてはいかがでしょうか？"],["images/study.png","マルチモーダル学習とは？","マルチ(多くの)+モーダル(やり方)という意味です。\nつまり歴史(奈良時代)を勉強するときは、教科書を読む・youtubeでみる・ノートを読む・単語帳で覚える・漫画で読むなど複数の媒体で学習した方が良いとの事。あらかじめ学習する方法を複数決めておくと良いかもしれないですね。"],["images/study.png","学習中の音楽はやっぱりダメ？","結論、ダメでした。\nどんな種類の音楽でも作業効率は下がってしまうとの事。おすすめは10分前に好きな音楽を聞いてドーパミンをガンガン出して集中力を上げてから学習すると良いかと思います。試してみてはいかがでしょうか？"],["images/study.png","復習は40秒で良い？","一通り学習した後、40秒間復習するだけでも中長期記憶に残りやすかったそう。休憩の前に軽く復習する習慣をつけると良いかもしれないですね。"],["images/study.png","覚えるには音読+誰かに伝えるイメージをする？","単語帳や教科書を覚えるには黙読より音読、単純な音読より誰かに向かって音読する方が記憶への定着が良いそう。毎回話相手を用意するのは難しいかと思いますが、話相手をイメージするだけでも良いそうなので、試してみてはいかがでしょうか？"],["images/study.png","全ての練習・学習はインターリービングで行え？","勉強もスポーツも出来るまで繰り返し練習するかと思いますが、インターリービング練習が良いそうです。インターリービングとは、１回のセッションで複数の練習をする方法の事です。つまり、英語を勉強する時は英単語だけ勉強するのではなく、英単語→英文→リスニング→英単語→英文→リスニングと行う。ゴルフではパターだけでなく、パター→アイアン→ドライバーと一回の練習で行った方が効率が良いとの事です。なぜかというと、英文から英単語を覚えたり、アイアンの練習で学んだ事がドライバーに活きたりと相互作用が生まれるわけなんですよね。試してみてはいかがでしょうか？"]
    //マインド
    ,["images/imagin.png","新しい目標は月曜日から始める","これは気持ちが切り替わる時にスタートすると目標達成率が上がるという事です。月曜日以外に、新年や誕生日、新学期などもこれに当てはまるかと。短期の目標は月曜日で、中長期の目標は新年や誕生日から始めると良いかもしれないですね。"],["images/imagin.png","先延ばし癖を直すには5分間ルール？","やる気がでない時は5分だけやってください。5分やってみてダメならしょうがないですが、大抵は作業の最初が1番辛いので5分を過ぎると意外と"],
    //運動
    ["images/workout.png","運動には重曹ローディングを？","体重×0.3gを運動1時間前に摂取することでスプリント能力が20%近く向上・筋肉が増加したとか。ただし腹痛などの副作用が起きる場合があるので、体重×0.1gを毎日飲んだりと、出来るだけ小分けにしながら飲んだ方が良い。まずは少量から試してみてはいかがでしょうか？\n＊味はかなり不味いです。"],["images/workout.png","HIITとは？(初心者向け)","HIIT(高強度インターバルトレーニング)は高強度の運動と軽度の運動を交互に行う方法です。例は20秒全力ダッシュ(心拍数をMAXの80～90%)と10秒歩くを繰り返すと行った感じです。メリットは時短効果・ダイエット効果・空腹感の減少・持久力や筋力UP・アンチエイジング・心疾患や糖尿病の予防など。普通の有酸素運動だと時間の確保が難しいですし、筋肉が落ちる・食欲増・老化の促進とデメリットがありますが、HIITにはそれがありません。むしろ真逆です。最短4分で出来るのもあるので是非試してみてはいかがでしょうか？"],
  ];
  var item = [];
  var count = 0;
  @override
  void initState() {
    super.initState();
    set();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black), centerTitle: true,elevation: 0,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(itemCount: item.length, itemBuilder: (context, index,) {
                  return GestureDetector(
                      onTap: ()  {  Navigator.of(context).push(MaterialPageRoute(builder: (context) => V3All2(item[index])),).then((value) {});},
                      child:Card(
                        shadowColor: Colors.grey[50], elevation: 0, clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        child: Container(margin: EdgeInsets.all(10),color: Colors.grey[50],
                          child: Column(children: [
                            Container(margin:EdgeInsets.all(5),child: Text(item[index][1],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 15),textAlign: TextAlign.center,),),
                          ],),),));}
                  ,),), ])));}
  void set (){
    for(int i = 0; i<item1.length; i++)
      if (item1[i][0] == widget.Id){setState(() {item.add(item1[i]);});}else{}
  }

}

class V3All2 extends StatefulWidget {
  V3All2(this.item);List item;
  @override
  State<V3All2> createState() => _V3All2State();
}

class _V3All2State extends State<V3All2> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          title: Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          elevation: 0,automaticallyImplyLeading: false,
          actions: <Widget>[IconButton(onPressed: () {Navigator.pop(context); }, icon: Icon(Icons.highlight_off,size:30,color: Colors.green,))],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(margin:EdgeInsets.only(top:20,left: 50,right: 50),child:  Image.asset(widget.item[0],),),
              Container(margin:EdgeInsets.only(top:30,left: 20,right: 20),child: Text(widget.item[1],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 25),textAlign: TextAlign.center,),),
              Container(margin:EdgeInsets.only(top:30,bottom:60,left: 20,right: 20),child: Text(widget.item[2],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blueGrey[200],fontSize: 15,height: 3),textAlign: TextAlign.center,),),
            ])));}

}