import 'package:flutter/material.dart';

class DetailsHolder extends StatelessWidget {
  String title;
  String content;

  DetailsHolder({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 6,
          ),
          Text(content),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
