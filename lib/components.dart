import 'package:flutter/material.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.3,
      color: Colors.grey[700],
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
