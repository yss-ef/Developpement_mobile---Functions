import "package:flutter/material.dart";

Card voiture_card(String title, String url, double width, double height){
  return Card(
    elevation: 10,
    child: Container(
      padding: EdgeInsets.only(left: 10, top: 7),
      width:width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(url),
        fit:BoxFit.cover),
      ),
      child: Text(title, style: TextStyle(
        fontSize: 20, fontFamily: "mundia1",color:Colors.white70
      ))
    ),
  );
}