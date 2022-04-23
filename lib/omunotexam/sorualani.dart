// ignore_for_file: file_names, use_key_in_widget_constructors
import 'tumspotx.dart';

import '/omunotexam/classes/questionClass.dart';
import '/omunotexam/classes/questionList.dart';
import '/omunotexam/coktansecmeli.dart';
import '/omunotexam/res/customColors.dart';
import '/omunotexam/widgets/parameterWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '/omunotexam/category.dart';

class Quiz extends StatefulWidget {
  final String soruname;
  final String yil;
  final Map<String, Map<String, Map<String, Map<String, String>>>> sinif;

  const Quiz({
    required this.soruname,
    required this.yil,
    required this.sinif,

    //  @required this.sorulistesi,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late PageController soruindex;
  late TextEditingController filterQuestionController;
  late FocusNode focusNode;
  int toplamsorusayisi = 0;
  
  String sayac = "";
 
  late String text;
  int cozulen = 1;
  int cozulmus = 0;
  int indexiki = 0;
  List<Map> items = [];
  List<Question> gosterilecekSorular = [];
  late String soruoneki;
  List<Widget> widgetlist = [];
  Set<String> sorutamlist = {};
  bool visibility = true;
  int sayisalciyimben = 0;
  late QuestionList questionList;
  String hinttext = "Bir kelime girerek soru arayın";
  List<String> offers = ["Doğrularım","Yanlışlarım",((DateTime.now().year-1).toString() + "/"+DateTime.now().year.toString()),((DateTime.now().year-2).toString() + "/"+(DateTime.now().year-1).toString()) ];

  @override
  void initState() {
    setbool(widget.soruname.toString(), true);
    Category.second = 40;
    soruindex = PageController();
    filterQuestionController = TextEditingController();
    focusNode = FocusNode();
    questionList = QuestionList(database: widget.sinif[widget.soruname]!);
    gosterilecekSorular = questionList.butunSorulariGetir();
    gosterilecekSorular.shuffle();
    toplamsorusayisi = questionList.hesaplaSoruSayisi();

    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// void goFullScreen() {
//   document.documentElement!.requestFullscreen();
// }

  Future<void> setbool(String name, bool a) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(name, a).then((bool success) {
      return debugPrint(" sorualani bool yazıldı");
    });
  }

  void soruFunction(int puan, bool sonuc) {
    
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (sonuc) {
        nextPage();
      } else {
        nextPage();
      }

    });
  }

  List<Question> filteritems = [];
  int filterIndex = 0;
  int toplamfilter = 0;
  String oldString = "";

  void sort() {
    focusNode.unfocus();

    if (filterQuestionController.text.isEmpty &&
        filterQuestionController.text == "") {
      goPage(0);

      setState(() {
        toplamfilter = 0;
        filteritems = [];
      });
      return;
    }

    if (oldString == filterQuestionController.text) {
      return;
    } else {
      oldString = filterQuestionController.text;
    }


      cozulen = 1;
      questionList.getFilters(filterQuestionController.text).then((value) {
      
      setState(() {
          filteritems=[];
          filteritems =  questionList.siralamayiGuncelle(value);
         
          toplamfilter = questionList.toplamSoruSayisi();
    goPage(0);

      });
      print("kurt");

      });
      print("meesan");
  

  }
  bool searchBool =false;
  @override
  void dispose() {
    //   ////debugPrint("dispose");
    soruindex.dispose();
    focusNode.dispose();
    filterQuestionController.dispose();
   
    setbool(widget.soruname, false);
    super.dispose();
  }

  PreferredSize? searchWidget(bool searchBool) {
      return searchBool ? PreferredSize(
            preferredSize: const Size.fromHeight(60.0) ,
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: CustomColors.black),
                  decoration: InputDecoration(
                       border: InputBorder.none,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      hintText: hinttext),
                  textAlign: TextAlign.center,
                  controller: filterQuestionController,
                  focusNode: focusNode,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () => sort(),
                ),
                Container(
                  color:  CustomColors.background ,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    const   Text("     Üstüne Bas:"),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                             for (var i in offers) ...[  Padding(padding: const EdgeInsets.only(top: 8,bottom: 8,left: 5), child: InkWell( splashColor: Colors.transparent, onTap: (){filterQuestionController.text=i;sort();},child: Container( padding: const EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2), decoration: BoxDecoration(color: CustomColors.parameter, borderRadius: BorderRadius.circular(20)), alignment: Alignment.center, child: Text("# "+i,style: const TextStyle(color: Colors.white),),)),)
,
                        ],
                          ],
                        ),
                      ),
                    ),
                    ],
                   
                  ),
                )
              ],
            ),
          )
                   : null;
                   
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom:  searchWidget(searchBool),
          actions: [IconButton(onPressed: (){ setState(() {
           if(searchBool) {searchBool = false;} else {searchBool =true; }}
           ); }, icon: const Icon(Icons.search))],
          title: Text(
            "omunot-exam  | " + widget.soruname.toString(),
            style: const TextStyle(color: CustomColors.grey),
          ),
        ),
        body: Stack(
          children: [
            gosterilecekSorular.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      //valueColor: Colors.black,
                    ),
                  )
                : PageView.builder(
                    padEnds: true,
                    // scrollBehavior: MyCustomScrollBehavior(),
                    physics: const BouncingScrollPhysics(),
                    allowImplicitScrolling: true,
                    onPageChanged: (index) => {changed(index)},
                    scrollDirection: Axis.horizontal,
                    controller: soruindex,
                    itemCount: filteritems.isNotEmpty
                        ? filteritems.length
                        : gosterilecekSorular.length,
                    itemBuilder: (BuildContext context, int index) {
                      return gosterilecekSorular.isEmpty
                          ? const Text(
                              "Burada Hiç Soru Yok, Yanlışlarına Bakmayı Deneyebilirsin")
                          : CoktanSecmeli(
                                GlobalKey(),

                              sanalKey: 5,
                              item: filteritems.isNotEmpty
                                  ? filteritems[index]
                                  : gosterilecekSorular[index],
                              function: soruFunction,

                              //      function: nextPage(),
                            );
                    },
                  ),
            SizedBox(
              child: Row(
                children: [
                  // parameterWidget(("Doğru: " +
                  //     Category
                  //         .sonucdatabase[widget.yil]![widget.soruname]!["dogru"]
                  //         .toString())),
                  // parameterWidget(("Yanlış: " +
                  //     Category.sonucdatabase[widget.yil]![widget.soruname]![
                  //             "yanlis"]
                  //         .toString())),
                  const Expanded(
                    child: Text(""),
                  ),
    
               
                  InkWell(
                     onTap: ()async {
                       {
                  
                      final map =   await Navigator.push<Question>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tumspotlar(
                                items: filteritems.isNotEmpty
                        ? filteritems
                        : gosterilecekSorular,
                              )),
                    );
           
                     if (map!=null){
                goPage((filteritems.isNotEmpty
                        ? filteritems
                        : gosterilecekSorular).indexOf(map)) ;
                cozulen=(filteritems.isNotEmpty
                        ? filteritems
                        : gosterilecekSorular).indexOf(map);
                      
                     }  
                       }
                     },
                    child: parameterWidget(
                      ("$cozulen" "/" +
                          //   sorunumarasi.length.toString(),
                          (filteritems.isEmpty
                              ? toplamsorusayisi.toString()
                              : toplamfilter.toString())),
                      icon: const Icon(
                          IconData(57565, fontFamily: 'MaterialIcons'),
                          color: Colors.white70),
                    ),
                  ),
             
                ],
              ),
            ),
        
          ],
        ),
     
        );
  
  }

  void nextPage() {
    if (soruindex.page != gosterilecekSorular.length) {
      soruindex.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutExpo,
      );
    }
  }


  void goPage(int x) {
    soruindex.animateToPage(
      x,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
    setState(() {
      
    });
  }

  bool birakildi = false;
  void changed(index) {
//    ////debugPrint("index :" + index.toString());
    cozulen = index + 1;
    setState(() {});
    cozulmus =
        Category.sonucdatabase[widget.yil]![widget.soruname]!["cozulmus"];

    if (indexiki <= index) {
      //  ////debugPrint("ileri");
      indexiki = index;
   
      if (birakildi) {
      
        birakildi = false;
      }
    } else {
      //   ////debugPrint("geri");

      setState(() {
  
      });
      birakildi = true;
    }
  }
}
