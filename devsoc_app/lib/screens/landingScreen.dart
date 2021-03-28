import 'package:devsoc_app/screens/doashboardScreen.dart';
import 'package:devsoc_app/screens/formScreen.dart';
import 'package:devsoc_app/screens/funScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState(currentIndex: 1);
}

class _LandingScreenState extends State<LandingScreen> {
  void initState() {
    super.initState();
  }

  final tabs = [
    Fun(),
    Dashboard(),
    Forms(),
  ];

  int currentIndex;
  _LandingScreenState({@required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.users,
                color: currentIndex == 0 ? Color(0xFF459AFF) : Colors.grey,
              ),
              title: Text(
                'Meetings',
                style: TextStyle(
                  color: currentIndex == 0 ? Color(0xFF459AFF) : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.tasks,
                color: currentIndex == 1 ? Color(0xFFFF6745) : Colors.grey,
              ),
              title: Text(
                'Projects',
                style: TextStyle(
                  color: currentIndex == 1 ? Color(0xFFFF6745) : Colors.grey,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.moneyBillWave,
                color: currentIndex == 2 ? Color(0xFF459AFF) : Colors.grey,
              ),
              title: Text(
                'Expenses',
                style: TextStyle(
                  color: currentIndex == 2 ? Color(0xFF459AFF) : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        body: tabs[currentIndex]);
  }
}
