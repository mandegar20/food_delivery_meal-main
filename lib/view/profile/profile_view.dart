import 'dart:io';

import 'package:flutter/material.dart';
import 'package:colorful_effects/common_widget/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_textfield.dart';
import '../more/my_order_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  String? username;

  Future<void> getUserData(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (snapshot.exists) {
        // User data found
        Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;

        // Access specific fields
        username = userData['name'];
        String email = userData['email'];

        String retrievedUsername = userData['name'];

        setState(() {
          username = retrievedUsername; // Update the username variable
        });
        // Process the data as needed
        print('Username: $username');
        print('Email: $email');
      } else {
        // User data not found
        print('User not found');
      }
    } catch (e) {
      // Error occurred
      print('Error getting user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    String uid = '68oRMUYpvQVGwwx71M86VY0hLal2';
    if (user != null) {
      uid = user.uid;
      print('User UID: $uid');
    } else {
      print('User is not signed in.');
    }
    getUserData(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyOrderView()));
                  },
                  icon: Image.asset(
                    "assets/img/shopping_cart.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                Text(
                  "پروفایل",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: TColor.placeholder,
              borderRadius: BorderRadius.circular(50),
            ),
            alignment: Alignment.center,
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(File(image!.path),
                        width: 100, height: 100, fit: BoxFit.cover),
                  )
                : Icon(
                    Icons.person,
                    size: 65,
                    color: TColor.secondaryText,
                  ),
          ),
          TextButton.icon(
            onPressed: () async {
              image = await picker.pickImage(source: ImageSource.gallery);
              setState(() {});
            },
            icon: Icon(
              Icons.edit,
              color: TColor.primary,
              size: 12,
            ),
            label: Text(
              "ویرایش پروفایل",
              style: TextStyle(color: TColor.primary, fontSize: 12),
            ),
          ),
          Text(
            username ?? 'username',
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "خروج از حساب کاربری",
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    ));
  }
}



// Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Name",
          //     hintText: "Enter Name",
          //     controller: txtName,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Email",
          //     hintText: "Enter Email",
          //     keyboardType: TextInputType.emailAddress,
          //     controller: txtEmail,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Mobile No",
          //     hintText: "Enter Mobile No",
          //     controller: txtMobile,
          //     keyboardType: TextInputType.phone,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Address",
          //     hintText: "Enter Address",
          //     controller: txtAddress,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Password",
          //     hintText: "* * * * * *",
          //     obscureText: true,
          //     controller: txtPassword,
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          //   child: RoundTitleTextfield(
          //     title: "Confirm Password",
          //     hintText: "* * * * * *",
          //     obscureText: true,
          //     controller: txtConfirmPassword,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: RoundButton(title: "Save", onPressed: () {}),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),




  //           TextEditingController txtName = TextEditingController();
  // TextEditingController txtEmail = TextEditingController();
  // TextEditingController txtMobile = TextEditingController();
  // TextEditingController txtAddress = TextEditingController();
  // TextEditingController txtPassword = TextEditingController();
  // TextEditingController txtConfirmPassword = TextEditingController();