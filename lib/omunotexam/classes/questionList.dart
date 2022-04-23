import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'questionClass.dart';

class QuestionList {
  final Map<String, Map<String, Map<String, String>>> database;

  QuestionList({
    required this.database,
  });

  List<Question> butunSorulariGetir() {
    List<Question> a = [];

    sortin(Map<String, dynamic> map) {
      if (map.entries.first.value.runtimeType ==
          ({"Q": "wekf", "B": "dfsdf"}.entries.first.value.runtimeType)) {
        a.add(Question(soruMap: map));
      } else {
        for (var i in map.entries) {
          sortin(i.value);
        }
      }
    }

    sortin(database);
    return a;
  }

  int _toplamsorusayisi = 0;

  int hesaplaSoruSayisi() {
    for (var item in database.values) {
      _toplamsorusayisi += item.values.length;
    }
    return _toplamsorusayisi;
  }

  int toplamSoruSayisi() => _toplamsorusayisi;

  Future<List<Question>> getFilters(String keyword) async {
    keyword.replaceAll("#", "");
    _toplamsorusayisi = 0;
    List<Question> filteritems = [];
    
     butunSorulariGetir().forEach((Question _ques) async {
        if (_ques
            .getObject("meta")
            .toString()
            .split(",")[1]
            .toLowerCase()
            .contains("gis"))
          const mama = SnackBar(
            content: Text("Gis Bloğunda tarih filtresi çalışmamaktadır"),
          );
        
        Question newQuestion = _ques;
        bool sortcase;
        switch (keyword.toLowerCase()) {
          case "yanlışlarım":
            sortcase = (await _ques.soruYanlismi());
            break;
          case "yanlıslarım":
            sortcase = (await _ques.soruYanlismi());
            break;
          case "yanlişlarım":
            sortcase = (await _ques.soruYanlismi());
            break;
          case "yanlislarım":
            sortcase = (await _ques.soruYanlismi());
            break;
          case "doğrularım":
            sortcase = (await _ques.soruTamamenDogrumu());
            break;
          case "dogrularım":
            sortcase = (await _ques.soruTamamenDogrumu());
            break;
          default:
            sortcase = newQuestion.soruMap.values
                .toString()
                .toLowerCase()
                .contains(keyword.toLowerCase());
        }
        if (keyword.toLowerCase().contains("/")) {
          String sorting = keyword.replaceAll("yil:", "");
          int bir = int.tryParse(sorting.split("/")[0]) ?? 99;
          int iki = int.tryParse(sorting.split("/")[1]) ?? 0;
          bir %= 100;
          iki %= 100;

          int k =
              int.tryParse(_ques.getObject("meta").toString().split(",")[2]) ??
                  0;
          k %= 100;
          sortcase = bir >= k && (iki - 1) <= k;
        }
        newQuestion.addAll({"sortcase": sortcase.toString()});
        if (sortcase) {
          print(_toplamsorusayisi);
          _toplamsorusayisi++;
        }
        filteritems.add(newQuestion);
      });

    print("hasan");
    bool sortCase(Question map) => map.getObject("sortcase") == "true";
    filteritems.sort(((a, b) => _mySortComparison(a, b, sortCase)));

    return filteritems;
  }

  static Map<String, DataSnapshot> falseDatabase = {};
  Future<Iterable<DataSnapshot>> getFalseDatabase() async {
    final database = FirebaseDatabase.instance;
// 'Falses/' + soruoneki+"/$soruyili+$sorunumarasi"
    Iterable<DataSnapshot> a = (await database.ref("Falses/").get()).children;

    for (var i in a) {
      falseDatabase[i.key!] = i;
    }

    return a;
  }
  
  
  List<Question> siralamayiGuncelle(List<Question> bu) {
        bool sortCase(Question map) => map.getObject("sortcase") == "true";
        bu.sort(((a, b) => _mySortComparison(a, b, sortCase)));

        return bu;
      
  }
  int _mySortComparison(
      Question a, Question b, bool Function(Question) sortCase) {
    if (sortCase(a) && sortCase(b)) {
      return 0;
    } else if (sortCase(a) && !sortCase(b)) {
      return -1;
    } else {
      return 1;
    }
  }
}
