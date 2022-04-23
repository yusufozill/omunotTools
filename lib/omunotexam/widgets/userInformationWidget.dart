import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfoWidget extends StatefulWidget {

  User user;
  UserInfoWidget(Key? key ,{required this.user,}):super(key: key);


  @override
  _UserInfoWidgetState createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {




  @override
  Widget build(BuildContext context) {

    return Container(
              decoration: const BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
              //  backgroundColor: MaterialStateProperty.all(Colors.white),
                //shape: BoxShape
                
                // MaterialStateProperty.all(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(40),
                //   ),
                // ),
              ),
           
              child:  Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  <Widget>[
                  widget.user.photoURL==null ? const Text(""): 
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.network(
                        widget.user.photoURL!,
                      width: 42,
                      ),
                   ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            widget.user.displayName.toString(),
                            style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                            Text(
                           "( "+ widget.user.email.toString()+" )",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),


              
                 ],
                ),
              

            );
  }
}
