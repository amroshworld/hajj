import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hajj/main_page.dart';
import 'package:hajj/widgets/tasbeeh_counter.dart';

class MusliumCornerPage extends StatefulWidget {
  const MusliumCornerPage({super.key});

  @override
  State<MusliumCornerPage> createState() => _MusliumCornerPageState();
}

class _MusliumCornerPageState extends State<MusliumCornerPage> {
  late PrayerTimes _prayerTimes;

  @override
  void initState() {
    super.initState();
    final myCoordinates = Coordinates(
      MainPageState().currentLat,
      MainPageState().currentLong,
    ); // Replace with your own location lat, lng.
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;
    _prayerTimes = PrayerTimes.today(myCoordinates, params);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer Times')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrayerTimesWidget(prayerTimes: _prayerTimes),
      ),
    );
  }
}

class PrayerTimesWidget extends StatefulWidget {
  final PrayerTimes prayerTimes;

  const PrayerTimesWidget({super.key, required this.prayerTimes});

  @override
  State<PrayerTimesWidget> createState() => _PrayerTimesWidgetState();
}

class _PrayerTimesWidgetState extends State<PrayerTimesWidget> {
  late PrayerTimes _prayerTimes;

  @override
  void initState() {
    super.initState();
    _calculatePrayerTimes();
  }

  void _calculatePrayerTimes() {
    _prayerTimes = widget.prayerTimes;
    // Debugging: Print prayer times to console
    print("Prayer Times Updated: ${_prayerTimes.fajr}");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "مواقيت الصلاة المحلية",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  _buildPrayerTimeRow("Fajr", _prayerTimes.fajr),
                  _buildPrayerTimeRow("Sunrise", _prayerTimes.sunrise),
                  _buildPrayerTimeRow("Dhuhr", _prayerTimes.dhuhr),
                  _buildPrayerTimeRow("Asr", _prayerTimes.asr),
                  _buildPrayerTimeRow("Maghrib", _prayerTimes.maghrib),
                  _buildPrayerTimeRow("Isha", _prayerTimes.isha),
                  const TasbeehCounter(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: const Color.fromARGB(255, 23, 24, 23),

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "أذكار الصباح والمساء",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0, width: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimeRow(String prayerName, DateTime prayerTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prayerName, style: const TextStyle(fontSize: 16.0)),
          Text(
            DateFormat.jm().format(prayerTime),
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
