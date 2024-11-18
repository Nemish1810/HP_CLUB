import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_hp_club/register_page.dart';

class LearnMorePage extends StatefulWidget {
  const LearnMorePage({super.key});

  @override
  State<LearnMorePage> createState() => _LearnMorePageState();
}

class _LearnMorePageState extends State<LearnMorePage> {
  late ScrollController _scrollController;
  late Timer _timer;
  late Color _dotColor1;
  late Color _dotColor2;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _dotColor1 = Colors.white;
    _dotColor2 = Colors.white.withOpacity(0.60);

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.position.pixels;

        if (currentScroll == maxScroll) {
          _scrollController.animateTo(
            0, // scroll to the beginning
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            currentScroll +
                MediaQuery.of(context).size.width *
                    0.70, // Scroll by the width of the container
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        setState(() {
          _dotColor1 = Colors.white;
          _dotColor2 = Colors.white.withOpacity(0.60);
        });
      } else {
        setState(() {
          _dotColor1 = Colors.white.withOpacity(0.60);
          _dotColor2 = Colors.white;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue.shade900,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "about!!",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Center(
                        child: Text(
                          "sports club for man & women",
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Center(
                        child: Text(
                          "Stamina sports club center provides proper training and conditioning for members who want to improve their gaming.",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            color: Colors.yellow,
                          ),
                          maxLines: 4,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ScrollConfiguration(
                      behavior: ScrollBehavior().copyWith(overscroll: false),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: Colors.blue.shade900,
                                        style: BorderStyle.solid,
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color: Colors.blue.shade900,
                                          style: BorderStyle.solid,
                                          width: 4,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "24",
                                              style: GoogleFonts.poppins(
                                                color: Colors.blue.shade900,
                                                fontSize: 55,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 50.0),
                                                  child: Text(
                                                    "/7",
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          Colors.blue.shade900,
                                                      fontSize: 55,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 18.0),
                                                  child: Text(
                                                    "chat",
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          Colors.blue.shade900,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 18),
                              // Second Container (1 on 1 Coaching)
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                        color: Colors.blue.shade900,
                                        style: BorderStyle.solid,
                                        width: 4,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(35),
                                        border: Border.all(
                                          color: Colors.blue.shade900,
                                          style: BorderStyle.solid,
                                          width: 4,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "1 on 1",
                                              style: GoogleFonts.poppins(
                                                color: Colors.blue.shade900,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                            Text(
                                              "Coaching",
                                              style: GoogleFonts.poppins(
                                                color: Colors.blue.shade900,
                                                fontSize: 40,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: _dotColor1, // Set color dynamically
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              // Add more widgets here
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _dotColor2, // Set color dynamically
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.96,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                        child: SizedBox(
                          child: SvgPicture.asset(
                            "Assets/Svg/backgound-container.svg",
                            color: Colors.blue.shade900,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, right: 13),
                      child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: SvgPicture.asset(
                          "Assets/Svg/JOIN OUR MEMBERSHIP.svg",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.75,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 28.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    "Assets/Svg/Group 70.svg",
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                  ),
                                  SvgPicture.asset(
                                    "Assets/Svg/Group 71.svg",
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: MediaQuery.of(context).size.height *
                                        0.20,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset("Assets/Svg/Group 72.svg",
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20),
                                  SvgPicture.asset("Assets/Svg/Group 73.svg",
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20),
                                ],
                              ),
                              SvgPicture.asset("Assets/Svg/Group 74.svg",
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height: MediaQuery.of(context).size.height *
                                      0.20),
                              const SizedBox(
                                height: 30,
                                width: double.maxFinite,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.height * 1.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "COACHES",
                      style: GoogleFonts.play(
                        fontSize: 45,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff322D2D),
                        height: 1,
                        letterSpacing: 1,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width * 0.66,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffB8B3EC),
                            ),
                          ),
                          Positioned(
                            top: -25,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.23,
                              width: MediaQuery.of(context).size.width * 0.23,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "Assets/Images/logo_01.jpeg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Text(
                              "Coach Marten",
                              style: GoogleFonts.numans(
                                color: const Color(0xff1A1363),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Rectangular container
                          SizedBox(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height * 0.40,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width * 0.66,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xffB8B3EC),
                            ),
                          ),
                          //monument Extended
                          Positioned(
                            top: -25,
                            // Move it up by 40 (half of the circular container's height)
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.23,
                              width: MediaQuery.of(context).size.width * 0.23,
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "Assets/Images/logo_01.jpeg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Text(
                              "Coach Marten",
                              style: GoogleFonts.numans(
                                color: const Color(0xff1A1363),
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "Assets/Images/logo_01.jpeg",
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "visit our club",
                      style: GoogleFonts.inter(
                          fontSize: 32,
                          color: Colors.red,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Text(
                            "Email : ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff444444),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "nemishpaghadal@gmail.com",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff444444),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "Contact Number : ",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff444444),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "9537568197",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900,
                              color: const Color(0xff444444),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 60),
                          Text(
                            "OUR SOCIALS",
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w900,
                              color: const Color(0xff0D0D0F),
                              fontSize: 30,
                              letterSpacing: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  "Assets/Svg/ph_instagram-logo-fill.svg",
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 50),
                                SvgPicture.asset(
                                  "Assets/Svg/ic_baseline-facebook.svg",
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const RegisterPage();
                              },
                            ));
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0XFF231898),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text("Register!!!",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                )),
                          ),
                        ),
                      ),
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
}
