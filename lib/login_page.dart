import 'package:charmello/sign_in.dart';
import 'package:flutter/material.dart';
//https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed
import 'BottomNavigationBarController.dart';
import 'CurrentlyPlaying.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {

  @override
  final bottomNav = new BottomNavigationBarController();
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    FirebaseAuth.instance.currentUser().then((firebaseUser){
      if(firebaseUser != null)
      {
        print('signed in');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return widget.bottomNav;
            },
          ),
        );
      }

    });

    return Scaffold(
      body: Container(
        color: Color(0xffDDE0D9),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/proto_logo.jpg"), height: 150.0),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return widget.bottomNav;
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
