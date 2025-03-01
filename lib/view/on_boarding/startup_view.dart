import 'package:flutter/material.dart';
import 'package:colorful_effects/view/login/welcome_view.dart';
import 'package:colorful_effects/view/main_tabview/main_tabview.dart';

import '../../common/globs.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StarupViewState();
}

class _StarupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    welcomePage();
  }

  void welcomePage() {
    if (Globs.udValueBool(Globs.userLogin)) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MainTabView()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/spash-bg2.jpg",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            "assets/img/logo.jpg",
            width: media.width * 0.55,
            height: media.width * 0.55,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
