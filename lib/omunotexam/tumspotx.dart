// import 'package:flutter/material.dart';
// import 'package:omurace/classes/questionClass.dart';

// class Tumspotlar extends StatefulWidget {
//   const Tumspotlar({Key? key, required this.items, required this.questions})
//       : super(key: key);
//   final List<Map>? items;
//   final List<Question>? questions;

//   @override
//   _TumspotlarState createState() => _TumspotlarState();
// }

// class _TumspotlarState extends State<Tumspotlar> {
//   int index = 0;

//   @override
//   void initState() {
//   print(widget.items);
//     super.initState();
//   }

// // String getString( Object itemx, String key){

// //   if(itemx.runtimeType==Question){
// //       Question? item=itemx;
// //       item.soruMap[key];
// //   }else {
// //     return item![key];

// //   }
// //     return "hata";

// // }
//   List<Widget> listwidget() {
//     List<Widget> endturn = [];
//     print(widget.items);
//     // if (widget.items ==null) else

//     for (var k = 0; k < (widget.items ?? widget.questions!).length; k++) {
//       List items = widget.items ?? widget.questions!;
//       Map sorumap = {};
//       if (widget.items == null) {
//         sorumap = widget.items![k];
//       } else {
//         sorumap = widget.questions![k].soruMap;
//       }

//       Widget newone = ClipRRect(
//         borderRadius: BorderRadius.circular(50),
//         child: Container(
//           color: Colors.white38,
//           child: InkWell(
//             onTap: () {
//               Navigator.of(context).pop(items[k]);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Container(
//                 constraints: const BoxConstraints(minHeight: 50),
//                 child: Row(
//                   children: [
//                     Text(
//                       (k + 1).toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     Expanded(
//                       child: Text(
//                         sorumap["Q"].toString(),
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           inherit: true,
//                         ),
//                         softWrap: true,
//                         overflow: TextOverflow.clip,
//                       ),
//                     ),
//                     Text(
//                       sorumap["tx"] == null
//                           ? ""
//                           : "x" + sorumap["tx"].toString(),
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//       endturn.add(newone);

//       endturn.add(const SizedBox(
//         height: 12,
//       ));
//     }
//     return endturn;
//   }

//   @override
//   Widget build(BuildContext context) {
//     index = 0;
//     return Scaffold(
//       body: Center(
//         child: ListView(
//           children: <Widget>[
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "toplam: " +
//                           (widget.items ?? widget.questions!).length.toString(),
//                       style:
//                           const TextStyle(fontSize: 18, color: Colors.white70),
//                     )
//                   ],
//                 ),
//               ] +
//               listwidget(),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'classes/questionClass.dart';

class Tumspotlar extends StatefulWidget {
 final List<Question> items;

 const Tumspotlar( { Key? key, required this.items } ) : super(key: key);

  @override
  _TumspotlarState createState() => _TumspotlarState();
}

class _TumspotlarState extends State<Tumspotlar> {
  
  int index=0;

  @override
  void initState() {
       if (widget.items.isEmpty){
         debugPrint("Rahat ol kanka");
       }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      index =0;
    return Scaffold(
       appBar: AppBar(title: Text("Soru Listesi"),),
        body: Center(
          child: ListView(
            
              children: [
                const SizedBox(height:40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("toplam: "+ widget.items.length.toString(),              style: const TextStyle(
                            fontSize: 18, color: Colors.white70),)],),
       
            for (var itemx in widget.items) 
             ...[

                  ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
               color: Colors.white38,
                child: InkWell(
                  
                  onTap: () {

                    Navigator.of(context).pop(itemx);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 50),
                      child: Row(
                        children: [
              
                            Text(
                      (index++ +1).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                         Expanded(
                            child: Text(
                               itemx.soruMap["Q"].toString(),
                              textAlign: TextAlign.center,
                                  
                              style: const TextStyle(
                        
                                
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                            
                          )
                       , 
                     
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
         
      const SizedBox(height: 12,)]
             ],
             ),
            
             ),


    );
  }
}