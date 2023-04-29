import 'package:flutter/material.dart';
import 'package:universities/extensions/context_extension.dart';
import 'package:universities/screens/university_screen.dart';
import '../models/university.model.dart';

class UniversityListTile extends StatelessWidget {
  const UniversityListTile({
    super.key,
    required this.data,
  });

  final UniversityModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromARGB(255, 241, 241, 241)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://api.dicebear.com/6.x/initials/png?seed=${data.name}'),
          ),
          title: Text(
            data.name!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(data.country!),
          onTap: () => context.navigator(UniversityScreen(data: data)),
        ),
      ),
    );
  }
}
