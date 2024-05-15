import 'package:flutter/material.dart';
import 'package:neuro_lab/src/about/about_view.dart';
import 'package:neuro_lab/src/settings/settings_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7, // This is the change
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: const <Widget>[
                  Icon(Icons.settings),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Settings'),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(SettingsView.routeName);
              },
            ),
            ListTile(
              title: Row(
                children: const <Widget>[
                  Icon(Icons.info),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('About'),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed(AboutView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
