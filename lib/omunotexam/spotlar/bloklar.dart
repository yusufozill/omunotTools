import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sorualani.dart';

class CategorySpotPage extends StatefulWidget {
  //   const CategorySpotPage({Key? key, required User user})
  //     : _user = user,
  //       super(key: key);

  // final User _user;
  final String yilismi;
  final Map<String, Map<String, Map<String, Map<String, String>>>> blokisimleri;

    const CategorySpotPage({Key? key, 
    required this.yilismi,
    required this.blokisimleri,

    //  @required this.sorulistesi,
  }) : super(key: key);

  @override
  _CategorySpotPageState createState() => _CategorySpotPageState();
}

class _CategorySpotPageState extends State<CategorySpotPage> {

 
  

  @override
  void initState() {
    
    getnavigate();
    super.initState();
  }
   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   Future<void> disposer() async{
        final SharedPreferences prefs = await _prefs;
       prefs.remove("spotbaslik");

  }

  Future<void> getnavigate()async{
        final SharedPreferences prefs = await _prefs;
        int?  a= prefs.getInt("whichblok");
        return a!=null ? pushscreen(a):null;

     
  }
    Future<void> setnavigate(int a)async{
        final SharedPreferences prefs = await _prefs;
        prefs.setInt("whichblok",a);

        return;
     
  }

  void pushscreen(int index){
        setnavigate(index);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuizSpot(
                                const  Key("Quizspot"),
                                   yil: widget.yilismi,
                                   sinif: widget.blokisimleri,
                                   soruname: widget.blokisimleri.entries.elementAt(index).key,
                  ))); 
  }

  @override
  void dispose() {
    disposer();        
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.yilismi),
        
      ),
      body: Center(
        child: PageView.builder(
          itemCount: widget.blokisimleri.length,
          itemBuilder: (context, index) {
            Map<String, Map<String, Map<String, Map<String, String>>>>
                buyilinki = widget.blokisimleri;

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2),
                itemCount: buyilinki.entries.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          //print(buyilinki.entries.elementAt(index).key);
                          pushscreen(index);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => QuizSpot(
                          //             yil: widget.yilismi,
                          //             soruname: buyilinki.entries.elementAt(index).key,
                          //             sinif: buyilinki,
                          //           )),
                          // );

                          // Quiz(sorulistesi: buyilinki.entries.elementAt(index).key,);
                        });
                      },
                      child: Container(
                        width: 220,
                        height: 220,
                        child: Text(
                          buyilinki.entries.elementAt(index).key,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.black12,
                        alignment: Alignment.center,
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
