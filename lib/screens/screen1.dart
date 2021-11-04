import 'package:cordinate_sns_app/screens/create-recuitment-of-coordination.dart';
import 'package:cordinate_sns_app/screens/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_text_for_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_button.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function login = () {
      print("ログイン");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateRecuitmentOfCoordination(),
        ),
      );
    };

    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicCustomAppBar(
          title: "Login Page",
          fontSize: 30.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NeumorphicTextForTextField(
              text: 'ユーザ名を入力してください',
              color: Colors.black54,
            ),
            NeumorphicTextField(
              isPassword: false,
              hint: "",
              onChanged: (lastName) {},
            ),
            NeumorphicTextForTextField(
              text: 'パスワード入力してください',
              color: Colors.black54,
            ),
            NeumorphicTextField(
              isPassword: true,
              hint: "",
              onChanged: (password) {},
            ),
            NeumorphicCustomButton(
              text: "ログイン",
              color: Colors.black54,
              onPressed: login,
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
