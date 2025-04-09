// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:line_icons/line_icons.dart';
import 'package:hajj/screens/jadwal_and_manask_al_hajj_page.dart';
import 'package:hajj/main_page.dart';
import 'package:hajj/screens/muslium_corner_page.dart';
import 'package:hajj/screens/personal_info_page.dart';
import 'package:hajj/screens/helpful_numbers_page.dart';
import 'package:hajj/screens/travel_instructions_page.dart';

void main() async {
  await initializeDateFormatting('ar_DZ', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF121212),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFFBB86FC),
          onSecondary: Color(0xFF000000),
          error: Color(0xFFCF6679),
          onError: Color(0xFF000000),
          surface: Color(0xFF121212),
          onSurface: Color(0xFFFFFFFF),
        ),
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
     TravelInstructionsPage(),
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
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8,
              ),
              child: GNav(                rippleColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                hoverColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                haptic: true,
                tabBorderRadius: 20,
                tabActiveBorder: Border.all(color: Theme.of(context).colorScheme.secondary, width: 2),
                curve: Curves.easeOutExpo,
                duration: const Duration(milliseconds: 300),
                gap: 8,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                activeColor: Theme.of(context).colorScheme.secondary,
                iconSize: 24,
                tabBackgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                selectedIndex: _selectedIndex,
                onTabChange: (index) => setState(() => _selectedIndex = index),
                tabs: [
                  GButton(icon: LineIcons.home, text: 'الرئيسية'),
                  GButton(icon: LineIcons.calendar, text: 'جدول و مناسك الحج'),
                  GButton(icon: LineIcons.plane, text: 'التوعية الصحية للحاج'),
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
