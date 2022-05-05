import 'Animasi/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'beranda.dart';

class LayarLogin extends StatefulWidget {
  const LayarLogin({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;
  @override
  _LayarLoginState createState() => _LayarLoginState();
}

class _LayarLoginState extends State<LayarLogin> {
  var _text = '';
  final email = TextEditingController();
  final kataSandi = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    //bersihkan controller saat widget dihapus
    email.dispose();
    kataSandi.dispose();
    super.dispose();
  }

  String? get _errorKatasandiText {
    final kataSandiText = kataSandi.value.text;
    if (kataSandiText.isEmpty) {
      return 'Kata Sandi tidak boleh kosong';
    }
    return null;
  }

  String? get _errorEmailText {
    final emailOrNoHPText = email.value.text;
    String patterEmail =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    String patternNoHP = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    if (emailOrNoHPText.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!RegExp(patterEmail).hasMatch(emailOrNoHPText)) {
      if (RegExp(patternNoHP).hasMatch(emailOrNoHPText)) {
        return null;
      }
      return 'Format Email salah';
    }
    return null;
  }

  void _submit() {
    setState(() => _submitted = true);
    if (email.value.text == 'rizky@gmail.com' &&
        kataSandi.value.text == 'admin') {
      //jika tidak ada errortext maka submit
      if (_errorEmailText == null) {
        widget.onSubmit(email.value.text);
        _navigateAndDisplaySelection(context);
      }
      if (_errorKatasandiText == null) {
        widget.onSubmit(kataSandi.value.text);
        _navigateAndDisplaySelection(context);
      }
    }else{
      return showAlert(context);
    }
  }

  bool check() {
    if (_errorEmailText != null || _errorKatasandiText != null) {
      return false;
    }
    return email.value.text.isNotEmpty;
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => const FirstRoute()),
    );
  }
  void showAlert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text("Email dan Kata Sandi salah!"),
              ));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/img/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.robotoMono(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(76, 175, 80, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: TextField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          errorText: _submitted
                                              ? _errorEmailText
                                              : null,
                                          labelText: "Email or No.Telp",
                                          hintStyle: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.grey[400]),
                                          )),
                                      onChanged: (_) => setState(() {}),
                                    )),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: kataSandi,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorText: _submitted
                                            ? _errorKatasandiText
                                            : null,
                                        labelText: "Kata Sandi",
                                        hintStyle: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              color: Colors.grey[400]),
                                        )),
                                    onChanged: (_) => setState(() {}),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        2,
                        Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(76, 175, 80, 1),
                                Color.fromRGBO(76, 175, 80, .6)
                              ])),
                          child: ElevatedButton(
                            onPressed: (check() ? _submit : null),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text('Login',
                                style: GoogleFonts.robotoMono(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.5,
                          Text("Lupa Kata Sandi?",
                              style: GoogleFonts.robotoMono(
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 74, 208, 78),
                                    fontWeight: FontWeight.w900),
                              ))),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Belum memiliki akun?",
                                  style: GoogleFonts.robotoMono(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 105, 95, 95),
                                        fontWeight: FontWeight.w900),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "routeName");
                                },
                                child: Text("Daftar",
                                    style: GoogleFonts.robotoMono(
                                      textStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 74, 208, 78),
                                          fontWeight: FontWeight.w900),
                                    )),
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
