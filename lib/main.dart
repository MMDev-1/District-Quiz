
import 'package:district/controller/datanotifier.dart';
import 'package:district/view/productpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'District Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: 
        ChangeNotifierProvider(
           create:(context) => Data(),
          builder:(context, child){
            return ProductData();
          } ,
          )
     
    );
  }
}
