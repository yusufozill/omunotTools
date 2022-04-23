import '/omunotexam/res/customColors.dart';
import '/omunotexam/res/theme.dart';
import '/omunotexam/youtubepanel/derslerMainPage.dart';
import '/screens/fileFill.dart';
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
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/docs/v1.dart' as docsApi;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import 'dart:async';

class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _client.send(request);
  }
}

class MainPageWithUser extends StatefulWidget {
  MainPageWithUser({Key? key, required User user}) : _user = user, super(key: key);

  final User _user;

  @override
  _MainPageWithUserState createState() => _MainPageWithUserState();
}

class _MainPageWithUserState extends State<MainPageWithUser> {
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
    _user = widget._user;
    uid = _user.uid;
    var x = _user.email;
    tercihlerigonder();
    var k = x.toString().split("@");
    if (k[1] == "stu.omu.edu.tr" || x == "korulifesevgi28@gmail.com") {
      setState(() {
        //debugPrint(k);
        _bool = true;
        git();

      });
    }

    addUser();
    super.initState();
  }
  

  Future<void> _loadDocument() async {
    //TO DO add current user null check !
    var header =  await (await GoogleSignIn(   scopes: [
        ""
       "https://www.googleapis.com/auth/drive",
       "https://www.googleapis.com/auth/documents"
        ] ).signInSilently() )! .authHeaders;
  
    // FirebaseAuth.instance.currentUser.
    // print("load document");

    final client = GoogleAuthClient(header );
    final driveApi = drive.DriveApi(client);
    //var id = "1Pd9J1usOc8QK7herksr8WPyf2z_7mnpF31okRS-LwUc";
    var id = "1tzSfX3J_-U_Oei7ko12SOklCJ-Gc4Wrrx0QTcIy0sx0";
   // 1tzSfX3J_-U_Oei7ko12SOklCJ-Gc4Wrrx0QTcIy0sx0
    final api = docsApi.DocsApi(client);
    // docsApi.Document document = docsApi.Document(title:"dolu");
        // footers:  docsApi.Footer(footerId: "hasan"),

        final Stream<List<int>> mediaStream =
        Future.value([104, 105]).asStream().asBroadcastStream();
var media = drive.Media(mediaStream,2);
var requestDrive = drive.File( name: "bu da geçecek Biliyoru maaah");

kkkkk(String newid)async{
  if(newid!=""){
  
    var kurt = docsApi.BatchUpdateDocumentRequest(
      requests: [ 
       docsApi.Request(replaceAllText: docsApi.ReplaceAllTextRequest(containsText: docsApi.SubstringMatchCriteria(matchCase: true,text: "{{hastaAdi}}"), replaceText: "YusufÖzil"))  
        //     docsApi.Request(
        // insertText: docsApi.InsertTextRequest(text: "Hele Şükür", location: docsApi.Location(index: 1 )) ,
        // ),
        //    docsApi.Request(
        //      updateTextStyle: docsApi.UpdateTextStyleRequest(range: docsApi.Range(startIndex: 1,endIndex: 11) ,textStyle:  docsApi.TextStyle(bold: true,underline: true) ,fields: "*" )
        // ),

        //   docsApi.Request(
        //     updateParagraphStyle: docsApi.UpdateParagraphStyleRequest(paragraphStyle: docsApi.ParagraphStyle(alignment: "center", namedStyleType: "title"), fields: "*", range: docsApi.Range(startIndex:1, endIndex: 32),
        //      )   ),
        //       docsApi.Request(
        //    createNamedRange: docsApi.CreateNamedRangeRequest(name: "Bu yoktu", range: docsApi.Range(startIndex: 11, endIndex: 12) )
        // ),
        //              docsApi.Request(
        //    replaceNamedRangeContent: docsApi.ReplaceNamedRangeContentRequest(namedRangeName: "Bu Yoktu", text: "bu da yeni" )
        // ),
    ]);
    await api.documents.batchUpdate(kurt, newid).then((value) =>print("document batch"));
  


}
}
driveApi.files.copy(requestDrive, id).then((value) => {
  
  print(value.name ),
  
  kkkkk(value.id ?? "")
  });


//var mx= new drive.Media();
// var driveFile = new drive.File();
// var dx=new drive.File();
// driveFile.name = "hello_world.txt";
// final result = await driveApi.files.create(driveFile, uploadMedia: media);
//                    //  driveApi.files.create(dx, uploadMedia: await docsApi.documents.get("documentId").asStream().asBroadcastStream() )


    // var kurt = docsApi.BatchUpdateDocumentRequest(
    //   requests: [ 
    //    docsApi.Request(replaceAllText: docsApi.ReplaceAllTextRequest(containsText: docsApi.SubstringMatchCriteria(matchCase: true,text: "{{hastaAdi}}"), replaceText: "YusufÖzil"))  
    //     //     docsApi.Request(
    //     // insertText: docsApi.InsertTextRequest(text: "Hele Şükür", location: docsApi.Location(index: 1 )) ,
    //     // ),
    //     //    docsApi.Request(
    //     //      updateTextStyle: docsApi.UpdateTextStyleRequest(range: docsApi.Range(startIndex: 1,endIndex: 11) ,textStyle:  docsApi.TextStyle(bold: true,underline: true) ,fields: "*" )
    //     // ),

    //     //   docsApi.Request(
    //     //     updateParagraphStyle: docsApi.UpdateParagraphStyleRequest(paragraphStyle: docsApi.ParagraphStyle(alignment: "center", namedStyleType: "title"), fields: "*", range: docsApi.Range(startIndex:1, endIndex: 32),
    //     //      )   ),
    //     //       docsApi.Request(
    //     //    createNamedRange: docsApi.CreateNamedRangeRequest(name: "Bu yoktu", range: docsApi.Range(startIndex: 11, endIndex: 12) )
    //     // ),
    //     //              docsApi.Request(
    //     //    replaceNamedRangeContent: docsApi.ReplaceNamedRangeContentRequest(namedRangeName: "Bu Yoktu", text: "bu da yeni" )
    //     // ),
    // ]);

    // await  api.documents.create(docsApi.Document(title: "Bu da bi başka")).then((value) {print(value.documentId);id=value.documentId!;});

    //   var eskiDoc= await api.documents.get(id).then((value) =>  print( value.headers )
    //   );
    
    // document.toJson();
    //  var eskiDoc= await api.documents.get("1ZkHB1H7o2gLYo_xfVrf7V9IkMCwePynP5MGFJVRilr4");
    //  eskiDoc.title="hasan";

  //  await api.documents.create(document).then((value) {
  //     print(value.documentId);
  //     id = value.documentId!;
  //   });

   // await api.documents.batchUpdate(kurt, id);
     // var hh= await api.documents.get(id);

   
    //  api.documents.create(kop).then((value) {print(value.documentId);id=value.documentId!;});
    //  docsApi.BatchUpdateDocumentRequest? yeni = docsApi.BatchUpdateDocumentRequest() ;
    //  api.documents.batchUpdate(eskiDoc, id);


//     final Stream<List<int>> mediaStream =
//         Future.value([104, 105]).asStream().asBroadcastStream();
//     ;
// var media = new drive.Media(mediaStream,2);
// //var mx= new drive.Media();
// var driveFile = new drive.File();
// var dx=new drive.File();
// driveFile.name = "hello_world.txt";
// final result = await driveApi.files.create(driveFile, uploadMedia: media);
//                    //  driveApi.files.create(dx, uploadMedia: await docsApi.documents.get("documentId").asStream().asBroadcastStream() )
// print("Upload result: $result");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      bottomNavigationBar: BottomNavigationBar(
      
        currentIndex: currentIndex,
        unselectedLabelStyle:const TextStyle(color: CustomColors.white),
        selectedLabelStyle :const TextStyle(color: CustomColors.grey),
        showUnselectedLabels: true,
        backgroundColor: CustomColors.background,
        onTap: (index){  setState(() {
          currentIndex=index;
        });},
        items: const [
BottomNavigationBarItem(  icon:    Icon(Icons.home), label: "exam", backgroundColor: CustomColors.background),
BottomNavigationBarItem(icon:    Icon(Icons.book,semanticLabel: "semantik",), label: "spots",backgroundColor: CustomColors.background),
BottomNavigationBarItem(icon:    Icon(Icons.book), label: "docs",backgroundColor: CustomColors.background),
BottomNavigationBarItem(icon:    Icon(Icons.book), label: "video",backgroundColor: CustomColors.background),
BottomNavigationBarItem(icon:    Icon(Icons.person), label: "profil",backgroundColor: CustomColors.background),
      ]),
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
            bottom: 20.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Column(
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
                    ],
                  ),
                ),
                
                Flexible(
                  flex: 8,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      GridWidget(
                        route: const Siniflar(),
                        string: "Çıkmışlar",
                        boolean: _bool,
                        falseString:
                            "Üniversite hesabınla giriş yapmadığın için sorulara erişemezsin",
                      ),
                      const SizedBox(height: 8.0),
                      GridWidget(
                        route: const SiniflarSpot(),
                        string: "Spot Notlar",
                        boolean: true,
                        falseString: "",
                      ),
                      const SizedBox(height: 8.0),
                        GridWidget(
                        route:  const YoutubeMainPage(),
                        string: "Youtube",
                        boolean: true,
                        falseString: "",
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
                                      GridWidget(route: const FileFill(), string: "Hasta Dosyası Hazırla", falseString: "Giriş Yapmalısın", boolean: true)
                        , ElevatedButton(onPressed: _loadDocument, child: const Text("Tekrar")),
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
