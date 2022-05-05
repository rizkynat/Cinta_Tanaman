import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.asset(
              'assets/img/dahlia.jpg',
              height: 300,
              width: 300,
            ),
            showImage: true,
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/img/logo.png'),
              ),
              titleText: 'Rizky Nathamael Simbolon',
              subTitleText: 'Bunga Dahlia',
            ),
            content: Text(
                "Dahlia adalah tanaman perdu berumbi yang sifatnya tahunan, berbunga di musim panas sampai musim gugur."),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFAvatar(
                  backgroundColor: GFColors.PRIMARY,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.SECONDARY,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.WARNING,
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.asset(
              'assets/img/melati.jpg',
              height: 300,
              width: 300,
            ),
            showImage: true,
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/img/tutorial_image_1.png'),
              ),
              titleText: 'Karina Stefani',
              subTitleText: 'Bunga Melati',
            ),
            content: Text(
                "Melati merupakan tanaman bunga hias berupa perdu berbatang tegak yang hidup menahun. Melati merupakan genus dari semak dan tanaman merambat dalam keluarga zaitun."),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFAvatar(
                  backgroundColor: GFColors.PRIMARY,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.SECONDARY,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.WARNING,
                  child: Icon(
                    Icons.star_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
