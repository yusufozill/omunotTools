// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../popup.dart';

class Question {
  Map<String, dynamic> soruMap;

  Question({
    required this.soruMap,
  });

  /// [getId] aslında sorunun id nosunu oluşturan bir fonksiyondur. Bu id soruyu tanımlayan benzersiz bir koddur sinif blok yil no grup  şeklinde sıralanır
  String getId() {
    String k = "";
    for (String i in soruMap["meta"].toString().split(",")) {
      k += "+$i";
    }

    return k.replaceFirst("+", "");
  }

  dynamic getObject(String a) => soruMap[a];
  void addAll(Map<String, dynamic> map) {
    for (var item in map.entries) {
      soruMap[item.key] = item.value;
    }
  }

  /// [hataliOlarakisaretle] soruyu hatalı olarak isaretler
  Future<void> hataliOlarakisaretle(BuildContext context, Question question) async {
       
        Popup.createAlertDialog(
                    context,
                    id:getId(),
                    user:FirebaseAuth.instance.currentUser!.email.toString().split("@")[0].toString(),
                    question:question
                  );
   
  }
  void hataliOlarakFormGonder({required String aciklama}) async{
 final database = FirebaseDatabase.instance;
    if (FirebaseAuth.instance.currentUser == null) return;
    await database.ref("Falses/${getId()}").update({
      FirebaseAuth.instance.currentUser!.displayName.toString() +
          "(" +
          FirebaseAuth.instance.currentUser!.email.toString().split("@")[0] +
          ")": aciklama+ "   |   "+(DateTime.now()
              .minute
              .toString() +
          "/" +
          DateTime.now().hour.toString() +
          "/" +
          DateTime.now().day.toString() +
          "/" +
          DateTime.now().month.toString() +
          "/" +
          DateTime.now().year.toString())
    });
  }

  Future<int> getIsaretlenmeSayisi() async {
    final database = FirebaseDatabase.instance;
// 'Falses/' + soruoneki+"/$soruyili+$sorunumarasi"
    int _a = 0;
    if (FirebaseAuth.instance.currentUser == null) return 0;
    await database
        .ref("Falses/${getId()}")
        .get()
        .then((value) => _a = value.children.length);

    return _a;
  }

  Future<Set<String>> oncekiCevabiGetir() async {
    final List<String> counter =

        ///TO DO [k] yı yaz
        (await getPref()).getStringList(getId()) ?? [];
    return counter.toSet();
  }
  
  bool dogrumuKontrolEt({String? cevap, Set<String>? cevapList }){
    List dogrucevaplar=dogruSiklariGetir();
    bool sonuc= false;
    if(cevap!=null){
     sonuc= dogrucevaplar.contains(cevap);
    }else{
      sonuc= true;
     for(var i in cevapList??{}){
      if(!dogrucevaplar.contains(i)) {
        sonuc=false;
        
      }
         
     }
    }
    
     

    return sonuc;
  }
  
  Future<SharedPreferences> getPref() => SharedPreferences.getInstance();
  Future<Set<String>> falsesGetir() async {
    final List<String> _x = (await getPref()).getStringList("falses") ?? [""];
    return _x.toSet();
  }

  List<String> dogruSiklariGetir() => soruMap["N"].toString().split(",");

  Future<Set<String>> oncekiDogruSiklariGetir() async => dogruSiklariGetir()
      .toSet()
      .intersection((await oncekiCevabiGetir()).toSet());

  Future<void> isaretlenecekSiklariGetir(
      void Function(String, bool) renk) async {
    var _x = await oncekiCevabiGetir();
    var _y = dogruSiklariGetir();
    Set<String> list = {};
    bool cevap = true;
    Set<String> _h = _y.toSet().intersection((_x).toSet());

    _y.length == 1
        ? _h.isEmpty
            ? {list = _x, cevap = false}
            : {list = _x, cevap = true}
        : {_h, cevap = true};

    for (String kisa in list) {
      if (kisa.isEmpty || kisa == "") {
        continue;
      }
      renk(kisa, cevap);
    }
  }

  String getQuestion() => soruMap["Q"];
  String getMeta() {
    String dondurulecek = "";
    List<String> meta = soruMap["meta"].toString().split(",");
    int c = int.tryParse(meta[2])! + 2000;

    meta[2] = c.toString() + "/" + (c + 1).toString();
    dondurulecek += meta[2];
    dondurulecek += meta.length != 5 ? "" : " | " + meta[4];
    dondurulecek += " " + meta[3] + ". Soru";
    if (meta[1].toLowerCase().contains("gis")) {
      dondurulecek = "Gis bloğu metaverileri hazır değil";
    }
    return dondurulecek;
  }
  Future<bool> soruTamamenDogrumu() async{

    List<String> dogrucevaplar=dogruSiklariGetir();
    Set<String> oncekiCevaplar= await oncekiCevabiGetir();

    return dogrucevaplar.toSet().intersection(oncekiCevaplar).length== dogrucevaplar.length;
  
  }
  Future<bool> soruYanlismi() async{

    List<String> dogrucevaplar=dogruSiklariGetir();
    Set<String> oncekiCevaplar= await oncekiCevabiGetir();
     return oncekiCevaplar.length>0 && !(dogrucevaplar.toSet().intersection(oncekiCevaplar).length==dogrucevaplar.toSet().length);
  
  }
  Future<void> cevabiKaydet(Set<String> list) async {
    final SharedPreferences prefs = await getPref();
    Set<String> _oncekiCevaplar = await oncekiCevabiGetir();
    list.addAll(_oncekiCevaplar.length == dogruSiklariGetir().length
        ? []
        : _oncekiCevaplar);

    if(!dogrumuKontrolEt(cevapList: list)) {prefs.setStringList("falses", list.toList());}

    prefs.setStringList(getId(), list.toList()).then((bool success) {
      return debugPrint(" tercihleri gönder fonksiyonu aktif yazıldı");
    });
  }

  Future<void> remove() async {
    (await getPref()).remove(getId());
    //TO DO [d] aslında yanlış tekrar yaz
  }
}
