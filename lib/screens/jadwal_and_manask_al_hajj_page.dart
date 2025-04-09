import 'package:flutter/material.dart';
import 'package:hajj/widgets/custom_calendar.dart';

class JadwalAndManaskAlHajjPage extends StatefulWidget {
  const JadwalAndManaskAlHajjPage({super.key});

  @override
  State<JadwalAndManaskAlHajjPage> createState() => _JadwalAndManaskAlHajjPageState();
}

class _JadwalAndManaskAlHajjPageState extends State<JadwalAndManaskAlHajjPage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Center(
          child: Text("جدول و مناسك الحج"),
        ),
        CustomCalendar(),
      ],
    );
  }
}