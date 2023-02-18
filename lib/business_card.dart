import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCard extends StatefulWidget {
  const BusinessCard({super.key});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileImage(),
              customText(text: 'John Doe', fontSize: 22, padding: 4),
              customText(text: 'Software Engineer', fontSize: 18, padding: 2),
              linkPhone(phoneNumber: '555-555-5555'),
              profileLinks(github: 'github.com/john', email: 'jdoe@mail.org'),
            ],
          ),
        ),
      ),
    );
  }

  customText(
      {required String text,
      required double fontSize,
      required double padding}) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'Albert', fontSize: fontSize),
      ),
    );
  }

  profileLinks({required String github, required String email}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          links(url: Uri.https('github.com'), text: github),
          const SizedBox(width: 20.0),
          linksText(email),
        ],
      ),
    );
  }

  links({required Uri url, required String text}) {
    final Uri toLaunch = Uri(scheme: 'https', host: url.host);
    return TextButton(
      onPressed: () => setState(() {
        _launchInWebView(toLaunch);
      }),
      child: linksText(text),
    );
  }

  linkPhone({required String phoneNumber}) {
    return TextButton(
      onPressed: () => setState(() {
        _textMessage(phoneNumber);
      }),
      child: linksText(phoneNumber),
    );
  }

  Text linksText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Albert',
          fontSize: 16,
          decoration: TextDecoration.underline),
    );
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _textMessage(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Widget profileImage() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage('assets/profile.jpg'),
        ),
      ),
    );
  }
}
