import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  final String userName;
  final String imageUrl;

  const UserProfileHeader({
    Key? key,
    required this.userName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 10),
        Text(
          userName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
