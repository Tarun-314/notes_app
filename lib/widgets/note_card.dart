
import 'package:notes/style/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
String path="";
Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc){
  path=doc['ipath'];
  String dt=doc['creation_date'].toString().substring(0,10);
  String tit=doc['note_title'].toString();
  return InkWell(
    onTap: onTap,
      child:Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Appstyle.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(8.0),
        ) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(tit!="")Center(
              child:Text(
              doc['note_title'],
              style: Appstyle.mainTitle,
            ),
            ),
            if(tit!="")SizedBox(height: 4.0,),
            Text(dt,style: Appstyle.mainTitle,),
            SizedBox(height: 4.0,),
            if(path!="") buildFileImage(),
            if(path=="")SizedBox(height:8.0),
            if(path=="")Text(doc['note_content'],style: Appstyle.mainContent,
            overflow: TextOverflow.fade,
              maxLines: 3,
            ),
          ],
        ),
      ),
  );
}
Widget buildFileImage(){
  return
    Center(
      child:CircleAvatar(
        radius: 50,
        backgroundImage: FileImage(File(path),),
      )

    );
}