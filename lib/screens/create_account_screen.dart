import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_appbar.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_text_for_textfield.dart';
import 'package:cordinate_sns_app/widgets/neumorphic_custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String _userName = "";
  String _email = "";
  String _password = "";
  String _reconfirmPassword = "";
  String _profileImageUrl = "";
  String _imagePath = "";
  bool _isSelectedProfileImage = false;
  final _imagePicker = ImagePicker();

  Future<String> _registerAccountToAuth(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return newUser.user!.uid;
    } catch (e) {
      print("Failed to create user account：$e");
      return "";
    }
  }

  Future<void> _registerUserInfoToFirestore(String uid, String userName) async {
    if (uid.isNotEmpty) {
      CollectionReference _users =
          FirebaseFirestore.instance.collection('users');
      return _users
          .doc(uid)
          .set({
            'uid': uid,
            'userName': userName,
            "profileImageUrl": this._profileImageUrl
          })
          .then((value) => print("Succeed to add user info to Firestore."))
          .catchError(
              (error) => print('Failed to add user info to Firestore.：$error'));
    }
  }

  Future<void> _uploadProfileImageToFireStorage(String uid) async {
    late File file;
    if (this._imagePath.isEmpty) {
      file = await getImageFileFromAssets("user.png");
    } else {
      file = File(this._imagePath);
    }
    try {
      final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
      final TaskSnapshot storedImage = await _firebaseStorage
          .ref(uid)
          .child('profileImage.jpeg')
          .putFile(file);
      await downloadImageFromFireStorage(storedImage);
    } catch (e) {
      print('Failed to upload profile image to FireStorage.');
    }
  }

  Future<void> downloadImageFromFireStorage(TaskSnapshot storedImage) async {
    final String downloadUrl = await storedImage.ref.getDownloadURL();
    this._profileImageUrl = downloadUrl;
  }

  void createAccount(String userName, String email, String password,
      String reconfirmPassword, BuildContext context) async {
    if (password == reconfirmPassword) {
      Future<String?> future = _registerAccountToAuth(email, password);
      await future.then((uid) => _uploadProfileImageToFireStorage(uid!));
      await future.then((uid) => _registerUserInfoToFirestore(uid!, userName));
      Navigator.pop(context);
    }
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('images/$path');
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  Future _getImageFromGallery() async {
    final _pickedFile =
        await this._imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (_pickedFile != null) {
        this._isSelectedProfileImage = true;
        this._imagePath = _pickedFile.path;
      } else {
        this._isSelectedProfileImage = false;
      }
    });
  }

  Widget _displayProfileImage() {
    if (this._isSelectedProfileImage) {
      return Image.file(
        File(_imagePath),
        fit: BoxFit.cover,
      );
    } else {
      return Image(image: AssetImage('images/user.png'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: NeumorphicCustomAppBar(
          leading: Container(),
          title: "Coordinect",
          fontSize: 30.0,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomSpace),
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Neumorphic(
                        padding: _isSelectedProfileImage
                            ? EdgeInsets.all(0)
                            : EdgeInsets.all(20),
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.circle(),
                          depth: NeumorphicTheme.embossDepth(context),
                        ),
                        child: _displayProfileImage(),
                      ),
                    ),
                    onTap: () async {
                      await _getImageFromGallery();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: NeumorphicText(
                      "プロフィール画像を選択",
                      style: NeumorphicStyle(color: Colors.black54),
                      textStyle: NeumorphicTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  NeumorphicTextForTextField(
                    text: "ユーザ名を入力してください",
                    color: Colors.black54,
                  ),
                  NeumorphicTextField(
                    isPassword: false,
                    hint: "",
                    onChanged: (userName) {
                      this._userName = userName;
                    },
                  ),
                  NeumorphicTextForTextField(
                    text: "メールアドレスを入力してください",
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
                    text: "パスワードを入力してください",
                    color: Colors.black54,
                  ),
                  NeumorphicTextField(
                    isPassword: true,
                    hint: "",
                    onChanged: (password) {
                      this._password = password;
                    },
                  ),
                  NeumorphicTextForTextField(
                    text: "確認用パスワードを入力してください",
                    color: Colors.black54,
                  ),
                  NeumorphicTextField(
                    isPassword: true,
                    hint: "",
                    onChanged: (reconfirmPassword) {
                      this._reconfirmPassword = reconfirmPassword;
                    },
                  ),
                  NeumorphicCustomButton(
                    text: "アカウント作成",
                    color: Colors.black54,
                    onPressed: () => createAccount(
                      this._userName,
                      this._email,
                      this._password,
                      this._reconfirmPassword,
                      context,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
