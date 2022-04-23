// import 'package:flutter/material.dart';
// import 'package:omurace/adminPanel/adminPanelnside.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// import '../res/custom_colors.dart';

// class AdminPanelMainPage extends StatefulWidget {
//   //   const AdminPanelMainPage({Key? key, required User user})
//   //     : _user = user,
//   //       super(key: key);

//   // final User _user;
//    final List<Map> list;

//     AdminPanelMainPage({
//     required this.list,


//     //  @required this.sorulistesi,
//   });

//   @override
//   _AdminPanelMainPageState createState() => _AdminPanelMainPageState();
// }

// class _AdminPanelMainPageState extends State<AdminPanelMainPage> {

 
  

//   @override
//   void initState() {
    
//     super.initState();
//   }
 



//   void pushscreen(int index){
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => AdminPanelInsidePage(
//                                 gozukeceklist:  widget.list[index]
//                   ))); 
//   }

//   @override
//   void dispose() {
    
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: CustomColors.firebaseNavy,
//         centerTitle: true,
//         title: const Text("Admin Panel"),
        
//       ),
//       body: Center(
//         child: GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     childAspectRatio: 2),
//                 itemCount: widget.list.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: InkWell(
//                       onTap: () {
//                         setState(() {
//                           //print(buyilinki.entries.elementAt(index).key);
//                           pushscreen(index);
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) => QuizSpot(
//                           //             yil: widget.yilismi,
//                           //             soruname: buyilinki.entries.elementAt(index).key,
//                           //             sinif: buyilinki,
//                           //           )),
//                           // );

//                           // Quiz(sorulistesi: buyilinki.entries.elementAt(index).key,);
//                         });
//                       },
//                       child: Container(
//                         width: 220,
//                         height: 220,
//                         child: Text(
//                         widget.list[index],
//                           style: const TextStyle(
//                               fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                         color: Colors.black12,
//                         alignment: Alignment.center,
//                       ),
//                     ),
//                   );
                
//           },
//         ),
//       ),
//     );
//   }
// }
