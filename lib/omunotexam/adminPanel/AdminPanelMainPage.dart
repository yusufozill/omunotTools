
// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../res/customColors.dart';

class AdminPanelMainPage extends StatefulWidget {
  const AdminPanelMainPage({Key? key}) : super(key: key);

  //   const AdminPanelMainPage({Key? key, required User user})
  //     : _user = user,
  //       super(key: key);

  // final User _user;

  @override
  _AdminPanelMainPageState createState() => _AdminPanelMainPageState();
}

class _AdminPanelMainPageState extends State<AdminPanelMainPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  int enters = 3 ;
  int falses = 3;
  List<DataSnapshot> users = [];
  List<Widget> entersList = [];
  List<Widget> userist = [];

  init() {
   
    final database = FirebaseDatabase.instance;
    database
        .ref(
            "Enters/${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}")
        .get()
        .then((value) {
          enters=value.children.length;
       for (var i in value.children) {
        
     
        entersList.add(Text(i.key.toString() +
             "   Saat" +
      i.children.first.value.toString().split("/")[1] +
               ":" +
      i.children.first.value.toString().split("/")[0]));
  
       }
       setState(() {
         
       });
    });
    database.ref("Falses/").get().then((value) {
      falses=value.children.length;
       for (var i in value.children) {
      userist.add(Text(
           i.key.toString() + " : " + i.children.length.toString() + " kişi"));
     }
     setState(() {
       
     });
    });
    //  database.ref("Users/").get().then((value) => users[0]=value);

    setState(() {});
  }

  // void pushscreen(int index){
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => AdminPanelInsidePage(
  //                               gozukeceklist:  widget.list[index]
  //                 )));
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.firebaseNavy,
        centerTitle: true,
        title: const Text("Admin Panel"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(children: [
        Text("Bugün Giren Kişi Sayısı: $enters"),
        Text("Toplam Hatalı Soru Sayısı: $falses"),
          users.isEmpty
              ? const Text("")
              : Text("Toplam Kullanıcı Sayısı: ${users[0].children.length}"),
          const Text("girenlerin listesi : "),
          Column(children: entersList,),
          const Text("yanlışların listesi : "),
          Column(children: userist,),

        ]),
      )),
    );
  }
}
