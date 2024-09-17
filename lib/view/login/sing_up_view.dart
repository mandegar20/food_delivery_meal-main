import 'dart:io';

import 'package:flutter/material.dart';
import 'package:colorful_effects/common/color_extension.dart';
import 'package:colorful_effects/common/extension.dart';
import 'package:colorful_effects/common_widget/round_button.dart';
import 'package:colorful_effects/view/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../common/globs.dart';
// import '../../common/service_call.dart';
import '../../common_widget/round_textfield.dart';
import '../on_boarding/on_boarding_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Text(
                "ایجاد جساب",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "مشخصات خود را برای ایجاد حساب اضافه کنید",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "اسم",
                controller: txtName,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "ایمیل",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "شماره تماس",
                controller: txtMobile,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "آدرس",
                controller: txtAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "رمز",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "تایید رمز",
                controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "ایجاد حساب",
                  onPressed: () {
                    btnSignUp();
                  }),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "قبلا حساب دارید؟ ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "ورود",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void btnSignUp() {
    if (txtName.text.isEmpty) {
      mdShowAlert(Globs.appName, MSG.enterName, () {});
      return;
    }

    if (!txtEmail.text.isEmail) {
      mdShowAlert(Globs.appName, MSG.enterEmail, () {});
      return;
    }

    if (txtMobile.text.isEmpty) {
      mdShowAlert(Globs.appName, MSG.enterMobile, () {});
      return;
    }

    if (txtAddress.text.isEmpty) {
      mdShowAlert(Globs.appName, MSG.enterAddress, () {});
      return;
    }

    if (txtPassword.text.length < 6) {
      mdShowAlert(Globs.appName, MSG.enterPassword, () {});
      return;
    }

    if (txtPassword.text != txtConfirmPassword.text) {
      mdShowAlert(Globs.appName, MSG.enterPasswordNotMatch, () {});
      return;
    }

    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //         email: txtEmail.text, password: txtPassword.text)
    //     .then((value) =>

    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const OnBoardingView(),
    //         )))
    //     .onError(
    //       (error, stackTrace) => mdShowAlert(Globs.appName, MSG.fail, () {}),
    //     );

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: txtEmail.text, password: txtPassword.text)
        .then((userCredential) {
      // Access the newly created user from the userCredential
      var user = userCredential.user;

      // Save additional user information to Firestore
      saveUserInfo(user?.uid, txtName.text, txtAddress.text, txtMobile.text,
          txtEmail.text);

      // Navigate to the OnBoardingView
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingView()),
      );
    }).catchError((error) {
      // Handle any errors that occur during the sign-up process
      mdShowAlert(Globs.appName, MSG.fail, () {});
    });
  }

  Future<void> saveUserInfo(userId, String name, String address,
      String phoneNumber, String email) async {
    try {
      // Create a reference to the user's document in Firestore
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Create a map with the user information
      Map<String, dynamic> userInfo = {
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'email': email,
      };

      // Save the user information to Firestore
      await userRef.set(userInfo);
    } catch (e) {
      // Handle any errors that occur during the saving process
      print('Error saving user information: $e');
    }
  }

//   void serviceCallSignUp(Map<String, dynamic> parameter) {
//     Globs.showHUD();

//     ServiceCall.post(parameter, SVKey.svSignUp,
//         withSuccess: (responseObj) async {
//       Globs.hideHUD();
//       if (responseObj[KKey.status] == "1") {
//         Globs.udSet(responseObj[KKey.payload] as Map? ?? {}, Globs.userPayload);
//         Globs.udBoolSet(true, Globs.userLogin);

//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const OnBoardingView(),
//             ),
//             (route) => false);
//       } else {
//         mdShowAlert(Globs.appName,
//             responseObj[KKey.message] as String? ?? MSG.fail, () {});
//       }
//     }, failure: (err) async {
//       Globs.hideHUD();
//       mdShowAlert(Globs.appName, err.toString(), () {});
//     });
//   }
// }

  // void serviceCallSignUp(Map<String, dynamic> parameter) {
  //   // Globs.showHUD();

  //   // Remove the ServiceCall.post() code block

  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const OnBoardingView(),
  //     ),
  //     (route) => false,
  //   );
  // }
}
