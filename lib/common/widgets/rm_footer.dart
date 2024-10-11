import 'package:flutter/material.dart';

class RMFooter extends StatefulWidget {
  const RMFooter({super.key});

  @override
  State<RMFooter> createState() => _RMFooterState();
}

class _RMFooterState extends State<RMFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey.shade300,
        ),
        const Center(
          child: Text('Copyright © Gewerbe-Control 2024', style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w300
          ),),
        ),
      ],
    );
  }
}
