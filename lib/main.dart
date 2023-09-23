import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

//https://dribbble.com/shots/5728979-Daily-UI-001/attachments

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFffe8e8);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Container(
      constraints: const BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          color: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFffe8e8)),
          image: const DecorationImage(
            image: AssetImage("assets/images/banana_safe.png"),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 600),
        child: Stack(children: [
          LinearPercentIndicator(
            barRadius: const Radius.circular(30),
            animation: true,
            animationDuration: 1500,
            onAnimationEnd: () {
              Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => const LoginPage()));
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                  child: const LoginPage()));
            },
            width: MediaQuery.of(context).size.width - 100,
            lineHeight: 35.0,
            percent: 1,
            progressColor: const Color(0xFFffd149),
            backgroundColor: const Color(0xFFffe8e8),
          ),
          Container(
            padding: const EdgeInsets.only(top: 6, right: 5),
            width: MediaQuery.of(context).size.width - 100,
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor: Colors.transparent,
                    enableFeedback: false,
                    side: const BorderSide(color: Color(0xFF635281), width: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                child: const Text("")),
          )
        ]),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const yellow = Color(0xFFffd149);
    const purple = Color(0xFF402a64);
    const background = Color(0xFFf6ffff);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFf6ffff),
      statusBarIconBrightness: Brightness.dark,
    ));

    const defaultTextStyle =
        TextStyle(fontSize: 14, color: purple, fontWeight: FontWeight.w500);
    const textFieldTextStyle =
        TextStyle(fontSize: 15, color: purple, fontWeight: FontWeight.w500);
    const textFieldHintStyle = TextStyle(
        fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500);

    const focusedBorder = OutlineInputBorder(
        borderSide:
            BorderSide(color: purple, style: BorderStyle.solid, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30)));

    const regularBorder = OutlineInputBorder(
        borderSide:
            BorderSide(color: Colors.grey, style: BorderStyle.solid, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(30)));

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: MaterialStateColor.resolveWith((states) => background),
            image: const DecorationImage(
              alignment: Alignment.bottomLeft,
              image: AssetImage("assets/images/banana_rotate.png"),
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(12)),
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return yellow.withOpacity(
                                0.8); // Color when the button is pressed
                          }
                          return yellow; // Default color for the button
                        }),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                          decoration: TextDecoration.none,
                        )),
                      ),
                      child: const Text(
                        "Sign up",
                        style: defaultTextStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          splashFactory: NoSplash.splashFactory,
                          textStyle: MaterialStateProperty.all(const TextStyle(
                              decoration: TextDecoration.none))),
                      child: const Text(
                        "Sign in",
                        style: defaultTextStyle,
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                "Sign up",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: purple,
                    fontSize: 40,
                    fontWeight: FontWeight.w900),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 25),
                child: Text(
                  "To join the banana lovers community.",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: purple,
                      fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Your name",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      style: textFieldTextStyle,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: -4),
                          hintText: "Name",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: focusedBorder,
                          enabledBorder: regularBorder,
                          hintStyle: textFieldHintStyle),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "E-mail",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      style: textFieldTextStyle,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: -4),
                          hintText: "E-mail",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: focusedBorder,
                          enabledBorder: regularBorder,
                          hintStyle: textFieldHintStyle),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      style: textFieldTextStyle,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: -4),
                          hintText: "Password",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: focusedBorder,
                          enabledBorder: regularBorder,
                          hintStyle: textFieldHintStyle),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    width: MediaQuery.of(context).size.width - 100,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: yellow,
                            enableFeedback: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: const Text("")),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    width: MediaQuery.of(context).size.width - 100,
                    child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: Colors.transparent,
                            enableFeedback: false,
                            side: const BorderSide(color: purple, width: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 17, color: purple),
                        )),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.orange, width: 3))),
                child: TextButton(
                  onPressed: () {},
                  style:
                      const ButtonStyle(splashFactory: NoSplash.splashFactory),
                  child: const Text(
                    "I'm already registered",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
