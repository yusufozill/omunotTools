import 'package:flutter/material.dart';
const Color selected=Color(0xffB1A928);
String uid="";
const Color correct=Color(0xff56B856);
const Color incorrect=  Color(0xffF02A2A)   ;
class Category {
  static int situation=0;
  static int second=40;
 // static int falsesorugec=4;
  static Map<String, dynamic> sonuc = {
    "dogru": 0,
    "yanlis": 0,
    "bos": 0,
    "net": 0.0,
    "Süre": 0,
    "Puan": 0.0,
    "cozulmus":0,
  };


static Map<String, Map<String, Map<String, dynamic>>> sonucdatabase = {
   
    "3": {
      "yaslanma":{
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
      "nöro": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "final": {
        "toplam": 0,
        "dogru": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "bütünleme": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "Endokrin": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
    },
    "4": {
      "Pediatri":{
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
      "SolDol":{
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
      "Gis ": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "Endokrin": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "final": {
        "toplam": 0,
        "dogru": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
        "bütünleme": {
        "dogru": 0,
        "toplam": 0,
        "yanlis": 0,
        "bos": 0,
        "net": 0.0,
        "Süre": 0,
        "Puan": 0.0,
        "cozulmus": 0,
      },
    },
  };
  


}
