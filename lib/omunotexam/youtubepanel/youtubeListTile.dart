import '/omunotexam/res/customColors.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class YoutubeListTile extends StatefulWidget {
  Function(String) next;
  String id;
  bool selected;
  YoutubeListTile(
      {Key? key, required this.id, required this.next, required this.selected})
      : super(key: key);
  @override
  State<YoutubeListTile> createState() => _YoutubeListTileState();
}

class _YoutubeListTileState extends State<YoutubeListTile> {
  late Video video;

  String? title;

  String? img;
  @override
  void initState() {
    http.get(Uri.parse(
            "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=${widget.id}&key=AIzaSyD7JDjzH7g_UCYsLVhxgx6Xc7mhPLx64kY"))
        .then((value) {
      if (value.statusCode == 200) {
        // If the call to the server was successful, parse the JSON

        Map<String, dynamic> values = json.decode(value.body);

        
          title = values["items"][0]["snippet"]["title"] ??
              "İsim Yüklenirken Hata Oluştu";
          img = values["items"][0]["snippet"]["thumbnails"]["standart"] ??
              "https://img.youtube.com/vi/${widget.id}/sddefault.jpg";
        
        setState(() {});
      }
    })
 
    
    ;
      
    //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
     ListTile(
        minLeadingWidth: 56,
        selectedTileColor: CustomColors.firebaseGrey,
        textColor: widget.selected ?Colors.black: Colors.white,
        selected: widget.selected,
        selectedColor: CustomColors.black,
        contentPadding: const EdgeInsets.all(8),
        onTap: () {
          widget.next(widget.id);
        },
        focusColor: CustomColors.firebaseAmber,
        title: Text(title ?? ""),
        leading: img == null
            ? const Text("")
            : Image.network(img!,
             loadingBuilder: (a, b, d) {
                return d == null ? b : const SizedBox(width: 56, child: Icon(Icons.video_label_sharp, color: Colors.white, ));
              },
              errorBuilder: (a,b,c) {
                          return const SizedBox(width: 56, child: Icon(Icons.video_label_sharp, color: Colors.white, ));
              },
              )
            
              );
              
  }
}

class Video {}
