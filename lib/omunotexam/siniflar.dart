import 'package:flutter/material.dart';
import '/omunotexam/data/database.dart';
import 'bloklar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'res/customColors.dart';

class Siniflar extends StatefulWidget {
  const Siniflar({Key? key}) : super(key: key);


  //   const Siniflar({Key? key, required User user})
  //     : _user = user,
  //       super(key: key);

  // final User _user;
  @override
  _SiniflarState createState() => _SiniflarState();
}

class _SiniflarState extends State<Siniflar> {
  Map<String, Map<String, Map<String, Map<String, Map<String, String>>>>>
      siniflar = Sorular.database;

  @override
  void initState() {
    //debugPrint("siniflar.dart , Siniflar() opened, Here is init state");
     setbool(true);
     simdinapcaz();
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setbool(bool a) async {
    final SharedPreferences prefs = await _prefs;
     

    setState(() {
       prefs.setBool("Siniflar", a).then((bool success) {
        return debugPrint("Siniflar : $a , Prefs sended");
      });
       
    });
  }

  Future<void> simdinapcaz() async {
    var k = 0;
    // //debugPrint("sisamda");
    while (k < siniflar.entries.length) {
      var buyilinki = siniflar.entries.elementAt(k);


  
         getbool(buyilinki.key,k);

     

      k++;
    }
  }

  Future<void> getbool(String name,index) async {
    final SharedPreferences prefs = await _prefs;
    bool k = prefs.getBool(name) ?? false;

    if (k) {
      pushscreen(index);
    }
  }
  void pushscreen(int index){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryPage(
              
                    blokisimleri: siniflar.entries.elementAt(index).value,
                  
                                        yilismi: siniflar.entries.elementAt(index).key,
                  ))); 
  }
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
        body: Center(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2),
                itemCount: siniflar.entries.length,
                itemBuilder: (BuildContext ctx, index) {
                    String sinifismi = siniflar.entries.elementAt(index).key;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          //debugPrint(sinifismi);

                        pushscreen(index);

                          // Quiz(sorulistesi: buyilinki.entries.elementAt(index).key,);
                        });
                      },
                      child: Container(
                        decoration:BoxDecoration(
                        color:  CustomColors.white,
                        borderRadius: BorderRadius.circular(15),

                        ) ,
                        width: 220,
                        height: 220,
                        child: Text(
                          sinifismi+ ". Sınıf",
                          style: const TextStyle(
                            color: CustomColors.atention,
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                })));
  }
}
