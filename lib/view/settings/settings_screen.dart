import 'package:fine_gold_flutter/common/widgets/custom_app_bar.dart';
import 'package:fine_gold_flutter/view/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body:  Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            SettingsWidget(title: 'Spot Alert',),
            SettingsWidget(title: 'Cash For Gold',),
            GestureDetector(
                onTap: () async {
                  try {
                    final url = Uri.parse("https://finegoldbullion.ca/contact-us/");
                    if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                  throw "Could not launch $url";
                  }
                  } catch (e) {
                  print("Error launching URL: $e");
                  }
                },
                child: SettingsWidget(title: 'Contact Us',)),
            GestureDetector(
                onTap: () async {
                  try {
                    final url = Uri.parse("https://finegoldbullion.ca/about-us/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  } catch (e) {
                    print("Error launching URL: $e");
                  }
                },
                child: SettingsWidget(title: 'Temrs & Conditions ',)),
            GestureDetector(
                onTap: () async {
                  try {
                    final url = Uri.parse("https://finegoldbullion.ca/faqs/");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      throw "Could not launch $url";
                    }
                  } catch (e) {
                    print("Error launching URL: $e");
                  }
                },
                child: SettingsWidget(title: 'FAQ ',)),
          ],
        ),
      ),
    );
  }
}
