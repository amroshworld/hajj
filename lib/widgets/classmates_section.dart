import 'package:flutter/material.dart';

class ClassmatesSection extends StatefulWidget {
  const ClassmatesSection({super.key});

  @override
  State<ClassmatesSection> createState() => _ClassmatesSectionState();
}

class _ClassmatesSectionState extends State<ClassmatesSection> {
  List<String> classmateNames = [
    'Ali', 'Fatima', 'Ahmed', 'Aisha', 'Omar', 'Sara', 'Abdullah', 'Hana', 'Yousef', 'Layla'
  ];
  bool isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'زملاء المجموعة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: _toggleExpansion,
              child: Text(
                isExpanded ? 'View Less' : 'View All',
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
          ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: classmateNames.length,
            itemBuilder: (context, index)  {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://ik.imagekit.io/uynu9hytj/images.jpeg?updatedAt=1744220008547${index + 5}',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      classmateNames[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
