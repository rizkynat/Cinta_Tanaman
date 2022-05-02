import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'warna_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      home: LayarSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LayarSplash extends StatefulWidget {
  @override
  _LayarSplashState createState() => _LayarSplashState();
}

class _LayarSplashState extends State<LayarSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => onBoarding())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color(0xFF4CAF50),
                  Color(0xFFa3ee5b),
                ])),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    Image.asset('assets/img/logo.png',
                        height: 150.0, width: 150.0),
                    Text(
                      "\nTanaman untuk masa depan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    )
                  ]),
                ])));
  }
}

class onBoarding extends StatefulWidget {
  onBoarding({Key? key}) : super(key: key);

  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  int jumlahCurrentPage = 0;
  String teksButton = 'SKIP';
  PageController? pageController;

  @override
  void iniState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  void getChangedPageAndMover(int page) {
    if (page == 2) {
      setState(() {
        //untuk update UI
        teksButton = 'NEXT';
      });
    } else {
      setState(() {
        teksButton = 'SKIP';
      });
    }
    setState(() {
      jumlahCurrentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 9,
                child: PageView(
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (int page) {
                    getChangedPageAndMover(page);
                  },
                  children: <Widget>[
                    mainView(
                        'assets/img/    image_1.png',
                        'Tumbuhan dapat membantu menambah sumber '
                            'Oksigen bagi bumi'),
                    mainView('assets/img/tutorial_image_2.png', 'Go Green'),
                    mainView(
                        'assets/img/tutorial_image_3.png', 'Ramah Lingkungan')
                  ],
                )),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < 3; i++)
                            if (i == jumlahCurrentPage) ...[
                              pageIndicator(true)
                            ] else
                              pageIndicator(false)
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(teksButton),
            )
          ],
        ),
      ),
    );
  }

  Widget mainView(image, title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            fit: BoxFit.none,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }

  Widget pageIndicator(bool isActive) {
    return Container(
      height: 10,
      width: 30,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isActive ? warnaAktif : warnaTidakaktif,
          borderRadius: BorderRadius.all(
            Radius.elliptical(4, 4),
          ),
        ),
      ),
    );
  }
}
