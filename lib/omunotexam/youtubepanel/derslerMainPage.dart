import 'package:googleapis/monitoring/v3.dart';

import '/omunotexam/youtubepanel/list.dart';
import '/omunotexam/youtubepanel/enumVidoList.dart';
import 'package:flutter/material.dart';

import '../res/customColors.dart';

class YoutubeMainPage extends StatefulWidget {
  const YoutubeMainPage({Key? key}) : super(key: key);

  //   const YoutubeMainPage({Key? key, required User user})
  //     : _user = user,
  //       super(key: key);

  // final User _user;
  @override
  _YoutubeMainPageState createState() => _YoutubeMainPageState();
}

class _YoutubeMainPageState extends State<YoutubeMainPage> {
   Map<String,List<String>> ll = {
    "1": ["Üreme", "Hareket"],
    "2": ["Savunma", "Biyolojik Etmenler"],
    "3": [
      "Gebelik",
      "Tümorler",
      "Sol-Dol",
      "Travma",
      "Enfeksiyon",
      "Endokrin",
      "Sindirim",
      "Yaşlanma",
      "Nöro"
    ],
    "4": ["Gis", "Endokrin", "Soldol", "Pediatri"]
  };
   

  @override
  void initState() {
    //debugPrint("siniflar.dart , Siniflar() opened, Here is init state");
    //  setbool(true);
    //  simdinapcaz();
   
    super.initState();
  }


  // Future<void> setbool(bool a) async {
  //   final SharedPreferences prefs = await _prefs;

  //   setState(() {
  //      prefs.setBool("Siniflar", a).then((bool success) {
  //       return debugPrint("Siniflar : $a , Prefs sended");
  //     });

  //   });
  // }

  // Future<void> simdinapcaz() async {
  //   var k = 0;
  //   // //debugPrint("sisamda");
  //   while (k < siniflar.entries.length) {
  //     var buyilinki = siniflar.entries.elementAt(k);

  //        getbool(buyilinki.key,k);

  //     k++;
  //   }
  // }

  // Future<void> getbool(String name,index) async {
  //   final SharedPreferences prefs = await _prefs;
  //   bool k = prefs.getBool(name) ?? false;

  //   if (k) {
  //     pushscreen(index);
  //   }
  // }
  // void pushscreen(int index){
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => CategoryPage(

  //                   blokisimleri: siniflar.entries.elementAt(index).value,

  //                                       yilismi: siniflar.entries.elementAt(index).key,
  //                 )));
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint("siniflar");
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomColors.googleBackground,
          title: const Text("omunot.com"),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColors.background,
                    CustomColors.atention,
                    
                    Color.fromARGB(255, 210, 224, 247)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                )
            ),
            child: Column(
                      mainAxisSize: MainAxisSize.min,
                              
                      children: [
                        for(var i in listeler.entries)
                      ...[Align(alignment: Alignment.centerLeft, child: 
                     
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(  (i.key)+". Sınıf", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          ),
                        ),

                    
                      GridView.builder(
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 0,
                                      crossAxisSpacing: 0,
                                      childAspectRatio: 2),
                                  itemCount:  i.value.length,
                                 // itemCount: 1,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return  Container(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        splashColor: CustomColors.softPink,
                                        focusColor: CustomColors.softPink ,
                                        hoverColor: CustomColors.softPink  ,
                                          onTap: () {
                                            setState(() {
                                              //debugPrint(sinifismi);
                                              //pushscreen(index);
                    Navigator.of(context).push(   MaterialPageRoute(
                        builder: (context) => YoutubePlayerWidget(  UniqueKey() ,i.value[index], title:(i.key)+". Sınıf "+Liste(i.value[index]).toTitle,  )
                      ),
                    );
                                              // Quiz(sorulistesi: buyilinki.entries.elementAt(index).key,);
                                            });
                                          },
                                          child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),

                                        alignment: Alignment.center,
                                            child: Text(
                                              Liste(i.value[index]).toTitle,
                                              style: const TextStyle(
                                                  color: CustomColors.atention,
                                                  
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          
                                            //alignment: Alignment.center,
                                          ),
                                        ),
                                    );
                                    
                                  }),
                      
                      ]]
                        +[
                        SizedBox(height: 30, )

      ],
                      ),
      
      
      
          ),
        )
                 
        
             );
  }
}
