

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/omunotexam/res/customColors.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../popup.dart';
import '../category.dart';

class SpotSenderPage extends StatefulWidget {

  final String soruoneki;
  final int length;
  final double icen;
  
   const SpotSenderPage(Key key,{
    
    required this.soruoneki,
    required this.length,
    required this.icen,
  }):super(key: key);

  @override
  _SpotSenderPageState createState() => _SpotSenderPageState();
}

class _SpotSenderPageState extends State<SpotSenderPage> {
  late PageController soruindexiki;
  late ScrollController controller;
  List<TextEditingController> textcontrollers = [];
  List<FocusNode> focusNodes = [];

  double icgenislik = 100;
late TextEditingController dersadi = TextEditingController();
  List<Widget> tumlist = [];
  List<Color> colorlist = [
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
    Colors.white38,
  ];
  List<String> falses = [];
  List<String> isaretlenenDogruSiklarListesi = [];
  List<String> trues = [];
  List<String> cevaplar = [
    "I",
    "II",
    "III",
    "IV",
    "V",
    "VI",
    "VII",
    "VIII",
    "IX",
    "X"
  ];
  //List<String> cevaplar = [
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  //   "•",
  // ];
  List<String> answerlist = [];
  List<String> cevaplistesi = [
    ""
    "Tam Kan - Tam idrar ",
    "AST, ALT, GGT, Alkalen Fosfataz",
    "Billirubin, Albumin ",
    "HBsAg, anti-HBs, Anti-HBc total, Anti-HCV",
    "Serum seruloplazmin, ",
    "idrar ve serum bakır",
    "Serum demir, SDBK, Ferritin",
    "Alfa-1 Antitripsin",
    "Karaciğer biopsisi",
    "Alfa fetoprotein",
    "USG",

  ];
  Set verilencevap = {};
  int toplamdogrusiksayisi = 5;
  late Set<int> toplamisaretlenensiksayisi = {};
  String sikkle = "+ Şık Ekle";
  @override
  void initState() {
    soruindexiki = PageController();
    controller = ScrollController();
    textcontrollers.add(TextEditingController());
    focusNodes.add(FocusNode());
    init();
    sonsikadd();
    sikadd();
    super.initState();
  }
   XFile? xFile;
  Widget bosluk = const SizedBox(height: 8);
  bool secilisik = true;
  double fontsize = 18;
  List<Widget> sikalarlar = [];
  String filePath="";


  void sikadd() {
     int _x = textcontrollers.length;
      //debugPrint("bu");
      textcontrollers.add(TextEditingController());
      focusNodes.add(FocusNode());
      //debugPrint("bu");

      Widget anasru = ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          color: colorlist[0],
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                constraints: const BoxConstraints(minHeight: 50),
                child: Row(
                  children: [
                    Text(
                      "   " + cevaplar[_x - 1],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fontsize),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: widget.icen - 60,
                      child: TextField(
                        decoration:     InputDecoration(        
              focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                   ),
                            hintText: "Örn :" + cevaplistesi[_x]),
                        cursorColor: Colors.black,
                        controller: textcontrollers[_x],
                        focusNode: focusNodes[_x],
                        textAlign: TextAlign.center,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,

                        style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 18,
                          inherit: true,
                        ),
                        //maxLines: 3,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      //debugPrint("bu");

      setState(() {
      sikalarlar.removeLast();

        sikalarlar.add(anasru);
        sikalarlar.add(bosluk);
      });
          if (_x != 10) {
             sonsikadd();
    } 
   if(focusNodes.length==2){
focusNodes.first.requestFocus();
   } else {focusNodes.last.requestFocus();}
    
  }

  void sonsikadd() {
    Widget sonsik = ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.white24,
        child: InkWell(
          onTap: () {
            sikadd();
          },
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              constraints: const BoxConstraints(minHeight: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sikkle,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 18,
                      inherit: true,
                    ),
                    softWrap: true,
                    //maxLines: 3,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    sikalarlar.add(sonsik);
  }
  String image="";

  @override
  void dispose() {
    controller.dispose();
    dersadi.dispose();
    for (int x = 0; x < textcontrollers.length; x++) {
      textcontrollers[x].dispose();
      focusNodes[x].dispose();
    }
    super.dispose();
  }
  Future<String>getImage() async {
      String uint8list = await FirebaseStorage.instance.ref(filePath).getDownloadURL();   
      return uint8list;

  }

  late DatabaseReference _messagesRef;

  Future<void> init() async {
    final database = FirebaseDatabase.instance;

    _messagesRef = database.ref('spotdatabase/$uid/' + widget.soruoneki);

  }

  @override
  Widget build(BuildContext context) {
    var icyukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseNavy,
        title: const Text("", style: TextStyle(color: CustomColors.firebaseAmber)),
      ),
      body: Stack(
        children: [
       
          
          
          SizedBox(
              // color: Colors.red,
              height: icyukseklik,

              //color: Colors.green,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  const  SizedBox(height: 50,)
                     ,      uid=="UtjM7xdAfuUmu3wvvD5jAGVsSq42"? 
                     Row(  mainAxisAlignment: MainAxisAlignment.center,

         children  :   
          image !=""?
          
          //TO DO bu storage web configuresidir bunu daha sonra mobil uygulama yap
            [ 
               Expanded(
                 
              child: 

            
              Image.network(
              image.toString()
            
              , 
             
              loadingBuilder:(context, child, loadingProgress) => const LinearProgressIndicator(),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                return const Text("Frame builder");
              },
              errorBuilder: (context, error, stackTrace) {
               return  Text(error.toString() + " stack "+  stackTrace.toString(), textAlign: TextAlign.center,) ;
              },

              )
            
            
            
            ) ]
            
          : 

        [
          InkWell   (
            child: const Icon(IconData(0xee39, fontFamily: 'MaterialIcons'), color: Colors.black, size: 40,  )

        ,   onTap: () async{
            
              xFile= await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
              if (xFile ==null) return ;
              final finalPath =     FirebaseStorage.instance.ref('spotdatabase/$uid/' + widget.soruoneki).child(DateTime.now().millisecondsSinceEpoch.toString()+".jpg");
              await finalPath.putData(await xFile!.readAsBytes());
              filePath=finalPath.fullPath;
              
              var mmm= await getImage();
                setState(() {
                                             
image=mmm;
debugPrint(image);
                }); 
           }
             ),
           ]  
            )
            :const SizedBox(),
        
                  SizedBox(height: 65,
                  
                  child:     TextField(
                            decoration: const InputDecoration(
                                          
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                   ),
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hoverColor: Colors.black,
                              hintStyle: TextStyle(color: Colors.black38),
                              hintText:
                                  "(Slayt ismi)Örn: 2.3 Kronik karaciğer",
                              hintMaxLines: 3,
                            ),

                            cursorColor: Colors.white,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            controller: dersadi,
                            style: TextStyle(
                              color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                            textAlign: TextAlign.center,
                          ),
            
              
                  )
                  
                  ,
                   ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: Colors.white38,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: 70.0,
                          minWidth: widget.icen,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 10, right: 10),
                          child: TextField(
                            decoration: const InputDecoration(
                                          
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                   ),
                              hintText:
                                  "Örn :Kronik Hepatit Düşünüldüğünde Yapılacak Tetkikler",
                              hintMaxLines: 3,
                            ),
                            cursorColor: Colors.black,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            controller: textcontrollers[0],
                            focusNode: focusNodes[0],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    //   color: Colors.blueGrey,
                    width: widget.icen,

                    child: Column(children: sikalarlar),
                  ),
                  const SizedBox(height: 65),
                ]),
              )),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: icyukseklik,
              ),
              InkWell(
                  onTap: () {
                    sendSpot();
                    sifirla();
                    Popup.createAlertDialog(context,
                        baslik: "Spot Eklendi",
                        aciklama:
                            "Spot soru online veri tabanına kaydedildi. Tekrar sayısıyla ters orantılı sırada spotlar sayfasında görebilirsin",id:null);
                        
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
                                  "GÖNDER",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 25),
                                )))),
                  )),
            ],
          ) //        Expanded(child: Container()),
          // ElevatedButton(
          //     onPressed: () {

          //     },
          //     child: Container(height: icen * 1 / 10)),
        ],
      ),
    );
  }

  sendSpot() {
    for(var i in focusNodes){
i.unfocus();
    }
    Map gonderilecek = {};
    gonderilecek.addAll({"Q": textcontrollers[0].text});
     dersadi.text.isNotEmpty? gonderilecek.addAll({"dersadi":dersadi.text}):null;
    Set n = {};
    int a = 1;
    while (a < textcontrollers.length) {
      if (textcontrollers.isNotEmpty ) {
           if(textcontrollers[a].text.isNotEmpty && textcontrollers[a].text!=""){
             gonderilecek.addAll({(a - 1).toString(): textcontrollers[a].text});
             n.add(a - 1);
           }  
      }
      a++;
    }
    int b = 1;

    String s = n.elementAt(0).toString();
    while (b < n.length) {
      s = s+"," + n.elementAt(b).toString();
      b++;
    }

    gonderilecek.addAll({"N": s,});
  if(filePath!=""){
    gonderilecek.addAll({"img":filePath});
    setState(() {
      filePath="";
    });
  }  
    

    _messagesRef
        .update({DateTime.now().microsecondsSinceEpoch.toString():gonderilecek})
       ;}

  void sifirla() {
    // TODO: Burayı kontrol etmeden deploy etme:
    textcontrollers[0].text = "";
    textcontrollers = [textcontrollers[0]];
    sikalarlar = [];
    sonsikadd();
    sikadd();
  }

  void previousPage() {
    soruindexiki.animateToPage(
      soruindexiki.page!.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
    );
  }
}
