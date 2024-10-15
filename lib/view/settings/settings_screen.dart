import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/view/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        fineGoldAppBar: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            SettingsWidget(title: 'Spot Alert',),
            SettingsWidget(title: 'Cash For Gold',),
            SettingsWidget(title: 'Contact Us',),
            SettingsWidget(title: 'Temrs & Conditions ',),
            SettingsWidget(title: 'FAQ ',),
          ],
        ),
      ),
    );
  }
}
