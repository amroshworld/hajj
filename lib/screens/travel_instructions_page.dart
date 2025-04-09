import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class TravelInstructionsPage extends StatefulWidget {
  const TravelInstructionsPage({super.key});

  @override
  _TravelInstructionsPage createState() => _TravelInstructionsPage();
}

class _TravelInstructionsPage extends State<TravelInstructionsPage> {
  String healthInstructionsPath = 'assets/pdf/health_instructions.pdf';
  String patientEducationPath = 'assets/pdf/patient_education.pdf';
  String? currentPdfPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Instructions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[100],
                foregroundColor: Colors.black87,
                minimumSize: const Size(250, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                setState(() {
                  currentPdfPath = healthInstructionsPath;
                });
              },
              child: const Text(
                'ملف الارشادات الصحية اثناء الحج',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                 style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black87,
                minimumSize: const Size(250, 60), 
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(30), 
                ),
              ),
              onPressed: () {
                setState(() {
                  currentPdfPath = patientEducationPath;
                });
              },
              child: const Text(
                'توعية صحية ',
                style: TextStyle(fontSize: 25),
              ),
            ),
            if (currentPdfPath != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SfPdfViewer.asset(
                    currentPdfPath!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
