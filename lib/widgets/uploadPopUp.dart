import 'package:flutter/material.dart';
import '/omunotexam/res/customColors.dart';
import 'package:url_launcher/url_launcher.dart';

class UpLoad {

  static  createAlertDialog(
      BuildContext context,
      { 
        bool visibility =true ,

         String aciklama ="kod adlı soru hatalı olarak işaretlendi, En kısa sürede incelenecektir",
          String baslik ="Bildirim Gönderildi ",
          String? url,
          })  
          {
        void _launchURL(url) async {
  if (!await launch(url, )) throw 'Could not launch $url';
}

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {

       //   addNo(soruyili, sorunumarasi,soruoneki);
          return AlertDialog(
            //title: Text("20"+soruy.toString()+"/20"+(soruy!+1).toString()+" Yılı $sorunumarasi numarali soru hatalı olarak işaretlendi, en kısa zamanda kontrol edilecek"),

            backgroundColor: Colors.transparent,
            content: Container(
              color: CustomColors.background,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      baslik,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      constraints: const BoxConstraints(minWidth: 3000),
                      child: Text(
                        aciklama,
                        style: const TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                          url !=null ? 
                   IconButton(onPressed: (){
                          _launchURL(url);

                   }, icon: const Icon(Icons.drive_folder_upload_rounded))
                    //    TextButton(
                    //   onPressed: () {
                    //   },
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(50),
                    //     child: Container(
                    //       color: Colors.white38,
                    //       child: Container(
                    //         padding: const EdgeInsets.only(
                    //             top: 10, bottom: 10, left: 10, right: 10),
                    //         child: const Text(
                    //           "Dökümanı Aç",
                    //           style: TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 18,
                    //               color: Colors.black),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
              
              
               : const Text(""),
                    const SizedBox(
                      height: 18,
                    ),
                   !visibility ? const CircularProgressIndicator(
                     color: Colors.white,
                   ):

                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: Colors.white38,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            child: const Text(
                              "Tamam",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

        
  }


  


  //  static Future<void>? addNo(String soruyili, String sorunumarasi, String soruoneki) {
  //          if (soruyili =="") {
  //            return null;
  //          } else

           
           
  //    {  
       
  //   final database = FirebaseDatabase.instance;
  //    DatabaseReference  messagesRef = database.ref('Falses/' + soruoneki+"/$soruyili+$sorunumarasi");
  //   // Call the user's CollectionReference to add a new user
  //   String? displayName = FirebaseAuth.instance.currentUser!.displayName.toString();
  //    String? email =  FirebaseAuth.instance.currentUser!.email.toString();

  
  //   return messagesRef.update({displayName+"("+email.split("@")[0]+")":DateTime.now().minute.toString()+"/"+DateTime.now().hour.toString()+"/"+DateTime.now().day.toString()+"/"+DateTime.now().month.toString()+"/"+DateTime.now().year.toString()});
  // }

  //  }


}
