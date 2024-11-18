import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../forgot_password.dart';
import '../logout.dart';
import '../variables.dart';

class Admin_Classs extends StatefulWidget {
  const Admin_Classs({super.key});

  @override
  State<Admin_Classs> createState() => _Admin_ClasssState();
}

class _Admin_ClasssState extends State<Admin_Classs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff686666),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset("Assets/Svg/ci_menu-alt-05.svg"),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Admin Information",
                style: GoogleFonts.poppins(
                  color: const Color(0xff1A1363),
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 330,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SvgPicture.asset("Assets/Svg/PersonCircle.svg"),
                    ),
                    const SizedBox(
                      height: 150,
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text("Update Profile"),
                          SizedBox(height: 10),
                          Text("Username : \t\tnaimish paghalai"),
                          SizedBox(height: 10),
                          Text("Contact no : \t\t 9537568197     "),
                          SizedBox(height: 10),
                          Text("Email Address : \nnemishpaghadal@gmail.com"),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent.shade700,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text("Edit"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("Assets/Images/logo_01.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent.shade700,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: SvgPicture.asset("Assets/Svg/PersonCircle.svg",
                    width: 70, height: 70),
              ),
              Text(
                "Administrator Name",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 23,
                ),
              ),
              Text(
                "nemishpaghadal@gmail.com",
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.80),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                      Admin_NavigateToPage(
                          index, context); // Navigate to the selected page
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              icon[index],
                              height: 25,
                              width: 25,
                              color: selectedIndex == index
                                  ? Colors.blue.shade700
                                  : Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              name[index],
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.blue.shade700
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return ForgotPassword();
                    },
                  ));
                },
                child: Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.password_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Forgot password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  logincheck = false;
                  await GoogleSignIn().signOut();
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SuccesfulLoginOut();
                      },
                    ));
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("Assets/Svg/logout.svg"),
                    SizedBox(width: 8),
                    Text("Log Out",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
