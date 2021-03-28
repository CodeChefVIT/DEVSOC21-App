import 'package:flutter/material.dart';

class LinkCard extends StatelessWidget {
  final String title;
  final String imgPath;
  final Color bgColor;
  LinkCard({@required this.title, @required this.imgPath, @required this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [],
      ),
    );
  }
}
