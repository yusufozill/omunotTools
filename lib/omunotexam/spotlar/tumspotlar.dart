import 'package:flutter/material.dart';

class Tumspotlar extends StatefulWidget {
 final List<Map> items;

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
                               itemx["Q"].toString(),
                              textAlign: TextAlign.center,
                                  
                              style: const TextStyle(
                        
                                
                                fontSize: 18,
                                inherit: true,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.clip,
                            ),
                            
                          )
                       , Text(
                      itemx["tx"]==null? "x0":"x"+itemx["tx"].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                     
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