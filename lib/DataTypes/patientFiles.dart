
// ignore_for_file: file_names, library_prefixes

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/docs/v1.dart' as docsApi;
import 'package:googleapis/drive/v3.dart' as drive;

import '../omunotexam/utils/authentication.dart';

class PatientFile extends PatientFiles {}

class PatientFiles {
  static final Map<String, String> regEx = {
    "String": r'[^0-9]',
    "int": r'[0-9]'
  };
  static Map<String, String> todowrite = {};
  String fileid = "";
  String viewLink = "";

  Map<String, Map<String, dynamic>> hastaBilgileri = {
  
    "Adı-Soyadı": {
      "type": "String",
      "offers": null,
      "offersQ": {"Adınız Nedir ?"},
      "value": "Hasan",
      "label": "{{hastaAdi}}"
    },
    "Hasta Numarası": {
      "type": "int",
      "offers": null,
      "value": "",
      "label": "{{hasta_no}}"
    },
    "Dosya Numarası": {
      "type": "int",
      "offers": null,
      "value": "",
      "label": "{{dosyaNo}}"
    },

    "T.C. Kimlik Numarası": {
      "type": "int",
      "offers": null,
      "value": "",
      "label": "{{tc}}"
    },
    "Doğum tarihi": { // TO DO: burayı / olacak şekilde güncelle
      "type": "DateTime",
      "offers": null,
      "value": "",
      "label": "{{dogum_yeri}}"
    },
    "Yaşı": {
      "type": "int",
      "offers": {
        {"20", "25", "30", "62", "65"}
      },
      "value": "",
      "label": "{{yas}}"
    },
    "Cinsiyeti": {
      "type": "TextButton",
      "offers": {
        {"Erkek", "Kadın", "Oğlan", "Kız", "Bilinmiyor"}
      },
      "value": "",
      "label": "{{cinsiyet}}"
    },
    "Kan Grubu": {
      "type": "TextButton",
      "offers": {
        {"A", "B", "AB", "0"},
        {"Rh-", "Rh+"}
      },
      "value": "",
      "label": "{{kan_grubu}}"
    },
    "Mesleği": {
      "type": "String",
      "offers": {
        {"Ev Hanımı", "Emekli", "Memur", "İşçi"}
      },
      "value": "",
      "label": "{{meslek}}"
    },
    "Sosyal Güvencesi": {
      "type": "String",
      "offers": {
        {"SGK", "Özel Sağlık Sigortası", "Bilinmiyor"}
      },
      "value": "",
      "label": "{{guvence}}"
    },
    "Doğum yeri": {
      "type": "Adres",
      "offers": {
        {"Samsun", "Sinop", "Amasya"}
      },
      "value": "",
      "label": "{{dogum_tarihi}}"
    },
    "Yaşadığı yer": {
      "type": "Adres",
      "offers": {
        {"Samsun", "Sinop", "Amasya"}
      },
      "value": "",
      "label": "{{yasadigi_yer}}"
    },
    "Medeni durumu	": {
      "type": "String",
      "offers": {
        {"Evli", "Bekar", "Dul"}
      },
      "value": "",
      "label": "{{evli}}"
    },
    "Çocuk sayısı": {
      "type": "String",
      "offers": {
        {"1", "2", "3", "4", "5"}
      },
      "value": "",
      "label": "{{cocuk_sayisi}}"
    },
    "Adresi": {
      "type": "Text",
      "offers": null,
      "value": "",
      "label": "{{adres}}"
    },
    "Telefonu	": {
      "type": "String",
      "offers": null,
      "value": "",
      "label": "{{telefon}}"
    },
    "Hastaneye Yatış Tarihi	": {
      "type": "String",
      "offers": null,
      "value": "",
      "label": "{{yatis_tarihi}}"
    },
    "Öyküsünün Alındığı Tarih ve Saat": {
      "type": "DateTime",
      "offers": null,
      "value": "",
      "label": "{{oyku_tarihi}}"
    },
    "Öyküsünün Alındığı Kişi ve güvenilirliği": {
      "type": "String",
      "offers": {

        {"Kendisi", "Annesi", "Babası", "Kardeşi", "Komşusu", "Yakın Akrabası"},
        {"%90", "%50", "%25"}


     

      },
      "value": "",
      "label": "{{guven}}"
    },
  };
  Map<String, Map> anaYakinma = {
    "Ana Yakınma": {
      "type": "Text",
      "offersQ": {
        "Hastaneye Başvurma Nedeniniz Nedir ?",
        "Sizi Buraya Getiren Sebep Nedir ?",
        "Buraya gelirkenki sebebiniz nedir ?"
      },
      "offers": {
        {"Karın Ağrısı", "Mide Bulantısı", "Baş Ağrısı"}
      },
      "value": "",
      "label": "{{ana_yakinma}}"
    },
    "Öykü": {
      "type": "Text",
      "offers": null,
      // "anamnez": {
      //   "Şikayetini Tam Olarak Nedir ?",
      //   "Ağrı karakteri:Nasıl Bir ağrı, yanma, batma, sıkışma ?",
      //   "Ağrı odağı:Ağrınız tam olarak nerede ?",
      //   "Ağrı şiddeti:Ne kadar ağrıyor ?, Sizi ne kadar rahatsız ediyor ?, uykunuzdan uyandırıyor mu ?",
      //   "Ağrı yayılımı:Başka bir yerde ağrı hissediyor musunuz ?",
      //   "Artıp Azaltan faktörler:Şikayetinizi arttıran, azaltan şeyler nelerdir",
      //   "Şikayet süresi:Ne zamandır var ?",
      //   "Şikayet etiyolojisi:Nasıl başladı ?","Çevrenizde benzer şikayetlere sahip biri var mı  ?",
      //   "Şikayet kliniği:Eşlik eden başka şikayetiniz var mı?",
      //   "Sormanız gereken sorular bu listeden ibaret DEĞİLDİR",
      // },

      "value": "", "label": "{{oyku}}"
    },
  };
  Map<String, Map> ozGecmis = {
    "Hastalık": {
      "type": "Text",
      "offers": {
        {"Hipertansiyon", "Diyabet"},
        {"3 Yıldır", "5 Yıldır", "10 Yıldır"}
      },
      "value": {},
      "label": "{{hastalik}}"
    },
    "Operasyon": {
      "type": "Text",
      "offers": {
        {"Bademcik", "Diyabet"},
        {"3 Yıldır", "5 Yıldır", "10 Yıldır"}
      },
      "value": {},
      "label": "{{operasyon}}"
    },
    "Kaza": {
      "type": "Text",
      "offers": {
        {"Araba Kazası", "Düşme", "Yaralanma"},
        {"3 Yıl Önce", "5 Yıl Önce", "10 Yıl Önce"}
      },
      "value": {},
      "label": "{{kaza}}"
    },
    "Alerji": {
      "type": "Text",
      "offers": {
        {"Penisilin Alerjisi", "Bulunmuyor"}
      },
      "value": "",
      "label": "{{alerji}}"
    },
    "Kullandığı ilaçlar": {
      "type": "Text",
      "offers": null,
      "value": {},
      "label": "{{ilac}}"
    },
    "Bağımlılıklar": {
      "type": "Text",
      "offers": {
        {"Sigara", "Alkol", "Madde", "Esrar"},
        {
          "Paket/Yıl",
        }
      },
      "value": {},
      "label": "{{bagimlilik}}"
    },
  };
  Map cont = {"type": String, "offers": {}, "value": ""};
  Map<String, dynamic> doktorBilgileri = {
    "Adı-Soyadı": {
      "label": "{{StdName}}",
      "value": FirebaseAuth.instance.currentUser!.displayName.toString()
    },
    "Öğrenci Numarası": {
      "label": "{{OgrenciNo}}",
      "value": FirebaseAuth.instance.currentUser!.email!.split("@")[0]
    },
  };
  
  

  Map<String, Map> soyGecmis = {
    "Annesi": {
      "type": "Text",
      "offers": {
        {"Sağ", "Vefat Etmiş"},
        {"Sağlıklı", "Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{anne}}"
    },
    "Babası": {
      "type": "Text",
      "offers": {
        {"Sağ", "Vefat Etmiş"},
        {"Sağlıklı", "Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{baba}}"
    },
    "Kardeşleri": {
      "type": "Text",
      "offers": {
        {"Sağ", "Vefat Etmiş"},
        {"Sağlıklı", "Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{kardesi}}"
    },
    "Çocukları": {
      "type": "Text",
      "offers": {
        {"Sağ", "Vefat Etmiş"},
        {"Sağlıklı", "Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{cocuk}}"
    },
    "Akraba Evliliği": {
      "type": "Text",
      "offers": {
        {"Kardeş Çocukları", "Kuzen Çocukları"},
        {"Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{akraba_evliligi}}"
    },
  };
 
 
  List<Map<String, Map>> fileCount() {
    List<Map<String, Map>> list = [];
    list.add(hastaBilgileri);
    list.add(anaYakinma);
    list.add(ozGecmis);
    list.add(soyGecmis);
    list.add(sistemSorgusu);
    return list;
  }

  Map<String, Map> sistemSorgusu = {
    "Vitaller": {
      "type": "chip",
      "offers": {
        "Kilo Kaybı": "{{kilokaybi}}",
        "Halsizlik": "{{halsizlik}}",
        "İştahsızlık": "{{istahsizlik}}",
        "Ateş": "{{ates}}"
      }
    },
    "Baş Boyun": {
      "type": "chip",
      "offers": {
        "Saç dökülmesi": "{{sacdokulmesi}}",
        "Bulanık görme": "{{bulanikgorme}}",
        "Göz kuruluğu": "{{gozkurulugu}}",
        "Ağız kuruluğu": "{{agizkurulugu}}",
        "Oral aft": "{{aft}}",
        "Diş tedavisi": "{{dis}}",
        "Dişeti kanaması": "{{diseti}}"
      }
    },
    "Solunum Sistemi": {
      "type": "chip",
      "offers": {
        "Öksürük ": "{{oksuruk}}",
        "Balgam": "{{balgam}}",
        "Gece terlemesi  ": "{{geceterlemesi}}",
        "Hemoptizi": "{{hemoptizi}}",
        "Nefes darlığı": "{{nefesdarligi}}",
        "Göğüs ağrısı ": "{{gogusagrisi}}",
        "Çarpıntı ": "{{carpinti}}",
        "Ortopne": "{{ortopne}}",
        "PND": "{{pdn}}",
        "Tüberküloz öyküsü ": "{{tb}}"
      }
    },
    "Dolaşım": {
      "type": "chip",
      "offers": {
        "Transfüzyon ": "{{tfx}}",
        "Hipertansiyon": "{{ht}}",
        "Kansızlık öyküsü ": "{{kansizlik}}",
        "Burun kanaması": "{{burunkanamasi}}",
      }
    },
    "Sindirim": {
      "type": "chip",
      "offers": {
        "Karın ağrısı": "{{karinagrisi}}",
        "Bulantı": "{{bulanti}}",
        "Kusma ": "{{kusma}}",
        "Hematemez": "{{hematemez}}",
        "Hematokezya": "{{hematokezya}}",
        "İshal ": "{{ishal}}",
        "Kabızlık ": "{{kabizlik}}",
        "Anal ağrı ": "{{analagri}}",
        "Hemoroid": "{{hemoroid}}",
      }
    },
    "Genitoüriner": {
      "type": "chip",
      "offers": {
        "Genital ülser ": "{{genitalülser}}",
        "Hematüri": "{{hematüri}}",
        "Dizüri": "{{dizüri}}",
        "Poliüri": "{{poliüri}}",
        "Pollaküri": "{{Pollaküri}}",
        "İdrar tutamama ": "{{idrar}}",
        "Noktüri": "{{Noktüri}}",
        "Genital akıntı ": "{{genitalakinti}}",
        "Testis ağrısı ": "{{testisagrisi}}",
        "Disparoni": "{{disparoni}}",
        "Adet Düzeni": "{{adet}}",
      }
    },
    "Nörolojik": {
      "type": "chip",
      "offers": {
        "Baş ağrısı ": "{{basagrisi}}",
        "Baş dönmesi ": "{{basdonmesi}}",
        "İşitme kaybı ": "{{isitmekaybi}}",
        "Yutma güçlüğü ": "{{yutma}}",
        "Uykusuzluk ": "{{uykusuzluk}}",
        "Konvülsiyon": "{{konvülsiyon}}",
        "Tremor ": "{{tremor}}",
        "Senkop": "{{senkop}}",
      }
    },
    "Hareket Sistemi": {
      "type": "chip",
      "offers": {
        "Eklem ağrıları": "{{eklemagri}}",
        "Hareket kısıtlılığı": "{{hareketkisit}}",
        "Bel ağrısı ": "{{belagri}}",
      }
    },
    "Cilt ve ekstremite": {
      "type": "chip",
      "offers": {
        "Döküntü ": "{{dokuntu}}",
        "Ödem ": "{{odem}}",
        "Sarılık  	": "{{sarilik}}",
        "Solukluk ": "{{solukluk}}",
        "Renk değişikliği": "{{renkdegisikligi}}",
      }
    },
    "Endokrin": {
      "type": "chip",
      "offers": {
        "Sıcak intoleransı": "{{sicakintolerans}}",
        "Soğuk intoleransı": "{{sogukintolerans}}",
        "DM": "{{dm}}"
      }
    },
  };
  Map<String, Map> fizikMuayene = {   
     "Genel Durum": {
      "type": "Text",
      "offers": {
        {"Kardeş Çocukları", "Kuzen Çocukları"},
        {"Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{akraba_evliligi}}"
    },    "Kan Basıncı": {
      "type": "Text",
      "offers": {
        {"Kardeş Çocukları", "Kuzen Çocukları"},
        {"Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{akraba_evliligi}}"
    },    "Nabız": {
      "type": "Text",
      "offers": {
        {"Kardeş Çocukları", "Kuzen Çocukları"},
        {"Kalp Hastalığı", "Hipertansiyon", "Diyabet"}
      },
      "value": {},
      "label": "{{akraba_evliligi}}"
    },};
  Map<String, Map> ozet = {"": {}};
  Map<String, Map> labs = {"": {}};





  Future<String> writeDocument() async {
    for (var i in doktorBilgileri.entries) {
      todowrite.addAll({i.value["label"]: i.value["value"]});
    }

    var header = await (await GoogleSignIn(scopes: [
      "https://www.googleapis.com/auth/drive.file",
      "https://www.googleapis.com/auth/drive.readonly",
      "https://www.googleapis.com/auth/documents"
    ]).signInSilently())!
        .authHeaders;

    // FirebaseAuth.instance.currentUser.
    // print("load document");

    final client = GoogleAuthClient(header);
    final driveApi = drive.DriveApi(client);
    //var id = "1Pd9J1usOc8QK7herksr8WPyf2z_7mnpF31okRS-LwUc";
    var id = "1tzSfX3J_-U_Oei7ko12SOklCJ-Gc4Wrrx0QTcIy0sx0";
    // 1tzSfX3J_-U_Oei7ko12SOklCJ-Gc4Wrrx0QTcIy0sx0
    final api = docsApi.DocsApi(client);

    // docsApi.Document document = docsApi.Document(title:"dolu");
    // footers:  docsApi.Footer(footerId: "hasan"),


    var requestDrive = drive.File(
        name: todowrite["{{hastaAdi}}"].toString() +
            " (" +
            DateTime.now().day.toString() +
            "/" +
            DateTime.now().month.toString() +
            "/" +
            DateTime.now().year.toString() +
            ")");

    Future<int> kkkkk(String newid) async {


      id = newid;
      List<docsApi.Request> request = [];


      for (var i in todowrite.entries) {





        request.add(docsApi.Request(
            replaceAllText: docsApi.ReplaceAllTextRequest(
                containsText: docsApi.SubstringMatchCriteria(
                    matchCase: true, text: i.key),
                replaceText: i.value)));
      }
      if (newid != "") {
        var kurt = docsApi.BatchUpdateDocumentRequest(requests: request);
        await api.documents
            .batchUpdate(kurt, newid)
            .then((value) => null);
        return 1;
      } else {
        return 0;
      }
    }

    for (var i in fileCount()) {
      for (var k in i.values) {
        if (k.containsKey("label")) {
          if (!todowrite.containsKey(k["label"])) {
            todowrite.addAll({k["label"]: ""});
          }
        } else {
          Map<String, String> u = k["offers"];
          for (var c in u.entries) {
            if (!todowrite.containsKey(c.value)) {
              todowrite.addAll({c.value: "bulunmuyor"});
              todowrite.addAll({c.value.replaceAll("}}", "_}}"): ""});
            }

            if (!todowrite.containsKey(c.value.replaceAll("}}", "_}}"))) {
              todowrite.addAll({c.value.replaceAll("}}", "_}}"): ""});
            }
          }
        }
      }
    }
    await driveApi.files.copy(requestDrive, id).then((value) {
     // print(value.name);
      fileid = value.id ?? "";
    });
   //  print(fileid);
    await kkkkk(fileid);
    return "Tamamlandı";

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
}
