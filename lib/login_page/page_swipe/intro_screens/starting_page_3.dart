import 'package:flutter/material.dart';
import 'package:seustudyassist/dashboard/home_page.dart';
import 'package:seustudyassist/login_page/screens/welcome_screen.dart';
import 'package:seustudyassist/login_page/widgets/welcome_button.dart';
import 'package:seustudyassist/widgetFile/bottomnavigationbar.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/pic.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Flexible(
                    flex: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10,
                      ),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                                text: 'Welcome Back!\n',
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                                text: '\n Plese Enter Your Details For Login',
                                style: TextStyle(
                                  fontSize: 20,
                                ))
                          ]),
                        ),
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: welcomeButon(
                            buttonText: 'Start',
                            onTap: WelcomeScreen(),
                            color: Colors.transparent,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
