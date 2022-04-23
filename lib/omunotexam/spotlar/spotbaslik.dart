import 'package:flutter/material.dart';
import '/omunotexam/data/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloklar.dart';




class SiniflarSpot extends StatefulWidget {
  const SiniflarSpot({Key? key}) : super(key: key);
  @override
  _SiniflarSpotState createState() => _SiniflarSpotState();
}

class _SiniflarSpotState extends State<SiniflarSpot> {
  Map<String, Map<String, Map<String, Map<String, Map<String, String>>>>>
      siniflar = Sorular.spotdatabase;

  @override
  void initState() {

    //print("Sinif page e girildi");
     //setbool(true);
     simdinapcaz();
    super.initState();
  }

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setbool(int b) async {
     final SharedPreferences prefs = await _prefs;
       prefs.setInt("spotbaslik", b);
  }
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> simdinapcaz() async {
    final SharedPreferences prefs = await _prefs;
    var gidilecekekran =  prefs.getInt("spotbaslik"); 
    return gidilecekekran!=null ? pushscreen(gidilecekekran) : null;
  }


  void pushscreen(int index){
        setbool(index);
          Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategorySpotPage(
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
    return Scaffold(
       
        appBar: AppBar(
          centerTitle: true,
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
                          pushscreen(index);
  });
                      },
                      child: Container(
                        width: 220,
                        height: 220,
                        child: Text(
                          sinifismi+ ". Sınıf",
                          style: const TextStyle(
                            color: Colors.white,
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.black12,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                })));
  }
}
