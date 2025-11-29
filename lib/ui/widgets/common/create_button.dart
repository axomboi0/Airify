import 'package:flutter/material.dart';
import '../../screens/create/create_sheet.dart';

class CreateButton extends StatelessWidget {
  final double size;
  final Color color;

  const CreateButton({
    super.key,
    this.size = 28,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          showDragHandle: true,
          backgroundColor: Colors.black,
          isScrollControlled: true,
          builder: (_) => const CreateSheet(),
        );
      },
      child: Icon(Icons.add, size: size, color: color),
    );
  }
}
