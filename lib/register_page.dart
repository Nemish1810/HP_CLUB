// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:new_hp_club/signinpage.dart';
//
// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});
//
//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String? selectedRole;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff3E3E3E),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "REGISTER",
//                     style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 40,
//                       letterSpacing: 1.5,
//                       color: const Color(0xffF5EBEB),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.85,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             "Name",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w700,
//                               color: const Color(0xff444444),
//                               fontSize: 20,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10, bottom: 10),
//                             child: Container(
//                               height: 45,
//                               width: MediaQuery.of(context).size.width * 0.70,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: const Color(0xffBCBCBC),
//                               ),
//                               child: const Center(
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 20),
//                                     border: InputBorder.none,
//                                     hintText: "Enter Name",
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "Select Role",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w700,
//                               color: const Color(0xff444444),
//                               fontSize: 20,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10, bottom: 10),
//                             child: Container(
//                               height: 45,
//                               width: MediaQuery.of(context).size.width * 0.70,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: const Color(0xffBCBCBC),
//                               ),
//                               child: Center(
//                                 child: DropdownButton<String>(
//                                   value:
//                                       selectedRole, // This is the currently selected value
//                                   underline:
//                                       const SizedBox(), // Removes default underline
//                                   isExpanded:
//                                       true, // Expands the dropdown to fill the container
//                                   items: const [
//                                     DropdownMenuItem(
//                                       value: "User",
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text("User"),
//                                       ),
//                                     ),
//                                     DropdownMenuItem(
//                                       value: "Admin",
//                                       child: Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 20),
//                                         child: Text("Admin"),
//                                       ),
//                                     ),
//                                   ],
//                                   onChanged: (String? newValue) {
//                                     // Update the selected value
//                                     setState(() {
//                                       selectedRole = newValue!;
//                                       print(selectedRole);
//                                     });
//                                   },
//                                   hint: const Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 20),
//                                     child: Text("Select Role"),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "Phone",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w700,
//                               color: const Color(0xff444444),
//                               fontSize: 20,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10, bottom: 10),
//                             child: Container(
//                               height: 45,
//                               width: MediaQuery.of(context).size.width * 0.70,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 color: const Color(0xffBCBCBC),
//                               ),
//                               child: const Center(
//                                 child: TextField(
//                                   keyboardType: TextInputType.number,
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 20),
//                                     border: InputBorder.none,
//                                     hintText: "Enter Phone Number",
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20, bottom: 15),
//                         child: Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 Navigator.push(context, MaterialPageRoute(
//                                   builder: (context) {
//                                     return const SignInPage();
//                                   },
//                                 ));
//                               });
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.40,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xffDEBA3B),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Submit",
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w700,
//                                     color: const Color(0xff444444),
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20, bottom: 15),
//                         child: Center(
//                           child: GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * 0.40,
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: const Color(0xffFFFADF),
//                                 borderRadius: BorderRadius.circular(30),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Clear Entries",
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w700,
//                                     color: const Color(0xff444444),
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(150),
//                     child: Image.asset(
//                       "Assets/Images/logo_01.jpeg",
//                       height: 142,
//                       width: 142,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_hp_club/Home_Screen.dart';
import 'package:new_hp_club/signinpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? selectedRole;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> registerUser() async {
    print("name : ${nameController.text}");
    print("name : ${phoneController.text}");
    print("name : $selectedRole");
    if (nameController.text.isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        phoneController.text.isNotEmpty &&
        phoneController.text.trim().length == 10 &&
        phoneController.text.trim().isNotEmpty &&
        selectedRole != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SignInPage(
              name: nameController.text,
              phone: phoneController.text,
              role: selectedRole!,
            );
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.all(10),
          behavior:
              SnackBarBehavior.floating, // Positions the SnackBar with padding
          backgroundColor: Colors.grey.shade400, // Set background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Add border radius
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3E3E3E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: Icon(
              CupertinoIcons.xmark,
              color: Colors.grey.shade300,
              size: 20,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "REGISTER",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                      letterSpacing: 1.5,
                      color: const Color(0xffF5EBEB),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Name",
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
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    border: InputBorder.none,
                                    hintText: "Enter Name",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Select Role",
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
                                  value: selectedRole,
                                  underline: const SizedBox(),
                                  isExpanded: true,
                                  items: const [
                                    DropdownMenuItem(
                                      value: "user",
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text("User"),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: "admin",
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text("Admin"),
                                      ),
                                    ),
                                  ],
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedRole = newValue!;
                                    });
                                  },
                                  hint: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text("Select Role"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Phone",
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
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  maxLength:
                                      10, // Sets the maximum number of characters

                                  decoration: const InputDecoration(
                                    counterText:
                                        "", // Removes the default counter text below the TextField
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Enter Phone Number",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Center(
                          child: GestureDetector(
                            onTap: registerUser,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xffDEBA3B),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Submit",
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
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                nameController.clear();
                                phoneController.clear();
                                selectedRole = null;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFFADF),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Clear Entries",
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.asset(
                      "Assets/Images/logo_01.jpeg",
                      height: 142,
                      width: 142,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
