import '/DataTypes/patientFiles.dart';
import '/omunotexam/res/customColors.dart';
import '/widgets/patientChips.dart';
import 'package:flutter/material.dart';

import '../widgets/patientListTile.dart';
import '../widgets/uploadPopUp.dart';

class FileFill extends StatefulWidget {
  const FileFill({Key? key}) : super(key: key);

  @override
  _FileFillState createState() => _FileFillState();
}

class _FileFillState extends State<FileFill> {
  PatientFiles newFile = PatientFiles();
  late List<Map<String, Map>> fileCount;
  List pageController = [];
  PageController tabController = PageController();
  bool newbool = true;
  @override
  void initState() {
    fileCount = newFile.fileCount();
 

    super.initState();
  }

  @override
  void dispose() {
    for (var i in pageController) {
      i.dispose();
    }
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.atention,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Bitir"),
        onPressed: () {
          UpLoad.createAlertDialog(context,
              visibility: false,
              baslik: "Lütfen Bekleyin",
              aciklama: "Hasta Dosyası Yüklenirken Lütfen Bekleyin");
          newFile.writeDocument().then((value) {
            Navigator.of(context).pop();
            UpLoad.createAlertDialog(context,
                visibility: true,
                url:
                    "https://docs.google.com/document/d/${newFile.fileid}/edit?usp=sharing",
                baslik: "Dosya Yüklendi",
                aciklama: "Dosya Başarıyla yüklendi, ");
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
              onPressed: () {
                // setState(() {
                // fileCount=newFile.fileCount();
                // });
                print(tabController.initialPage);

                pageController[tabController.page!.toInt()].previousPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceInOut);
              },
              child: const Text("önceki")),
          ElevatedButton(
              onPressed: () {
               // print(tabController.initialPage);

                pageController[tabController.page!.toInt()].nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceInOut);
              },
              child: const Text("sonraki"))
        ]),
      ),
      body: PageView.builder(
        controller: tabController,
        scrollDirection: Axis.horizontal,
        itemCount: fileCount.length,
        itemBuilder: (context, div) {
          pageController.add(PageController());

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    CustomColors.atention,
                    CustomColors.background,
                    Color.fromARGB(255, 210, 224, 247)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              ),
              Row(
                children: [Column()],
              ),
              newbool
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "Burada yazılı bilgilerle hızlıca dosyayı doldur ve notlarını al, daha sonra düzenle ve tamamla. Hızlıca işin bitsin"),
                          ElevatedButton(
                              style: ButtonStyle(
                                overlayColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.red;
                                  }
                                  return Colors.orange;
                                }),
                                shadowColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Colors.white;
                                  }
                                  return Colors.white;
                                }),
                                splashFactory: NoSplash.splashFactory,
                                shape:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const StadiumBorder(
                                      side: BorderSide(),
                                    );
                                  }
                                  return const StadiumBorder();
                                }),
                                side:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return const BorderSide(color: Colors.red);
                                  }
                                  return const BorderSide(
                                      color: CustomColors.atention);
                                }),
                                elevation:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return 0;
                                  }
                                  return 0;
                                }),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return CustomColors.softPink;
                                  }
                                  return Colors.transparent;
                                }),
                              ),
                              child: const Text("Yeni Dosya Oluştur"),
                              onPressed: () {
                                setState(() {
                                  newbool = false;
                                });
                              }),
                        ],
                      ),
                    )
                  : PageView.builder(
                      controller: pageController[div],
                      allowImplicitScrolling: true,
                      scrollDirection: Axis.vertical,
                      itemCount: fileCount[div].entries.length,
                      itemBuilder: ((context, index) {
                        // print("object: " +
                        //         fileCount[div]
                        //             .entries
                        //             .elementAt(index)
                        //             .value["type"] ==
                        //     "chip");
                        return fileCount[div]
                                    .entries
                                    .elementAt(index)
                                    .value["type"] ==
                                "chip"
                            ? PatientChips(
                                pageController: pageController[div],
                                focus: true,
                                setstate: ilginc,
                                file: newFile,
                                tileEvent:
                                    fileCount[div].entries.elementAt(index))
                            : PatientListTile(
                                pageController: pageController[div],
                                focus: true,
                                setstate: ilginc,
                                file: newFile,
                                tileEvent:
                                    fileCount[div].entries.elementAt(index));
                      }),
                    ),
            ],
          );
        },
      ),
    );
  }

  void ilginc(String value, String text) {
    //   setState(() {
    //  fileCount = [PatientFiles.hastaBilgileri];

    //   });
  }
}
