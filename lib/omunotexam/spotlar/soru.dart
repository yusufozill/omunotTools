import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '/omunotexam/category.dart';

class SpotSoru extends StatefulWidget {
  final Map event;
  final int index;
  final double icen;
  final int? tx;

  final String soruoneki;

  const SpotSoru({
    Key? key,
    required this.index,
    required this.tx,
    required this.event,
    required this.soruoneki,
    required this.icen,
  }) : super(key: key);
  @override
  _SpotSoruState createState() => _SpotSoruState();
}

class _SpotSoruState extends State<SpotSoru> {
  late ScrollController controller;

  Map sonuc = Category.sonuc;
  bool secilisik = true;

  double fontsize = 18;
  Widget? imagewidget;

  List<Color> colorlist = [
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
  ];
  List<String> falses = [];
  List<String> isaretlenenDogruSiklarListesi = [];
  List<String> trues = [];
  // List<String> cevaplar = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"];
  List<String> cevaplar = [
    "•",
    "•",
    "•",
    "•",
    "•",
    "•",
    "•",
    "•",
    "•",
    "•",
  ];
  List<String> answerlist = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  Set verilencevap = {};

  int toplamdogrusiksayisi = 5;
  late Set<int> toplamisaretlenensiksayisi = {};
  int a = 0;
  @override
  void initState() {
    super.initState();

    debugPrint("soru yükleniyor");

    initanswer();
    //debugPrint(widget.index);
    widget.event["tx"] = widget.tx;
    if (widget.event["img"] != null) {
      debugPrint("buraya girildi");
      imageWidget(widget.event["img"]);
      debugPrint("buraya girilemedi");
    }

    // Category.falsesorugec=1;
    controller = ScrollController();
    super.initState();

    //  //debugPrint("getlist bitti");
  }

  initanswer() {
    int x = 0;
    while (x < widget.event.length) {
      //   //debugPrint(widget.event[x.toString()].toString().length.toString());
      String newstring = "" * (widget.event[x.toString()]).toString().length;
      answerlist.add(newstring);
      x++;
    }
  }

  Future<void> imageWidget(x) async {
    if (x == "") {
      imagewidget = null;
    } else {
      debugPrint("aslında image yüklemeye kadar geldik ve x:$x");

      var s = await getImage(x);
      if (s != "") {
        debugPrint("aslında image yüklemeye kadar geldik ve x:$x");
        imagewidget = Image.network(
          s,
          errorBuilder: (context, error, stackTrace) => const Text(
              "Aslında burada bi fotoğraf olacaktı ama indirmeyi beceremedim"),
        );
      }
      setState(() {});
    }
  }

  Future<String> getImage(filePath) async {
    if (filePath != "" || filePath != 0) {
      String uint8list =
          await FirebaseStorage.instance.ref(filePath).getDownloadURL();
      return uint8list;
    } else {
      return "";
    }
  }
  List<Widget> widgetor(){
      List<Widget> u=[];
            for (var i = 0; i < 10; i++) {
 

    if  (widget.event[i.toString()] != null)
            {       
                Widget a =   ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: colorlist[0],
                        child: InkWell(
                          onTap: () {
                            tus(i.toInt());
                            print(i);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 50),
                              child: Row(
                                children: [
                                  Text(
                                    cevaplar[i],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: fontsize),
                                  ),
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    width: widget.icen - 55,
                                    child: Text(
                                      answerlist[i],
                                      textAlign: TextAlign.center,
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
                    );
                Widget b = const SizedBox(height: 10,);
                u.add(a);
                u.add(b);
       
         }
            }
          
          return u;
    
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var icen = MediaQuery.of(context).size.width;
    //debugPrint(" soru.dart builder ");
    return SingleChildScrollView(
      controller: controller,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(
          height: 50,
        ),
        imagewidget == null
            ? const SizedBox()
            : SizedBox(height: 200, child: imagewidget),
        SizedBox(
          width: icen * 3 / 4,
          child: Text(
            widget.event["dersadi"] ?? "",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontsize),
            textAlign: TextAlign.center,
          ),
        ),
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
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: Text(
                  widget.event["Q"].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontsize),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        widget.event["tx"] != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 6, right: 6, top: 2, bottom: 2),
                        child: Text(
                          widget.event["tx"] != null
                              ? "**Bu spot " +
                                  widget.event["tx"].toString() +
                                  " kere tekrarlandı    "
                              : "",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(height: 40),
        SizedBox(
          //   color: Colors.blueGrey,
          width: widget.icen,

          child: Column(children: widgetor()),
        ),
      ]),
    );
  }

  void tus(_sikkinismi) {
    // //debugPrint("tusa girildi: $_sikkinismi");
    verilencevap.add(_sikkinismi.toString());
    setState(() {
      answerlist[_sikkinismi] = widget.event[_sikkinismi.toString()].toString();
    });

    bool dogrumu = verilencevap
            .intersection(widget.event["N"]
                .toString()
                .replaceAll(" ", "")
                .split(",")
                .toSet())
            .length ==
        widget.event["N"]
            .toString()
            .replaceAll(" ", "")
            .split(",")
            .toSet()
            .length;

    yenisoruyugec(_sikkinismi, dogrumu);
  }
  
   
  void yenisoruyugec(_sikkinismi, dogrumu) {
    if (dogrumu) {
      changed();

      Category.second = 2;
    }
  }

  void changed() {
//    ////debugPrint("index :" + index.toString());

    final hop =
        FirebaseDatabase.instance.ref("spotdatabase/$uid/" + widget.soruoneki);
    void sender(x) {
      if (x != "null") {
        int y = int.parse(x);
        y++;
        hop.child(widget.event["key"]).update({"tx": y});
        setState(() {
          widget.event["tx"] = y;
          // items[widget.index]["index"]=y;
        });
      } else {
        hop.child(widget.event["key"]).update({"tx": 1});
        setState(() {
          widget.event["tx"] = 1;
          // items[widget.index]["index"]=1;
        });
      }
    }

    hop.child(widget.event["key"]).get().then((snaps) => {
          if (snaps.child("tx").exists)
            {sender(snaps.child("tx").value.toString())}
          else
            {sender("null")}
        });

//     if (cozulen + 2 > _items.length) {

//       sorumaker();
//     }
//     if (indexiki <= index) {
//       //  ////debugPrint("ileri");
//       indexiki = index;
//       Category.second = 40;
//       if (birakildi) {
//         soruracesayac();
//         birakildi = false;
//       }
//     } else {
//       //   ////debugPrint("geri");

//       _timertwo.cancel();
//       birakildi = true;
//     }
  }
}
