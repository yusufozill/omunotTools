import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/omunotexam/category.dart';
import '/omunotexam/res/customColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Soru extends StatefulWidget {
  final int index;
  final int? yanlislanan;
  final double icen;
  final String soruyili;
  final String yil;
  final String soruoneki;
  final String soruname;
  final Map<String, Map<String, Map<String, Map<String, String>>>> sinif;
  final String sorunumarasi;
   const Soru(
     Key key,
     {
    required this.index,
    required this.yil,
    required this.yanlislanan,
    required this.soruname,
    required this.sinif,
    required this.icen,
    required this.soruyili,
    required this.soruoneki,
    required this.sorunumarasi,
  }):super(key: key);
  @override
  _SoruState createState() => _SoruState();
}

class _SoruState extends State<Soru> {
  late ScrollController controller;

  Map sonuc = Category.sonuc;
  bool secilisik = true;

  double fontsize = 18;

  List<Color> colorlist = [
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
  ];
  List<String> falses = [];
  List<String> trues = [];

  List cevaplar = ["A", "B", "C", "D", "E"];

  String? cevap;
//
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> getlist() async {
    // //debugPrint("getlist aktif");
    final SharedPreferences prefs = await _prefs;
    final List<String> counter =
        (prefs.getStringList(widget.soruoneki + "falses") ?? []);
  final List<String> counteriki = (prefs.getStringList(widget.soruoneki+"trues")??[]);
    trues =counteriki;
    falses = counter;
  }
    Future<void>? addFirebase(onek,isim,list) {
       
    final database = FirebaseDatabase.instance;
     DatabaseReference  messagesRef = database.ref('Users/' +uid.toString() +"/" + onek);
    // Call the user's CollectionReference to add a new user
     messagesRef.update({isim:list});
     return null;
  }
     Future<void>? getNo(onek,isim,list) {
       
    final database = FirebaseDatabase.instance;
     DatabaseReference  messagesRef = database.ref('Users/' +uid.toString() +"/" + onek);
    // Call the user's CollectionReference to add a new user
     messagesRef.update({isim:list});
     return null;
  }

   
  Future<void> setlist() async {
    final SharedPreferences prefs = await _prefs;
    
    prefs.setStringList(widget.soruoneki + "falses", falses);
    prefs.setStringList(widget.soruoneki + "trues", trues);
 //   addFirebase(widget.soruoneki, "falses", falses);
   // addFirebase(widget.soruoneki, "trues", trues);

   // Map<String, dynamic> liste = {widget.soruoneki + "falses": falses};

 
  }

  Future<void> tercihyukle() async {
    // //debugPrint("tercihyukle aktif");

    final SharedPreferences prefs = await _prefs;
    final int counter =
        (prefs.getInt(
                widget.soruoneki + widget.soruyili + widget.sorunumarasi) ??
            6);
    
        
   // //debugPrint("counter$counter");
    if (counter < 5) {
      setState(() {
        colorlist[counter] = incorrect;
      });
    } else if (counter == 5) {
      tus(5);
    }
  }

  Future<void> tercihlerigonder(a, b) async {
    // //debugPrint("tercihlerigonder aktif");

    final SharedPreferences prefs = await _prefs;

    setState(() {
      prefs.setInt(a, b).then((bool success) {
        return debugPrint(" tercihleri gönder fonksiyonu aktif yazıldı");
      });
    });
  }

  int a = 0;
  @override
  void initState() {

    controller = ScrollController();
    super.initState();
    tercihyukle();
    getlist();

    //  //debugPrint("getlist bitti");
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var icen = MediaQuery.of(context).size.width;
    if (a == 0) {
      //   //debugPrint("Widget tamamlanıyor");
      a++;
    }
    cevap = widget
        .sinif[widget.soruname]![widget.soruyili]![widget.sorunumarasi]!["N"];
    return SingleChildScrollView(
      controller: controller,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(height: 65),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Colors.white38,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 70.0,
                minWidth: icen,
              ),
              child: Container(
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: Text(
                  // "(" +
                  //     ((2000 + int.parse(widget.soruyili)).toString() +
                  //         "/" +
                  //         (2001 + int.parse(widget.soruyili)).toString()) +"-"+widget.sorunumarasi+
                  //     ")" +
                      (widget.sinif[widget.soruname]![widget.soruyili]![
                              widget.sorunumarasi]!["Q"])
                          .toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontsize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
       
       widget.yanlislanan!= null? 
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  alignment: Alignment.topCenter,
                  color: CustomColors.firebaseNavy,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6, right: 6, top: 2, bottom: 2),
                    child: Text(
                    widget.yanlislanan!= null?   "**Bu soru "+widget.yanlislanan.toString() +" kişi tarafından hatalı olarak işaretlenmiş   ":"",
                      style: const TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ),
                ),
              ),
             
            ],
          ):  const SizedBox(height: 40),
            
        SizedBox(
          //   color: Colors.blueGrey,
          width: widget.icen,

          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: colorlist[0],
                child: InkWell(
                  onTap: () {
                    tus(0);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
                          Text(
                            "A",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: widget.icen - 42,
                            child: Text(
                              (widget.sinif[widget.soruname]![widget
                                      .soruyili]![widget.sorunumarasi]![cevaplar[0]])
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              //maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: colorlist[1],
                child: InkWell(
                  onTap: () {
                    tus(1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
                          Text(
                            "B",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: widget.icen - 42,
                            child: Text(
                              (widget.sinif[widget.soruname]![widget
                                      .soruyili]![widget.sorunumarasi]!["B"])
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              ////maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: colorlist[2],
                child: InkWell(
                  onTap: () {
                    tus(2);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
                          Text(
                            "C",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: widget.icen - 42,
                            child: Text(
                              (widget.sinif[widget.soruname]![widget
                                      .soruyili]![widget.sorunumarasi]!["C"])
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              //maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: colorlist[3],
                child: InkWell(
                  onTap: () {
                    tus(3);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
                          Text(
                            "D",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: widget.icen - 42,
                            child: Text(
                              (widget.sinif[widget.soruname]![widget
                                      .soruyili]![widget.sorunumarasi]!["D"])
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              //maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: colorlist[4],
                child: InkWell(
                  onTap: () {
                    tus(4);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
                          Text(
                            "E",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: widget.icen - 42,
                            child: Text(
                              (widget.sinif[widget.soruname]![widget
                                      .soruyili]![widget.sorunumarasi]!["E"])
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 65),
      ]),
    );
  }

  void tus(color) {

    if (color == 5) {
      var i = 0;
      while (cevap != cevaplar[i]) {
        i++;
      }
      setState(() {
        colorlist[i] = correct;
      });
    } 
    else if (secilisik) {
      //  //debugPrint("1");
      if (cevap == cevaplar[color]) {
        setState(() {
          colorlist[color] = correct;
          //debugPrint("widget.yil: "+ widget.yil);

          Category.sonucdatabase[widget.yil]![widget.soruname]!["dogru"] += 1;
          Category.sonucdatabase[widget.yil]![widget.soruname]!["cozulmus"] += 1;
              
          Category.sonucdatabase[widget.yil]![widget.soruname]!["net"] =
              Category.sonucdatabase[widget.yil]![widget.soruname]!["dogru"] -
                  (Category.sonuc["yanlis"] / 4);
       });
       //debugPrint("widget.soruname: "+widget.soruname);
        tercihlerigonder(
            widget.soruoneki + widget.soruyili + widget.sorunumarasi, 5);
        trues.add(widget.soruoneki +
              widget.soruyili.toString() +
              widget.sorunumarasi);
        falses.remove(widget.soruoneki + widget.soruyili + widget.sorunumarasi);
        setlist();
      } else {
        setState(() {
          colorlist[color] = incorrect;
          Category.sonucdatabase[widget.yil]![widget.soruname]!["yanlis"] += 1;
          Category.sonucdatabase[widget.yil]![widget.soruname]!["cozulmus"] += 1;
          Category.sonucdatabase[widget.yil]![widget.soruname]!["net"] =
              Category.sonucdatabase[widget.yil]![widget.soruname]!["dogru"] -
                  (Category.sonuc["yanlis"] / 4);

          tercihlerigonder(
              widget.soruoneki +
                  widget.soruyili.toString() +
                  widget.sorunumarasi,
              color);
          falses.add(widget.soruoneki +
              widget.soruyili.toString() +
              widget.sorunumarasi);
          setlist();
        });
        var i = 0;
        while (cevap != cevaplar[i]) {
          i++;
        }
        colorlist[i] = correct;
   
      }
      secilisik = false;
      
   }
     Category.second = 2;

  }


  
}
