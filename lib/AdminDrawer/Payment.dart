import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Home_Screen.dart';
import '../forgot_password.dart';
import '../logout.dart';
import '../variables.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController nameController = TextEditingController();
  String? selectedPlan;
  String? price;
  DateTime? selectedDate;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Payment",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Name of members",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff444444),
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffBCBCBC),
                          ),
                          child: Center(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                border: InputBorder.none,
                                // hintText: "Name",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Date to Join",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff444444),
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000), // Start date
                              lastDate: DateTime(2100), // End date
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xffBCBCBC),
                            ),
                            child: Center(
                              child: Text(
                                selectedDate != null
                                    ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                    : "Select Date",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff444444),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Plan",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff444444),
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffBCBCBC),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              value: selectedPlan,
                              underline: const SizedBox(),
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: "1 Month",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("1 Month"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "3 Months",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("3 Months"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "6 Months",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("6 Months"),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "12 Months",
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("12 Months"),
                                  ),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedPlan = newValue;
                                  price = {
                                    "1 Month": "800",
                                    "3 Months": "2200",
                                    "6 Months": "4300",
                                    "12 Months": "8500",
                                  }[newValue];
                                });
                              },
                              hint: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text("Select Plan"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Price",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff444444),
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffBCBCBC),
                          ),
                          child: Center(
                            child: Text(
                              price != null ? "₹$price" : "Select a plan",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff444444),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                print("name : ${nameController.text}");
                                print("name : $selectedDate");
                                print("name : $selectedPlan");
                                print("name : $price");

                                if (nameController.text.isNotEmpty &&
                                    nameController.text.trim().isNotEmpty &&
                                    selectedPlan != null &&
                                    selectedDate != null) {
                                  await FirebaseFirestore.instance
                                      .collection('payment')
                                      .add({
                                    'name': nameController.text,
                                    'date_to_join':
                                        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                                    'plan': selectedPlan,
                                    'price': price,
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      padding: EdgeInsets.all(10),
                                      behavior: SnackBarBehavior
                                          .floating, // Positions the SnackBar with padding
                                      backgroundColor: Colors.grey
                                          .shade400, // Set background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Add border radius
                                      ),
                                      content: Text(
                                        "Payment Successful",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black, // Text color
                                          fontSize: 16, // Font size
                                        ),
                                      ),
                                    ),
                                  );

                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return HomeScreen();
                                        },
                                      ),
                                    );
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      padding: EdgeInsets.all(10),
                                      behavior: SnackBarBehavior
                                          .floating, // Positions the SnackBar with padding
                                      backgroundColor: Colors.grey
                                          .shade400, // Set background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Add border radius
                                      ),
                                      content: Text(
                                        "Fill all fields!",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black, // Text color
                                          fontSize: 16, // Font size
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff1A1363),
                                ),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return HomeScreen();
                                  },
                                ));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff1A1363),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
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
            Container(
              width: 175,
              height: 175,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/Images/logo_01.jpeg"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
                color: Colors.red,
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
