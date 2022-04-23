import '/omunotexam/res/theme.dart';
import '/omunotexam/youtubepanel/derslerMainPage.dart';
import '/screens/fileFill.dart';
import 'package:flutter/material.dart';
import '/omunotexam/screens/sign_in_screen.dart';
import '/omunotexam/siniflar.dart';
import '/omunotexam/spotlar/spotbaslik.dart';
import '/omunotexam/widgets/gridWidget.dart';

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

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);



  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
 
 
    super.initState();
  }
  


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


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

  _loadDocument(){
    setState(() {
      
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Center(
            child: 
               
              SingleChildScrollView(
                    child: Column(children: [
                      
                    const Text("Burada Yapabileceğin çok şey var"),
                    const Text("Çıkmışları çözebilirsin"),
                     GridWidget(route:  const Siniflar(), string: "Çıkmışlar", falseString: "Giriş Yapmalısın", boolean: false)
,
                    const Text("Spot notlar oluşturup sınavlara hazırlanabilirsin"),
                  
                      GridWidget(route:  const SiniflarSpot(), string: "Spot Notlar", falseString: "Giriş Yapmalısın", boolean: true)
,  const Text("Hasta dosyası hazırlamanın en hızlı yolunu keşfedebilirsin"),
                      GridWidget(route:  const FileFill(), string: "Hasta Dosyası Hazırla", falseString: "Giriş Yapmalısın", boolean: false)
,
                    const Text("Geçmiş yılların ders kayıtlarını izleyebilirsin"),
                      GridWidget(route:  const YoutubeMainPage(), string: "Ders Kayıtları", falseString: "Giriş Yapmalısın", boolean: true)
                     
                     //   , ElevatedButton(onPressed: _loadDocument, child: Text("Tekrar")),
                    ]),
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
