import 'package:cordinate_sns_app/screens/create-recruitment-of-coordination.dart';
import 'package:cordinate_sns_app/screens/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_text_for_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    void login(String email, String password) async {
      print("Login");
      FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateRecruitmentOfCoordination(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          title: "Login",
          fontSize: 30.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicTextForTextField(
              text: 'Emailアドレスを入力してください',
              color: Colors.black54,
            ),
            NeumorphicTextField(
              isPassword: false,
              hint: "",
              onChanged: (email) {
                this._email = email;
              },
            ),
            NeumorphicTextForTextField(
              text: 'パスワード入力してください',
              color: Colors.black54,
            ),
            NeumorphicTextField(
              isPassword: true,
              hint: "",
              onChanged: (password) {
                this._password = password;
              },
            ),
            NeumorphicCustomButton(
              text: "ログイン",
              color: Colors.black54,
              onPressed: () => login(
                this._email,
                this._password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicTextForTextField(
                    text: "アカウントをお持ちでない場合は",
                    color: Colors.black54,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('アカウント作成画面に遷移');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: NeumorphicTextForTextField(
                      text: "アカウント作成",
                      color: Colors.tealAccent.shade700,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
