import 'package:flutter/material.dart';
import 'category.dart';
import 'classes/questionClass.dart';
import 'classes/questionList.dart';
import 'popup.dart';
import 'res/customColors.dart';

class CoktanSecmeli extends StatefulWidget {
  final int sanalKey;
  final Question item;
  final void Function(int, bool) function;
 const  CoktanSecmeli( Key key,
      {required this.item, required this.function, required this.sanalKey});
  @override
  _CoktanSecmeliState createState() => _CoktanSecmeliState();
}

class _CoktanSecmeliState extends State<CoktanSecmeli> {
  late ScrollController controller;
  double fontsize = 18;
  Map<String, Color> colorlist = {};
  int error = 0;
  Set<String> isaretlenenDogruSiklarListesi = {};
  Map cevaplar = {
    "A": "A",
    "B": "B",
    "C": "C",
    "D": "D",
    "E": "E",
    "0": "I",
    "1": "II",
    "2": "III",
    "3": "IV",
    "4": "V",
    "5": "VI",
    "6": "VII",
    "7": "VIII",
    "8": "IX",
    "9": "X",
  };
  late Set<String> isaretlenenSiklar = {};
  @override
  void initState() {
    questionInit();
    controller = ScrollController();
    super.initState();
    // tercihyukle();
    // getlist();

    //  //debugPrint("getlist bitti");
  }

  Future<void> questionInit() async {
    
    widget.item.isaretlenecekSiklariGetir(renk);

    //  widget.item.getIsaretlenmeSayisi().then((value) => setState(() {
    //   error=error;
    //     print("yazdık = $error");
    // }));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void didUpdateWidget(covariant CoktanSecmeli oldWidget) {
    // TODO: implement didUpdateWidget
        colorlist={};
    widget.item.isaretlenecekSiklariGetir(renk);
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    if (QuestionList.falseDatabase.keys.contains(widget.item.getId())) {
      error = QuestionList.falseDatabase[widget.item.getId()]!.children.length;
    }
    return SingleChildScrollView(
      controller: controller,
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(height: 65),
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: CustomColors.softWhite90,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 70.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 20, right: 20),
                      child: Text(
                        // "(" +
                        //     ((2000 + int.parse(widget.soruyili)).toString() +
                        //         "/" +
                        //         (2001 + int.parse(widget.soruyili)).toString()) +
                        //     "-" +
                        //     widget.sorunumarasi +
                        //     ")" +
                        widget.item.getQuestion(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: fontsize),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Stack(
          
        
          children: [
            
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(
                      left: 20, right: 6, top: 2, bottom: 2),
                  child: Text(
                    widget.item.getMeta(),
                    style: const TextStyle(
                        fontSize: 12, color: CustomColors.black),
                  ),
                ),
              ),
            
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.item.hataliOlarakisaretle(context,widget.item);
                    error++;
                  });
              
                },
                child: RichText(
                  textAlign: TextAlign.right,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            color: CustomColors.black),
                        text: "Hatalı Olarak İşaretle")
                  ]),
                ),
              ),
            )
          ],
        ),
        error != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 6, top: 2, bottom: 2),
                      child: Text(
                        "**Bu soru " +
                            error.toString() +
                            " kişi tarafından hatalı olarak işaretlenmiş   ",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(height: 0),
        SizedBox(
          //   color: Colors.blueGrey,

          child: Column(children: [
            for (var i in widget.item.soruMap.entries) ...[
              !cevaplar.containsKey(i.key)
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        color: colorlist[i.key.toString()] ??
                            CustomColors.softWhite,
                        child: InkWell(
                          onTap: () {
                            tus(i.key.toString());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 50),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      cevaplar[i.key] ?? i.key,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: fontsize),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 18,
                                    child: Text(
                                      i.value.toString(),
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
            ]
          ]),
        ),
        const SizedBox(height: 65),
      ]),
    );
  }

  void tus(String _sikkinismi) {
    // print("widget.item.soruMap");
    // print(widget.item.soruMap);
    // print(widget.item.dogruSiklariGetir());
    // print(_sikkinismi);

    if (isaretlenenSiklar.length == widget.item.dogruSiklariGetir().length)
      return;

    renk(_sikkinismi,
            widget.item.dogruSiklariGetir().contains(_sikkinismi.toString()))
            
        ? isaretlenenDogruSiklarListesi.add(_sikkinismi.toString())
        : null;
          isaretlenenSiklar.add(_sikkinismi);
    var _k = widget.item.dogruSiklariGetir();
        if (_k.length == 1) {
          colorlist[widget.item.dogruSiklariGetir().first] = correct;
        }
    widget.item.cevabiKaydet({_sikkinismi});
    if (isaretlenenSiklar.length == widget.item.dogruSiklariGetir().length) {
      widget.function(
          widget.item
              .dogruSiklariGetir()
              .toSet()
              .intersection(isaretlenenSiklar)
              .length,
          widget.item
                  .dogruSiklariGetir()
                  .toSet()
                  .intersection(isaretlenenSiklar)
                  .length ==
              widget.item.dogruSiklariGetir().length);
    }
  }

  bool renk(String id, bool bolean) {
  
     print("id" );
     print(id );
    // print(bolean );
    setState(() {
      if (bolean) {
        colorlist[id] = correct;
      } else {
        colorlist[id] = incorrect;
    
      }
    });

    return bolean;
  }
}
