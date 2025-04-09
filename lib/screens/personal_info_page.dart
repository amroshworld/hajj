// Suggested code may be subject to a license. Learn more: ~LicenseLog:277346954.
import 'package:flutter/material.dart';
import 'package:hajj/widgets/classmates_section.dart';
import 'package:hajj/widgets/health_Info.dart';
import 'package:hajj/widgets/profile_header.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: const Text('بياناتي', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfileHeader(
                userName: ' سيد حنفي',
                imageUrl:
                    'https://ik.imagekit.io/uynu9hytj/images%20(1).jpeg?updatedAt=1744237265949',
              ),
              const SizedBox(height: 20),
              HealthInfoWidget(),
              const SizedBox(height: 30),
              ClassmatesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
