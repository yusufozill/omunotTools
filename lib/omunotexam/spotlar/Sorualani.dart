import '../res/customColors.dart';
import 'package:firebase_database/firebase_database.dart';
import '../spotlar/spotsender.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../category.dart';
import '../spotlar/soru.dart';
import '../spotlar/tumspotlar.dart';
import '../widgets/parameterWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class QuizSpot extends StatefulWidget {

  
  final String soruname;
  final String yil;
  final Map<String, Map<String, Map<String, Map<String, String>>>> sinif;

    const QuizSpot(
      Key key,
      {
    required this.soruname,
    required this.yil,
    required this.sinif,

    //  @required this.sorulistesi,
  }):super(key: key);

  @override
  _QuizSpotState createState() => _QuizSpotState();
}

class _QuizSpotState extends State<QuizSpot> {
List<Map> items=[];

  late PageController soruindex;
  bool sonucGoster = false;
  var sorusayisi = 5;
  var toplamsorusayisi = 0;
  Duration sure = const Duration(minutes: 50);
  late int time = 40;
  String sayac = "";
  late Timer _timertwo;
  bool   disposed = true;

  int cozulmus = 0;


  late String soruoneki;
  List<Widget> widgetlist = [];
  
  late DatabaseReference _messagesRef;
  late StreamSubscription<DatabaseEvent> _messagesSubscription;
  

 




  Future<void> init(String xxx) async {


  //  debugPrint("dur yüreğim dağılsın 1 ");
    final database = FirebaseDatabase.instance;
    _messagesRef = database.ref('spotdatabase/$uid/'+xxx);

     // debugPrint("dur yüreğim dağılsın $boolk ");
 

    database.setLoggingEnabled(false);

      
       final messagesQuery = _messagesRef;
    _messagesSubscription = messagesQuery.onChildAdded.listen(
      (DatabaseEvent event) {
      //  //debugPrint('Child added: ${event.snapshot.children.first.value}');
          
          Map newMap={};
         for(int x=0;x<event.snapshot.children.length;x++){
             newMap.addAll({event.snapshot.children.elementAt(x).key:event.snapshot.children.elementAt(x).value});
             
         }
         setState(() {
           newMap.addAll({"key":event.snapshot.key});
          items.add(newMap);

         });
    sort();


      },
      onError: (Object o) {
      //  final error = o as FirebaseException;
        //debugPrint('Error: ${error.code} ${error.message}');
      },
    );


  }



  
/// Desired relation | Result
/// -------------------------------------------
///           a < b  | Returns a negative value.
///           a == b | Returns 0.
///           a > b  | Returns a positive value.
///
void sort()
{
  int mySortComparison(Map a, Map b) {
  final propertyA = a["tx"] ?? 0  ;
  final propertyB =b["tx"] ?? 0 ;
  if (propertyA < propertyB) {
    return -1;
  } else if (propertyA > propertyB) {
    return 1;
  } else {
    return 0;
  }
}
 setState(() {
items.sort(mySortComparison);
   
 });}



  @override
  void initState() {
    super.initState();
    
    
   focusNode =FocusNode();
  filterQuestionController=TextEditingController();
    //debugPrint(uid);
    Category.second = 40;
    soruindex = PageController();
    soruoneki = widget.yil +
        "s" +
        widget.soruname.toString()[0] +
        widget.soruname.toString()[1] +
        widget.soruname.toString()[2];
   try {

     init(soruoneki);
     
   } catch (e) {
       debugPrint("object");

   }
       debugPrint("sorualani yükleniyor");
   
    //debugPrint("itemsleg: "+items.length.toString());

    soruracesayac();
  }


  var k = 0;
  int length=0;
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   Future<void> disposer() async{
        final SharedPreferences prefs = await _prefs;
       prefs.remove("whichblok");

  }

 List<Map> filteritems = [];
  int toplamfilter = 0;
  String oldString="";
 late FocusNode focusNode;
 late TextEditingController filterQuestionController;

  void sorting() {
    focusNode.unfocus();
 
    if (oldString == filterQuestionController.text){
      return;
    }else {
      oldString = filterQuestionController.text;
    }



    int mySortComparison(Map a, Map b) {
      
      bool sortCase( Map map) =>  map.values .toString().toLowerCase().contains(filterQuestionController.text.toLowerCase());
    
         
      

      if (sortCase(a) && sortCase(b)) {

        return 0;
      } else if (sortCase(a) && !sortCase(b)) {
        return -1;
      } else {
        return 1;
      }
    }

    setState(() {
      items.sort(mySortComparison);
      
    });
    
     goPage(0);
  }

  @override
  void dispose() {
    //   ////debugPrint("dispose");
    disposed = false;
    soruindex.dispose();
    focusNode.dispose();
    TextEditingController().dispose();
    
    try{
    _messagesSubscription.cancel();
    } catch (e){
      debugPrint(e.toString());
    }
    _timertwo.cancel();
      disposer();        

      

    Category.second = 40;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
       debugPrint("sorualani builder ");

    var icen = MediaQuery.of(context).size.width;
    var icyukseklik = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
             bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: TextField(
                            cursorColor: Colors.white,
             style: const TextStyle(color: CustomColors.firebaseYellow),
            decoration: const InputDecoration(
               
    
                    
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                   ),  
                hintText: "Bir kelime girerek soru arayın"),
            textAlign: TextAlign.center,
            controller: filterQuestionController,
            focusNode: focusNode,
            keyboardType: TextInputType.text,
            onEditingComplete: () => sorting(),
          ),
        ),
   
        title: Text(
          "omunot-exam  | " + widget.soruname.toString(),
          style: const TextStyle(color: CustomColors.firebaseAmber),
        ),
      ),
      body: Stack(
        children: [
          items.isNotEmpty 
              ? 
            
                   PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    allowImplicitScrolling: true,
                    onPageChanged: (index) => {
                      if(disposed)
                    { changed(index)}
                      },
                    scrollDirection: Axis.horizontal,
                    controller: soruindex,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                       return SpotSoru(
                                    key: Key(soruoneki.toString()+index.toString()),
                                    tx:items[index]["tx"],
                                    event:items[index],
                                    index: index,
                                    icen: icen,
                                    soruoneki: soruoneki,
                                    
                                  );
                    
              
                    },
                  )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Column(
                    children: [
                      
                      SizedBox(
                        width: icen*3/4,
                        child: const Text("Burada sadece senin oluşturduğun spot notlar görünür ve görünüşe 'Hiç' spot yok, Hemen spot göndermeye başlamak için aşağıdan soru ekleye bas ",

                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        
                      ),
                      const SizedBox(height: 40,),
                       SizedBox(
                        width: icen*3/4,
                        child: const Text("Eğer soru göndermene rağmen bunu görüyorsan, uygulamayı kapat, internetini kontrol et ve uygulamayı tekrar aç ",

                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 9),
                        ),
                        
                      ),
                    ],
                  )),
                ],
              ),
          SizedBox(
            height: icyukseklik * 1 / 10,
            child: Row(
              children: [
                parameterWidget(Category.second.toString(), icon: Icon(const IconData(57400, fontFamily: 'MaterialIcons'),
                            color:_timertwo.isActive ? incorrect:Colors.white),)
             ,  parameterWidget(                        (cozulmus+1).toString() +"/"+ items.length.toString(),
)
              ],
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: icyukseklik,
              ),
              InkWell(
                  onTap: () {
                    _timertwo.cancel();
                                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpotSenderPage( const Key("Spotsenderpage"),
                                length: length,
                                soruoneki: soruoneki,
                                icen: icen,
                              )),
                    );
           
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            color: CustomColors.firebaseYellow,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "Soru Ekle",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                )))),
                  )),
               InkWell(
                  onTap: () async {
                    _timertwo.cancel();
                            final map =   await Navigator.push<Map>(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tumspotlar(
                                items:items,
                              )),
                    );
           
                     if (map!=null){
                goPage(items.indexOf(map)) ;
                cozulmus=items.indexOf(map);
                      
                     }  
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            color: CustomColors.firebaseYellow,
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "Tüm Spotlarım",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                )))),
                  )),
            
             ],
          ) 
       
        ],
      ),
    );
  }
 void goPage(int x){

    soruindex.animateToPage(
     x,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
 }
  void nextPage() {
  
 soruindex.animateToPage(
      soruindex.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );

 
 if (! _timertwo.isActive){
       soruracesayac();
   }
   
  }


  void previousPage() {
    soruindex.animateToPage(
      soruindex.page!.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }

  bool birakildi = false;

  
  void soruracesayac() {
   //    ////debugPrint("soruracesayac başlar");
   
    const twoSec = Duration(seconds: 1);
    _timertwo = Timer.periodic(
      twoSec,
      (Timer timer) {
        //////debugPrint(timer.);
        // if ( time== 0) {
        //   setState(() {
        //     soruracesayac();
        //   });
        // } else {
        setState(() {
          Category.second--;
          if(items.isEmpty ) {_timertwo.cancel();} 
          
          if (Category.second == 0) {
          if(items.isNotEmpty )  

           { Category.second = 40;
            nextPage();} else {_timertwo.cancel();}
          }
        });
        // }
      },
    );
    debugPrint("soruracesayac biter");
  }
changed(index){
  if(cozulmus<index && disposed){
    setState(() {

            
            Category.second = 40;
  });

  }
  if (! _timertwo.isActive  && disposed){
       soruracesayac();
   }
   if(cozulmus>index && disposed){
     setState(() {
     _timertwo.cancel();
       
     });
   }
   cozulmus=index;
}

}
