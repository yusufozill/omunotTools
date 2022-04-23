

import '/omunotexam/screens/sign_in_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '/omunotexam/res/customColors.dart';
import '/omunotexam/res/theme.dart';

// Future<void> main() async {

//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyHomePage());
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int surum = 1;
  bool ac = true;
  
  @override
  void initState() {
     maker();
  getIsaretlenmeSayisi();
    super.initState();
  }

  maker(){
    
  }
  Future<int> getIsaretlenmeSayisi() async {
    final database = FirebaseDatabase.instance;
// 'Falses/' + soruoneki+"/$soruyili+$sorunumarasi"
    int _a = 0;

    await database
        .ref("surum")
        .get()
        .then((value) {
ac = surum>= (int.tryParse(value.value.toString()) ?? surum);
               print(ac);
        } );

    return _a;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themData,
      home: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: currentIndex,
        //     unselectedLabelStyle: const TextStyle(color: CustomColors.white),
        //     selectedLabelStyle: const TextStyle(color: CustomColors.grey),
        //     showUnselectedLabels: true,
        //     backgroundColor: CustomColors.background,
        //     onTap: (index) {
        //       setState(() {
        //         currentIndex = index;
        //       });
        //     },
        //     items: const  widget[
        //        BottomNavigationBarItem(
        //           icon: Icon(Icons.home),
        //           label: "exam",
        //           backgroundColor: CustomColors.background),
        //        BottomNavigationBarItem(
        //           icon: Icon(
        //             Icons.book,
        //             semanticLabel: "semantik",
        //           ),
        //           label: "spots",
        //           backgroundColor: CustomColors.background),
        //        BottomNavigationBarItem(
        //           icon: Icon(Icons.book),
        //           label: "omunotexam",
        //           backgroundColor: CustomColors.background),
        //        BottomNavigationBarItem(
        //           icon: Icon(Icons.book),
        //           label: "video",
        //           backgroundColor: CustomColors.background),
        //        BottomNavigationBarItem(
        //           icon: Icon(Icons.person),
        //           label: "profil",
        //           backgroundColor: CustomColors.background),
        //     ]),

    
        //  body:  Text("jhkljlh"),
        body: !ac ?  const Center(child: Text("Uyulama güncel değil ve güncellemelisin")) :const SignInScreen(),
      ),
    );
  }
}
