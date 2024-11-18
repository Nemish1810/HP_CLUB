import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_hp_club/variables.dart';
import 'Learn_MorePage.dart';
import 'forgot_password.dart';
import 'logout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "Assets/Images/logo_01.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              logincheck == true
                  ? Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child:
                            SvgPicture.asset("Assets/Svg/ci_menu-alt-05.svg"),
                      ),
                    )
                  : Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 230,
                child: Image.asset("Assets/Images/logo_01.jpeg"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Start a better play!",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Come join us!",
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF6A6A33),
                    letterSpacing: .5,
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LearnMorePage();
                    },
                  ));
                },
                child: FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0XFF231898),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text("Learn More",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(250),
                      child: Image.asset(
                        "Assets/Images/logo_01.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                  onTap: () {
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
      ),
    );
  }
}
