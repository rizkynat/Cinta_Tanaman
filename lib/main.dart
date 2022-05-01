import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Color.fromRGBO(76, 175, 80, 1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(76, 175, 80, 1),
              Color(0xFFa3ee5b),
            ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Image.asset('assets/img/logo.png', height: 150.0, width: 150.0),
                Text(
                  "Tanaman untuk masa depan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )
              ]),
            ]));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CintaTanaman")),
      body: Center(
          child: Text(
        "Beranda",
        textScaleFactor: 2,
      )),
    );
  }
}
