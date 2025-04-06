import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:hajj/screens/jadwal_and_manask_al_hajj_page.dart';
import 'package:hajj/main_page.dart';
import 'package:hajj/screens/muslium_corner_page.dart';
import 'package:hajj/screens/personal_info_page.dart';
import 'package:hajj/screens/helpful_numbers_page.dart';
import 'package:hajj/screens/travel_instructions_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const MainPage(),
    const JadwalAndManaskAlHajjPage(),
    const TravelInstructionsPage(),
    const MusliumCornerPage(),
    const HelpfulNumbersPage(),
    const PersonalInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor:
                    Colors.grey[800]!, // tab button ripple color when pressed
                hoverColor: Colors.grey[700]!, // tab button hover color
                haptic: true, // haptic feedback
                tabBorderRadius: 15,
                tabActiveBorder: Border.all(
                  color: Colors.black,
                  width: 1,
                ), // tab button border
                tabBorder: Border.all(
                  color: Colors.grey,
                  width: 1,
                ), // tab button border
                tabShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
                ], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 900), // tab animation duration
                gap: 8, // the tab button gap between icon and text
                color: Colors.grey[800], // unselected icon color
                activeColor: Colors.purple, // selected icon and text color
                iconSize: 24, // tab button icon size
                tabBackgroundColor: Colors.purple.withOpacity(
                  0.1,
                ), // selected tab background color
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ), // navigation bar padding
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs: [
                  GButton(icon: LineIcons.home, text: 'الرئيسية'),
                  GButton(icon: LineIcons.calendar, text: 'جدول و مناسك الحج'),
                  GButton(icon: LineIcons.plane, text: 'تعليمات السفر'),
                  GButton(icon: LineIcons.user, text: 'ركن المسلم'),
                  GButton(icon: LineIcons.phone, text: 'أرقام تهمك'),
                  GButton(icon: LineIcons.info, text: 'بياناتي'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
