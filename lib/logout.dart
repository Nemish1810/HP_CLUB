import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Home_Screen.dart';

class SuccesfulLoginOut extends StatefulWidget {
  const SuccesfulLoginOut({super.key});

  @override
  State<SuccesfulLoginOut> createState() => _SuccesfulLoginOutState();
}

class _SuccesfulLoginOutState extends State<SuccesfulLoginOut> {
  @override
  void initState() {
    // TODO: implement initState

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        myuser = user;
        setState(() {});
        print('User is signed in!');
        print('\n\n $myuser}');
      }
    });
    super.initState();
  }

  User? myuser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3E3E3E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 50),
              Text(
                "Logout Successfully !!",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xffF5EBEB),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      await await GoogleSignIn().signOut();
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xffDEBA3B),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "back",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff444444),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image.asset(
                    "Assets/Images/logo_01.jpeg",
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
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
