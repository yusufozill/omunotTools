
// ignore_for_file: unnecessary_null_comparison

import '/omunotexam/res/theme.dart';
import '/omunotexam/youtubepanel/derslerMainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/omunotexam/adminPanel/AdminPanelMainPage.dart';
import '/omunotexam/category.dart';
import '/omunotexam/screens/sign_in_screen.dart';
import '/omunotexam/siniflar.dart';
import '/omunotexam/spotlar/spotbaslik.dart';
import '/omunotexam/utils/authentication.dart';
import '/omunotexam/widgets/gridWidget.dart';
import '/omunotexam/widgets/userInformationWidget.dart';

import '/screens/fileFill.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../res/customColors.dart';



class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user}) : _user = user, super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _bool = false;
  String hello = "Hoşgeldin!";
  String mesaj = "";
  int currentIndex=0;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MaterialApp( theme: themData, home: const Scaffold(  body: SignInScreen())),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    userRight();

    addUser();
    super.initState();
  }
  
    userRight(){
   
      _user = widget._user;
    uid = _user.uid;
    var x = _user.email;
    tercihlerigonder();
    var k = x.toString().split("@");
    final database = FirebaseDatabase.instance;

    if (k[1] == "stu.omu.edu.tr") {
      setState(() {
        //debugPrint(k);
        _bool = true;
        git();

      });
    }else {
          DatabaseReference enters = database.ref("RecordUser/${_user.email}");
    enters.get().then(( value) {
      if(value!=null){
          _bool = true;
        git();
        
      }
    });
    }

  }
 
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> tercihlerigonder() async {
    //debugPrint("tercihlerigonder aktif");
    List<String> gonder = [
      widget._user.displayName.toString(),
      widget._user.email.toString(),
      widget._user.metadata.toString(),
      widget._user.phoneNumber.toString(),
      widget._user.photoURL.toString(),
      widget._user.providerData.toString(),
      widget._user.tenantId.toString(),
      widget._user.uid.toString(),
    ];
    //debugPrint(gonder);

    final SharedPreferences prefs = await _prefs;

    setState(() {
      prefs.setStringList("uid", gonder).then((bool success) {
        return debugPrint(" tercihleri gönder fonksiyonu aktif yazıldı");
      });
    });
  }

  Future<bool> boolean() async {
    final SharedPreferences prefs = await _prefs;

    bool k = prefs.getBool("siniflarpage") ?? false;
    return k;
  }

  Future<void> git() async {
    if (_bool) {
      if (await boolean()) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Siniflar()));
      }
    }
  }

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    final database = FirebaseDatabase.instance;
    DatabaseReference enters = database.ref("Enters/" +
        DateTime.now().year.toString() +
        "/" +
        DateTime.now().month.toString() +
        "/" +
        DateTime.now().day.toString());
    DatabaseReference users = database.ref("Users");
    enters
        .child(_user.displayName.toString() +
            "(" +
            _user.email.toString().replaceAll(".", "").split("@")[0] +
            ")")
        .update({
          DateTime.now().minute.toString() +
                  "/" +
                  DateTime.now().hour.toString():
              DateTime.now().minute.toString() +
                  "/" +
                  DateTime.now().hour.toString(),
        })
        .then((value) => debugPrint("Enters today add"))
        .catchError((error) => debugPrint("Failed to add Enter: $error"));
    return users
        .child(_user.displayName.toString())
        .set({
          'displayname': _user.displayName,
          'e-mail': _user.email,
          'phone': _user.phoneNumber,
          'photo': _user.photoURL,
          'uid': _user.uid,
          'meta': _user.metadata.toString(),
        })
        .then((value) => debugPrint("Users today add"))
        .catchError((error) => debugPrint("Failed to add Users: $error"));
  }
        void _launchURL(url) async {
  if (!await launch(url, )) throw 'Could not launch $url';
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
//       bottomNavigationBar: BottomNavigationBar(
      
//         currentIndex: currentIndex,
//         unselectedLabelStyle:const TextStyle(color: CustomColors.white),
//         selectedLabelStyle :const TextStyle(color: CustomColors.grey),
//         showUnselectedLabels: true,
//         backgroundColor: CustomColors.background,
//         onTap: (index){  setState(() {
//           currentIndex=index;
//         });},
// //         items: const [
// // BottomNavigationBarItem(  icon:    Icon(Icons.home), label: "exam", backgroundColor: CustomColors.background),
// // BottomNavigationBarItem(icon:    Icon(Icons.book,semanticLabel: "semantik",), label: "spots",backgroundColor: CustomColors.background),
// // BottomNavigationBarItem(icon:    Icon(Icons.book), label: "docs",backgroundColor: CustomColors.background),
// // BottomNavigationBarItem(icon:    Icon(Icons.book), label: "video",backgroundColor: CustomColors.background),
// // BottomNavigationBarItem(icon:    Icon(Icons.person), label: "profil",backgroundColor: CustomColors.background),
// //       ]
//  ),
      appBar: AppBar(
        title: const Text("omunot.com"),
        actions: [Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, semanticLabel: "profil",),
          Text(widget._user.displayName!)

        ],
      )]),
      body:
       SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
                    ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserInfoWidget(const Key("key"), user: widget._user),
                          IconButton(
                            iconSize: 32,
                            onPressed:
                                // onPressed:
                                () async {
                              setState(() {});
                              await Authentication.signOut(context: context);
                              setState(() {});
                              Navigator.of(context)
                                  .pushReplacement(_routeToSignInScreen());
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(left:10.0),
                          //   child: Container(
                          //       height: 40,
                          //       width: 40,

                          //       decoration:const BoxDecoration(
                          //         color: Colors.black54,

                          //         // shape: MaterialStateProperty.all(
                          //         //   RoundedRectangleBorder(
                          //         //     borderRadius: BorderRadius.circular(10),
                          //         //   ),
                          //         // ),
                          //         borderRadius:  BorderRadius.all(Radius.circular(10))

                          //       ),

                          //       // onPressed: () async {
                          //       //   setState(() {
                          //       //     _isSigningOut = true;
                          //       //   });
                          //       //   await Authentication.signOut(context: context);
                          //       //   setState(() {
                          //       //     _isSigningOut = false;
                          //       //   });
                          //       //   Navigator.of(context)
                          //       //       .pushReplacement(_routeToSignInScreen());
                          //       //  },
                          //       child:
                          //       //  Padding(
                          //       //   padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          //       //   child:
                          //            Icon(Icons.close, size: 32,color: Colors.white,),
                          //             // Text(
                          //             //   'Çıkış \n yap',
                          //             //   style: TextStyle(
                          //             //     fontSize: 10,
                          //             //     fontWeight: FontWeight.bold,
                          //             //     color: Colors.white,
                          //             //     letterSpacing: 2,
                          //             //   ),
                          //             // ),

                          //     //  ),
                          //     ),
                          // ),
                        ],
                      ),
                    _bool ? const Text(""): 
                     const Text("! Bu hesabı aktive etmek için bana mesaj atabilirsin", style: TextStyle(fontSize: 15,  color: CustomColors.atention, ),)
                    ],
                  ),
                ),
                
                Flexible(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(
                      
                    
                      children: [
                        Row(mainAxisSize: MainAxisSize.max,),
                      GridWidget(
                        route: const Siniflar(),
                        string: "Çıkmışlar",
                        boolean: _bool,
                        falseString:
                            "Üniversite hesabınla giriş yapmadığın için sorulara erişemezsin",
                      ),
                      // const SizedBox(height: 8.0),
                      // GridWidget(
                      //   route: const SiniflarSpot(),
                      //   string: "Spot Notlar",
                      //   boolean: true,
                      //   falseString: "",
                      // ),
                      const SizedBox(height: 8.0),
                        GridWidget(
                        route:  const YoutubeMainPage(),
                        string: "Youtube",
                        boolean: _bool,
                        falseString: "Üniversite hesabınla giriş yapmadığın için videolara erişemezsin",
                      ),
                      const SizedBox(height: 8.0),
                   
                      widget._user.email != "a1704004@stu.omu.edu.tr"
                          ? const Text("")
                          : GridWidget(
                              route: const AdminPanelMainPage(),
                              string: "AdminPaneline Geç",
                              boolean: true,
                              falseString: "",
                            ),
                      widget._user.email != "a1704004@stu.omu.edu.tr"? const Text("")
                          : GridWidget(route: const FileFill(), string: "Hasta Dosyası Hazırla", falseString: "Giriş Yapmalısın", boolean: true)
                    ]),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

// _user.photoURL != null
//     ? ClipOval(
//         child: Material(
//           color: CustomColors.googleBackground.withOpacity(0.3),
//           child: Image.network(
//             _user.photoURL!,
//             fit: BoxFit.fitHeight,
//           ),
//         ),
//       )
//     : ClipOval(
//         child: Material(
//           color: CustomColors.googleBackground.withOpacity(0.3),
//           child: const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Icon(
//               Icons.person,
//               size: 60,
//               color: CustomColors.googleBackground,
//             ),
//           ),
//         ),
//       ),
// const SizedBox(height: 16.0),
// Text(
//   hello,
//   style: const TextStyle(
//     color: CustomColors.firebaseGrey,
//     fontSize: 26,
//   ),
// ),
// const SizedBox(height: 8.0),
// Text(
//   _user.displayName!,
//   style: const TextStyle(
//     color: CustomColors.frontPlan,
//     fontSize: 26,
//   ),
// ),
// const SizedBox(height: 8.0),
// Text(
//   '( ${_user.email!} )',
//   style: const TextStyle(
//     color: CustomColors.atention,
//     fontSize: 20,
//     letterSpacing: 0.5,
//   ),
// ),
// const SizedBox(height: 24.0),
// Text(
//   mesaj,
//   style: const TextStyle(
//       color: CustomColors.firebaseGrey,
//       fontSize: 14,
//       letterSpacing: 0.2),
// ),
// const SizedBox(height: 16.0),
// _isSigningOut
//     ? const CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//       )
//     : ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(
//             Colors.redAccent,
//           ),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//         onPressed: () async {
//           setState(() {
//             _isSigningOut = true;
//           });
//           await Authentication.signOut(context: context);
//           setState(() {
//             _isSigningOut = false;
//           });
//           Navigator.of(context)
//               .pushReplacement(_routeToSignInScreen());
//         },
//         child: const Padding(
//           padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
//           child: Text(
//             'Çıkış yap',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               letterSpacing: 2,
//             ),
//           ),
//         ),
//       ),
// const SizedBox(height: 60.0),
//
