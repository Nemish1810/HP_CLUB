import 'package:flutter/material.dart';

import 'AdminDrawer/Admin_Profile.dart';
import 'AdminDrawer/DashboardPage.dart';
import 'AdminDrawer/Payment.dart';
import 'AdminDrawer/Plan.dart';
import 'AdminDrawer/UserRegistration.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: 'CustomFont',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subHeading = TextStyle(
    fontFamily: 'CustomFont',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'CustomFont',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: 'CustomFont',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
}

void Admin_NavigateToPage(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
      break;
    case 1:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Admin_Classs()));
      break;
    case 2:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UserRegistration()));
      break;
    case 3:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PlanPage()));
      break;
    case 4:
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Payment()));
      break;
    default:
      break;
  }
}

int selectedIndex = -1;

List<String> icon = [
  "Assets/Svg/Vector.svg",
  "Assets/Svg/svg-4.svg",
  "Assets/Svg/svg-2.svg",
  "Assets/Svg/svg-3.svg",
  "Assets/Svg/CreditCard2Back.svg",
];
List<String> name = [
  "Dashboard",
  "Admin Profile",
  "Registration",
  "Plan",
  "Payment",
];

bool logincheck = false;
