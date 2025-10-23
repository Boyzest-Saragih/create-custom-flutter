import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String? judul;
  final String hint;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final Color? borderColor;
  final bool isBorder;

  const CustomDropdownField({
    super.key,
    this.judul,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.borderColor,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (judul != null && judul!.isNotEmpty) ...[
          Text(
            judul!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border:
                isBorder ? Border.all(color: borderColor ?? Colors.grey) : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: value,
              hint: Text(hint, style: const TextStyle(color: Colors.grey)),
              items:
                  items
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
