
import '/omunotexam/res/customColors.dart';
import 'package:flutter/material.dart';

import '../DataTypes/patientFiles.dart';

class PatientChips extends StatefulWidget {
  PageController pageController;
  PatientFiles file;
  bool focus;
  MapEntry<String, Map> tileEvent;
  Function(String, String) setstate;

  PatientChips(
      {Key? key,
      required this.tileEvent,
      required this.file,
      required this.pageController,
      required this.focus,
      required this.setstate})
      : super(key: key);

  @override
  _PatientChipsState createState() => _PatientChipsState();
}

class _PatientChipsState extends State<PatientChips> {
  FocusNode focusNode = FocusNode();
  PageController messageController = PageController();
//  Map<String,TextEditingController> controller = {};
  List<bool> wrap = [];
  String offerfocus ="";

  get todowrite => null;

  @override
  initState() {
    // focusNode.addListener(() {
    //   setState(() {
    //     PatientFiles.todowrite[widget.tileEvent.value["label"]]= controller.text;
    //     print(
    //         "ben degistim : ${widget.tileEvent.value["label"]} : ${controller.text}");
    //   });
    // });
    // Set a = (widget.tileEvent.value["offersQ"] ?? {});

    // if (a != {}) {
    //   _timer = new Timer.periodic(const Duration(seconds: 3), (timer) {
    //     if ((messageController.page! + 1) == a.length) {
    //       messageController.animateToPage(0,
    //           duration: const Duration(milliseconds: 200),
    //           curve: Curves.linearToEaseOut);
    //     } else {
    //       messageController.nextPage(
    //           duration: const Duration(milliseconds: 200),
    //           curve: Curves.linearToEaseOut);
    //     }
    //   });
    // }

    super.initState();
  }

  @override
  dispose() {
//PatientFiles.todowrite.addAll({widget.tileEvent.value["label"]: controller.text});
  // for (var i in controller.values){
  //   i.dispose();
  // }
     focusNode.unfocus();
     messageController.dispose();
    // focusNode.dispose();
    // controller.dispose();
    super.dispose();
  }

  TextInputType switcher(String key) {
    switch (key) {
      case "String":
        {
          return TextInputType.text;
        }
      case "Text":
        {
          return TextInputType.multiline;
        }
      case "int":
        {
          return TextInputType.number;
        }
      case "Name":
        {
          return TextInputType.name;
        }
      case "DateTime":
        {
          return TextInputType.datetime;
        }
      case "Phone":
        {
          return TextInputType.phone;
        }
      case "Adress":
        {
          return TextInputType.streetAddress;
        }
      //case "ButtonText" : {return TextInputType.}
      //case "ButtonInt"  : {return TextInputType.}
      default:
        {
          return TextInputType.text;
        }
    }
  }

  List<Widget> offersList(bool focus) {
    
    var h =   { 
        "Vitaller": {
     "type" : "chip",
     "offers":   {
       "Kilo Kaybı":"{{kilokaybi}}",
      "Halsizlik" :"{{halsizlik}}",
      "İştahsızlık":"{{istahsizlik}}",
      "Ateş" : "{{ates}}"}
  
    }};
    List<Widget> turnerList = [
      const Text("En sık kullanılan cevaplar"),
    ];
    if( widget.tileEvent.value["offers"].runtimeType == h.entries.first.value["offers"].runtimeType )

    {
      Map k = widget.tileEvent.value["offers"];
     // bool _c =controller.isEmpty;

      for (var item in   k.entries) {
   //  if(_c) {controller.addAll({item.value:TextEditingController()});}
      turnerList.add(
        AnimatedContainer(
          duration: const Duration(milliseconds:300 ),
          child: Card(
            child: ListTile(
              style: ListTileStyle.list,
              onTap: (){
                setState(() {
                //   if (offerfocus !="") {complete(k[offerfocus],null);} 

                  offerfocus=item.key;
                });
              },
              title: Text(item.key),
              subtitle: offerfocus !=item.key ?null: TextField(
                                  textInputAction: newlineSwitcher(
                                      widget.tileEvent.value["type"]),
                                      onChanged: (yeni){
                                        complete(item.value, yeni);

                                      },
                                      onSubmitted: (valu){
  setState(() {
                              
                                });
                                      },
                                  onEditingComplete: () {
                                setState(() {
                               
                                });
                                  //    complete(item.value,null);
                                  
                                 
                                    focusNode.unfocus();
                                  },
                                  maxLines: null,
                                  focusNode: focusNode,
                                 // controller: controller[item.value] ,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.deny(RegExp(PatientFiles
                                  //           .regEx[widget.tileEvent.value["type"]] ??
                                  //       "")),
                                  // ],
                                  decoration: InputDecoration(
                                    constraints:
                                        const BoxConstraints(maxHeight: 200),
                                    suffix: SizedBox(
                                        height: 30,
                                        child: TextButton(
                                          onPressed: () {
                                              setState(() {
                              
                                });
                                            focusNode.unfocus();
                                          },
                                          child: const Text("Tamam"),
                                        )),
                                    border: const OutlineInputBorder(),
                                    hintText: '',
                                  ),
                                  keyboardType:
                                      switcher(widget.tileEvent.value["type"])),
               trailing: Checkbox(  

              
                 value: PatientFiles.todowrite[item.value]=="bulunuyor",
                 onChanged: (value){
                  setState(() {
                   if(value??false){ PatientFiles.todowrite.addAll({item.value: "bulunuyor"});}else{ PatientFiles.todowrite.addAll({item.value: "bulunmuyor"});}
                    
                  });
              
                 },
                    
  ),         

            ),
          ),
        )
        
        );
    }}


    if (!focus || widget.tileEvent.value["offers"] == null) {
      turnerList = [];
    }
    return turnerList;
  }

  List<Widget> AnamnezList(bool focus) {
    Map k = widget.tileEvent.value["anamnez"] ?? {};
    List<Widget> _turnerList = [
      const Text(
          "Şikayeti açık uçlu sorularla, hastayı detaylı anlatmaya yönlendirerek sorgulayın. Aşağıdaki soruları kullanabilirsiniz "),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Column(
            //   padding: const EdgeInsets.symmetric(horizontal:8.0 , vertical: 2),

            children: [
              for (MapEntry item in k.entries)
                ListTile(
                  title: Text(item.key),
                  subtitle: ListView(children: [
                    for (var i in item.value) ...[Text(i.toString())]
                  ]),
                  onTap: () {},
                ),
            ],
          ))
    ];

    return _turnerList;
  }

  TextInputAction? newlineSwitcher(String parameter) {
    if (parameter == "text") {
      return TextInputAction.newline;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: Column(
                  children: [
                    Text(
                      widget.tileEvent.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 50),
                      alignment: Alignment.center,
                      //      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: PageView(
                          controller: messageController,
                          scrollDirection: Axis.vertical,
                          padEnds: false,
                          scrollBehavior: const ScrollBehavior(
                              androidOverscrollIndicator:
                                  AndroidOverscrollIndicator.glow),
                          allowImplicitScrolling: false,
                          physics: const NeverScrollableScrollPhysics(),

                          //  mainAxisSize: MainAxisSize.min,
                          //  mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            // for (var offersQuestion
                            //     in widget.tileEvent.value["offersQ"] ?? []) ...[
                            //   Center(child: Text(offersQuestion ?? "")),
                            // ]
                          ]
                          ),
                    ),
                    Row(children: const <Widget>[
                      //Expanded(flex: 2, child: Text(widget.tileEvent.key)),
                      // widget.tileEvent.value["type"] != "DateTime"
                      //     ?
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 20),
                          child:  Text(""),
                        )
                      )
                      // : SizedBox(
                      //     width: 300,
                      //     height: 80,
                      //     child: CupertinoDatePicker(
                      //       mode: CupertinoDatePickerMode.date,
                      //       dateOrder: DatePickerDateOrder.dmy,
                      //       initialDateTime: DateTime(1969, 1, 1),
                      //       onDateTimeChanged: (DateTime newDateTime) {},
                      //     ),
                      //   ),
                    ]),
                  ],
                ),
              ),
              widget.tileEvent.value["offers"] == null
                  ? const Text("")
                  : Container(
                      margin: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 10, right: 10),
                      child: SingleChildScrollView(
                          child: Column(
                        children: offersList(widget.focus),
                      )),
                    ),
              widget.tileEvent.value["anamnez"] == null
                  ? const Text("")
                  : Container(
                      margin: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 10, right: 10),
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 20, left: 10, right: 10),
                      child: SingleChildScrollView(
                          child: Column(
                        children: AnamnezList(widget.focus),
                      )),
                    )
            ]),
          );
  }

  messageChanger() {}


   complete(String item, String? yeni) {
        if ( yeni != ""){
          PatientFiles.todowrite[item]="bulunuyor";
        } else {
          PatientFiles.todowrite[item]="bulunmuyor";

        }
  //     print("girdim");
        item= item.replaceAll("}}", "_}}");
      //  print(item);
         String yazilacak = yeni ?? "";
        PatientFiles.todowrite.addAll(
                                  { item  : yazilacak}
                                   ) ;
                                 
                                   // if(controller[item]!.text == "") { PatientFiles.todowrite.remove(item.replaceAll("}}", "_}}"));}
  //   widget.file.anaYakinma[widget.tileEvent.key]!["value"] = controller.text;
   }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
