import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';

class TasbeehCounter extends StatefulWidget {
  const TasbeehCounter({super.key});

  @override
  _TasbeehCounterState createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'عدد التسبيحات',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            AnimatedFlipCounter(
              value: _counter,
              textStyle: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                letterSpacing: -8.0,
                color: Colors.yellow,
                
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: Text("+"),
                    onPressed: _incrementCounter,
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(80, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                const SizedBox(width: 20),
                  ElevatedButton.icon(
                    label: Text("0"),
                    onPressed: _resetCounter,
                    icon: Icon(
                      Icons.refresh,
                      size: 30,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: const Size(80, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),              ],
            ),
          ],
        ),
      ),
    );
  }
}