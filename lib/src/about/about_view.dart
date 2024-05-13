import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: const Center(
          child: Text('About Page'),
        ));
  }
}
