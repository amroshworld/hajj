import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpfulNumbersPage extends StatelessWidget {
  const HelpfulNumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> hospitals = [
      {
        "name": "مستشفى النور التخصصي",
        "number": "+966125463000",
        "specialty": "جميع التخصصات"
      },
      {
        "name": "مستشفى الولادة والأطفال",
        "number": "+966125722222",
        "specialty": "أطفال, نساء وولادة"
      },
      {
        "name": "مدينة الملك عبد الله الطبية",
        "number": "+966125640000",
        "specialty": "باطنة, جراحة, رمد, اطفال, نساء وولادة, قلب , اورام"
      },
      {
        "name": "مستشفى الملك فيصل",
        "number": "+966125433333",
        "specialty": "جميع التخصصات"
      },
      {
        "name": "مستشفى الملك عبد العزيز",
        "number": "+966125741111",
        "specialty": "غسيل كلوي, مخ واعصاب , عظام , جراحة"
      },
      {
        "name": "مستشفى حراء العام",
        "number": "+966125473333",
        "specialty": "باطنة, جراحة, رمد, اطفال, نساء وولادة, قلب , اورام"
      },
      {
        "name": "مستشفى طوارئ اجياد",
        "number": "+966125734444",
        "specialty": "طوارئ, رعاية مركزة"
      },
      {
        "name": "مستشفى طوارئ الحرم",
        "number": "+966125735555",
        "specialty": "طوارئ"
      },
      {
        "name": "عيادات الحرم 1",
        "number": "+966125736666",
        "specialty": "طوارئ"
      },
      {
        "name": "عيادات الحرم 2",
        "number": "+966125737777",
        "specialty": "طوارئ"
      },
      {
        "name": "عيادات الحرم 3",
        "number": "+966125738888"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("الأرقام الهامة"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          final hospital = hospitals[index];
          return Directionality(
            textDirection: TextDirection.rtl,
            child: GestureDetector(
              onTap: () async {
  // Safely get the phone number
  final String? phoneNumber = hospital['number']; // Assuming it's stored as a String

  if (phoneNumber != null && phoneNumber.isNotEmpty) {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Show error if launching specifically failed
      if (context.mounted) { // Check if the widget is still in the tree
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text('Could not launch phone dialer for $phoneNumber')));
      }
    }
  } else {
    // Show error if the phone number is missing or empty
    if (context.mounted) { // Check if the widget is still in the tree
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Phone number is not available.')));
    }
  }
},
              child: ListTile(
                  title: Text(hospital["name"]!),
                  subtitle: Text("${hospital["specialty"]!} - ${hospital["number"]!}")),
            ),
          );
        },
      ),
    );
  }
}
