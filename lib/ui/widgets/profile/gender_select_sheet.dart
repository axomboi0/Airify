import 'package:flutter/material.dart';


class GenderSelectSheet extends StatelessWidget {
  final Function(String) onSelect;


  const GenderSelectSheet({super.key, required this.onSelect});


  @override
  Widget build(BuildContext context) {
    final genders = [
      "He / Him",
      "She / Her",
      "They / Them",
      "Prefer not to say",
    ];


    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF181A1F),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Select Gender",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 18),


          ...genders.map((g) => ListTile(
            title: Text(g, style: const TextStyle(color: Colors.white)),
            onTap: () {
              onSelect(g);
              Navigator.pop(context);
            },
          )),
        ],
      ),
    );
  }
}