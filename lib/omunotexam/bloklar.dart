import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Sorualani.dart';
import 'res/customColors.dart';

class CategoryPage extends StatefulWidget {

  final String yilismi;
  final Map<String, Map<String, Map<String, Map<String, String>>>> blokisimleri;

   const CategoryPage({Key? key, 
    required this.yilismi,
    required this.blokisimleri,


    //  @required this.sorulistesi,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  
 
  

  @override
  void initState() {
    //print("Category page e girildi");
    setbool(true);
    simdinapcaz();
    super.initState();
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setbool(bool a) async {
    final SharedPreferences prefs = await _prefs;
    // MaterialPageRoute(builder: (context) => Quiz(soruname: widget.blokisimleri[0].entries.elementAt(z).key, sinif: widget.blokisimleri[0],));

    setState(() {
      prefs.setBool(widget.yilismi, a).then((bool success) {
        return null;
      });
    });
  }
  
  Future<void> simdinapcaz() async {
    var k = 0;
    // print("sisamda");
    while (k < widget.blokisimleri.entries.length) {
      var buyilinki = widget.blokisimleri.entries.elementAt(k);
         getbool(buyilinki.key,k);
      k++;
    }
  }

  Future<void> getbool(String name,index) async {
    final SharedPreferences prefs = await _prefs;
    bool k = prefs.getBool(name) ?? false;

    if (k) {
    //  print("girildi materiarl");
      pushscreen(index);
    }
  }
  void pushscreen(int index){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>   Quiz( 
                                   yil: widget.yilismi,
                                   sinif: widget.blokisimleri,
                                   soruname: widget.blokisimleri.entries.elementAt(index).key,
                  )
                   
                  
                                       
                  )); 
        // Navigator.push(
          // context,
          // MaterialPageRoute(
          //     builder: (context) => GenelGridWidget())
              
          //         ); 
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.googleBackground,
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
                        //  print(buyilinki.entries.elementAt(index).key);
                        //   debugPrint(widget.yilismi.toString());
                        //   debugPrint(buyilinki.entries.elementAt(index).key.toString());
                        //  debugPrint(buyilinki.toString());
                         pushscreen(index);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(

                          //       builder: (context) => Quiz(
                          //            yil: widget.yilismi,
                          //             soruname: buyilinki.entries
                          //                 .elementAt(index)
                          //                 .key,
                          //             sinif: buyilinki,

                          //           )),
                          // );

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
                          buyilinki.entries.elementAt(index).key,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold,color:  CustomColors.atention,),
                          textAlign: TextAlign.center,
                        ),
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
