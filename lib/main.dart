import 'package:flutter/material.dart';
import 'components/voiture.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ICON&Card"), backgroundColor: Colors.pink,),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  voiture_card("MundiaCart", "assets/images/bmw.jpg",double.infinity,150),
                  SizedBox(height: 5),
                  voiture_card("AUTRE_TEXT", "assets/images/q3.jpg",double.infinity,150)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
