import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Text('الرحلات '),
          ),
          SizedBox(height: 20),
          newMethod('الرحلات ', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          newMethod('الفلتره  ', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterScreen.screenRoute);
          }),
        ],
      ),
    );
  }

  Widget newMethod(String title, IconData icon, Function onTabLink) {
    return ListTile(
      leading: Icon(
        Icons.card_travel,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        'الرحلات',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTabLink(),
    );
  }
}
