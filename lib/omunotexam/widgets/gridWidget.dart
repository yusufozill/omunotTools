import 'package:flutter/material.dart';
import '/omunotexam/res/customColors.dart';

class GridWidget extends StatelessWidget {
  var route;
  String string;
  String falseString;
  bool boolean;
  GridWidget({
    Key? key,
    required this.route,
    required this.string,
    required this.falseString,
    required this.boolean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              if (boolean) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => route,
                ));
              }
            },
            style: ButtonStyle(

              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (!boolean) {
                  return CustomColors.unfocus;
                }
                if (states.contains(MaterialState.pressed)) {
                  return CustomColors.softPink;
                }
                return CustomColors.gridContainer;
              }),
              // elevation:  MaterialStateProperty.resolveWith((states) {
              // if(states.contains(MaterialState.pressed)){
              //   return 50;
              // }
              //    return 50;
              // }),
              fixedSize: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Size(240, 100);
                }
                return const Size(240, 100);
              }),

              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return 50;
                }
                return 50;
              }),
              shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ))
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                string,
                style: const TextStyle(fontSize: 25, color: CustomColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          boolean
              ? const Text("")
              : SizedBox(
                  width: 240,
                  child: Text(
                    "*" + falseString,
                    style: const TextStyle(
                        fontSize: 18, color: CustomColors.atention),
                    textAlign: TextAlign.center,
                  )),
        ],
      ),
    );
  }
}
