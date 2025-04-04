import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'زاد الحجاج',
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

const List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), label: 'الرئيسية'), // Changed
  BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.calendar), label: 'جدول و مناسك الحج'), // Changed - using a calculator icon from Font Awesome as an example, you might want a different one
  BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.plane), label: 'تعليمات السفر'), // Changed - using a plus icon, adjust as needed
  BottomNavigationBarItem(
    icon:  FaIcon(FontAwesomeIcons.personPraying),
    label: 'ركن المسلم',
  ),
  BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.info), label: 'بياناتي'),
];

class _MyHomePageState extends State<MyHomePage> {

  int _selectindex=0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: items,
          currentIndex: _selectindex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.teal,
          onTap: (int index) {
            setState(() {
              _selectindex = index ;
            });
          },

      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
