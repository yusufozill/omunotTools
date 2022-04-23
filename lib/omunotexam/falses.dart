// import '/omunotexam/classes/questionClass.dart';
// import '/omunotexam/popup.dart';
// import '/omunotexam/res/customColors.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '/omunotexam/soru.dart';
// import 'coktansecmeli.dart';

// class Falses extends StatefulWidget {
//   final Map newmap;
//   final String soruname;
//   final String soruoneki;
//   final String yil;
//   final Map<String, Map<String, Map<String, Map<String, String>>>> sinif;

//  const Falses({
//     Key? key,
//     required this.soruname,
//     required this.newmap,
//     required this.soruoneki,
//     required this.yil,
//     required this.sinif,
//   }):super(key: key);

//   @override
//   _FalsesState createState() => _FalsesState();
// }

// class _FalsesState extends State<Falses> {
//   late PageController soruindexiki;
//   bool sonucGoster = false;
//   var sorusayisi = 75;
//   late ScrollController controller;

//   String sayac = "";
//   bool boolean = true;
//   late String text;
//   int cozulen = 1;
//   int cozulmus = 0;
//   int index = 0;
//   List<String> soruyili = [];
//   List<String> sorunumarasi = [];
//   List<Widget> widgetlist = [];
//   Set<String> sorutamlist = {};
  


//   @override
//   void initState() {
//     sorumaker();
//     soruindexiki = PageController();
   
//     super.initState();
//   }

//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   var k = 0;
//   bool _bol =false;
//   Future<void> tercihyukle(String x, String y) async {
//     final SharedPreferences prefs = await _prefs;

//     if ((widget.sinif[widget.soruname]![x]![y]!["type"] == null)) {
//       int counter = (prefs.getInt(widget.soruoneki + x.toString() + y) ?? 6);
//       if (counter == 5) {
//       _bol =true;
//       }
//     } else {
//       List<String> counter =
//           prefs.getStringList((widget.soruoneki + x.toString() + y)) ?? [];

//       if (counter.length ==widget.sinif[widget.soruname]![x]![
//                                 y]!["N"]?.split(",").length) {
//         _bol=true;
//       }


//     }
//       var kesan = sorutamlist.length;
//       sorutamlist.add(x + y);
//       if (kesan == sorutamlist.length) {
//       //print("kesan == sorutamlist.length: $kesan, Soru maker başlatılacak");
//         sorumaker();
//       } else

//      if (_bol){
//         soruyili.remove(x);
//         sorunumarasi.remove(y);
//         k--;
//      }


//   }

//   Future<List<String>> getlist() async {
//     //print("getlist aktif");
//     final SharedPreferences prefs = await _prefs;
//     final List<String> counter =
//         (prefs.getStringList(widget.soruoneki + "falses") ?? genellist());

//     //print("getlist: ?? $counter");
//     return counter;
//   }

//   void sorumaker() async {
//     //print("sorumaker aktif");
//     List<String> falses = await getlist();
//     //print("getlist bitti");
//     if (boolean) {
//       var u = 0;
//       //print("boolean: true");
//       // ignore: unnecessary_null_comparison
//       if (falses.length == null) {
//         falses = [""];
//       }

//       while (u < falses.length) {
//         //print("yanlış soru eklendi");
//         var m = falses[u];
//         //print(m);
//         var a = m.toString()[5] + m.toString()[6];
//         soruyili.add(a);
//         //print("soru yili yazildi: $soruyili");

//         var o = 0;
//         String surunumarasi = "";

//         while (o < m.length - 7) {
//           //print("soru numarası için girişim yapılıyor: $o");
//           surunumarasi = surunumarasi + m.split('')[7 + o].toString();

//           //print("suru numarasi  eklendi: $surunumarasi");

//           o++;
//         }
//         sorunumarasi.add(surunumarasi);
//         //print("soru numarasi yazildi: $sorunumarasi");
//         u++;
//         //print("u artırıldı: $u");
//       }
//       //print("While dan çıkıldı");
//     }

//     // if(true){
//     setState(() {
//       sorunumarasi = sorunumarasi;
//       soruyili = soruyili;
//     });
//    int _a =0;
//    Set<String> _b ={};
//     while(_a<sorunumarasi.length){
//           int _c=_b.length;
//          //print("soruuu_c: $_c , _b: $_b _a: $_a");

//          _b.add(sorunumarasi[_a]+ soruyili[_a]);


//          if(_c==_b.length){
//            //print("c=b");

//                    sorunumarasi.removeAt(_a);
//                    soruyili.removeAt(_a);
//                    _a--;
//          }else{
  
//          //print("sorunumarasi soruyili silindi");

//          }

// _a++;
//     }
//   }

//   List<String> genellist() {
//     //print("genellist aktif");

//     setState(() {
//     });

//     // while (z < sorusayisi) {
//     //   //  //print("soru eklendi");
//     //   var x = Random().nextInt(widget.sinif[widget.soruname]!.length);
//     //   var y = Random().nextInt(
//     //       widget.sinif[widget.soruname]!.entries.elementAt(x).value.length);
//     //   y++;
//     //   setState(() {
//     //     tercihyukle(widget.sinif[widget.soruname]!.entries.elementAt(x).key,
//     //         y.toString());

//     //     soruyili.add(widget.sinif[widget.soruname]!.entries.elementAt(x).key);
//     //     sorunumarasi.add(y.toString());
//     //   });
//     //   z++;
//     // }

//     boolean = false;
//     return [];
//   }

//   @override
//   void dispose() {
//     soruindexiki.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //print("widget yazılıyoru");
//     var icen = MediaQuery.of(context).size.width;
//     var icyukseklik = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CustomColors.firebaseNavy,
//         title: const Text("Yanlışların",
//             style: TextStyle(color: CustomColors.firebaseAmber)),
//       ),
//       body: sorunumarasi.isEmpty
//           ? const Center(
//               child: Text(
//                 "Süper, Hiç Yanlışın Yok",
//                 style:
//                     TextStyle(color: CustomColors.firebaseAmber, fontSize: 40),
//               ),
//             )
//           : Stack(
//               children: [
//                 SizedBox(
//                   // color: Colors.red,
//                   height: icyukseklik,

//                   //color: Colors.green,
//                   child: PageView.builder(
//                     physics: const BouncingScrollPhysics(),
//                     onPageChanged: (index) => {changed(index)},
//                     scrollDirection: Axis.horizontal,
//                     controller: soruindexiki,
//                     itemCount: sorunumarasi.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       //     //print("ilk soruyu yazdır");
//                       bool bakbakalim = (widget.sinif[widget.soruname]![
//                                   soruyili.elementAt(index)]![
//                               sorunumarasi.elementAt(index)]!["type"]) ==
//                           null;
                          
//                         //print("soruyili : $soruyili "  );
//                         //print("sorunumarasi: $sorunumarasi");
//                       try {
//                         return bakbakalim
//                             ? Soru(
//                                 const  Key("soru"),
//                                 yanlislanan : widget.newmap[soruyili.elementAt(index).toString()+"+"+ sorunumarasi.elementAt(index).toString()],

//                                 index: index,
//                                 yil: widget.yil,
//                                 sinif: widget.sinif,
//                                 soruname: widget.soruname,
//                                 icen: icen,
//                                 sorunumarasi: sorunumarasi.elementAt(index),
//                                 soruyili: soruyili.elementAt(index),
//                                 soruoneki: widget.soruoneki,
//                                 //      function: nextPage(),
//                               )
//                             : CoktanSecmeli(
//                                 UniqueKey(),
//                                sanalKey: k,
//                                item: Question(soruMap: {},),
//                                function: soruFunction,
//                                 //      function: nextPage(),
//                               );
//                       } catch (e) {
//                         return Text("Bir Hata oluştu ve " +
//                             soruyili.elementAt(index) +
//                             " yılı, " +
//                             sorunumarasi.elementAt(index) +
//                             " numaralı soru yüklenemedi ");
//                       }
//                     },
//                   ),
//                 ),

//                 SizedBox(
//                   height: icyukseklik * 1 / 10,
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 12),
//                       const Expanded(
//                         child: Text(""),
//                       ),
//                       const SizedBox(width: 15),
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(50),
//                         child: Container(
//                           color: CustomColors.firebaseNavy,
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 6, right: 6, top: 2, bottom: 2),
//                             child: Row(
//                               children: [
//                                 const Icon(
//                                     IconData(57565,
//                                         fontFamily: 'MaterialIcons'),
//                                     color: Colors.white70),
//                                 Text(
//                                   (soruindexiki.initialPage + 1).toString() +
//                                       "/" +
//                                       sorunumarasi.length.toString(),
//                                   style: const TextStyle(
//                                       fontSize: 18, color: Colors.white70),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                     ],
//                   ),
//                 ),

//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SizedBox(
//                       height: icyukseklik,
//                     ),
//                     InkWell(
//                         onTap: () {
//                           Popup.createAlertDialog(
//                               context,
//                               id:
//                               );
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(50),
//                               child: Container(
//                                   color: CustomColors.firebaseYellow,
//                                   child: Container(
//                                       padding: const EdgeInsets.all(8),
//                                       child: const Text(
//                                         "Soruyu bildir",
//                                         style: TextStyle(
//                                             color: Colors.black, fontSize: 25),
//                                       )))),
//                         )),
//                   ],
//                 ) //        Expanded(child: Container()),
//                 // ElevatedButton(
//                 //     onPressed: () {

//                 //     },
//                 //     child: Container(height: icen * 1 / 10)),
//               ],
//             ),
//     );
//   }
//     void soruFunction(int puan,bool sonuc){
//     if(puan==0){
      
//       nextPage();
//     }else{
//       nextPage();
//     }
//   }
//   changed(int inde) {
//     setState(() {
//       index = inde;
//     });
//   }

//   void nextPage() {
//     // //print( Category.sonucdatabase[widget.yil]![widget.soruname]!.entries.elementAt(0).key +
//     //     " : " +
//     //      Category.sonucdatabase[widget.yil]![widget.soruname]!.entries.elementAt(0).value.toString());

//     //  Category.sonucdatabase[widget.yil]![widget.soruname]!["Doğru"] = 6;

//     // //print( Category.sonucdatabase[widget.yil]![widget.soruname]!.entries.elementAt(0).key +
//     //     " : " +
//     //      Category.sonucdatabase[widget.yil]![widget.soruname]!.entries.elementAt(0).value.toString());

//     soruindexiki.animateToPage(
//       soruindexiki.page!.toInt() + 1,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.bounceInOut,
//     );
//   }

// //    void suresayac() {
// //    // //print("suresayac başlar");

// //     const oneSec = const Duration(seconds:1);
// //     _timer = new Timer.periodic(
// //       oneSec,
// //       (Timer timer) {
// //         // if (time == 0) {
// //         //   setState(() {

// //         //   });
// //         // } else {
// //           //  if( Category.falsesorugec<=0){
// //           //    nextPage();

// //           //  }

// //           setState(() {
// //           });
// //         //}
// //       },
// //     );
// //  //   //print("suresayac başlar");
// //   }

//   void previousPage() {
//     soruindexiki.animateToPage(
//       soruindexiki.page!.toInt() - 1,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.bounceInOut,
//     );
//   }
// }
