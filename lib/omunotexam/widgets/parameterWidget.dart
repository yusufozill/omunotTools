
import 'package:flutter/material.dart';
import '/omunotexam/res/customColors.dart';

Widget parameterWidget(text, {Color textColor = Colors.white, Color widgetColor = CustomColors.parameter, Icon? icon}) => 

 Padding(
   padding: const EdgeInsets.only(bottom: 8,right: 8,left: 8),
   child: Container(
     
     padding: const EdgeInsets.only(top: 3,bottom: 6,right: 6,left: 6),
     decoration: BoxDecoration(
         color: widgetColor,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight:Radius.circular(12) ),
                      
     ),
                      child: Row(
                        children: [
                         icon?? const Text(""),
                          Text(
                                       text,
                                style:  TextStyle(
                                    fontSize: 18, color: textColor),
                              ),
                            
                          
                        ],
                      ),
                    ),
 );
                