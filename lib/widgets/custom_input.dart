import 'package:flutter/material.dart';
import 'package:universities/extensions/context_extension.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  const CustomInput(
      {super.key, required this.icon, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: context.screensize.width - 32,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            prefixIcon: Icon(
              icon,
              size: 26,
            ),
            hintText: hintText,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.close,
                size: 24,
              ),
              onPressed: () => controller?.clear(),
            )),
      ),
    );
  }
}
