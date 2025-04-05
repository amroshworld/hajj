import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hajj/jadwal_and_manask_al_hajj_page.dart';
import 'package:hajj/main_page.dart';
import 'package:hajj/muslium_corner_page.dart';
import 'package:hajj/personal_info_page.dart';
import 'package:hajj/helpful_numbers_page.dart';
import 'package:hajj/travel_instructions_page.dart';

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
      home: const MyHomePage(title: 'زاد الحجاج'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const List<BottomNavigationBarItem>
bottomNavigationBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.house),
    label: 'الرئيسية',
  ), // Changed
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.calendar),
    label: 'جدول و مناسك الحج',
  ), // Changed - using a calculator icon from Font Awesome as an example, you might want a different one
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.plane),
    label: 'تعليمات السفر',
  ), // Changed - using a plus icon, adjust as needed
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.personPraying),
    label: 'ركن المسلم',
  ),
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.phone),
    label: 'أرقام تهمك',
  ),
  BottomNavigationBarItem(
    icon: FaIcon(FontAwesomeIcons.info),
    label: 'بياناتي',
  ),
];

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(widget.title, textDirection: TextDirection.rtl),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.teal,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
