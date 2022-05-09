import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset("assets/images/walterWhite.png", width: 250),
            SizedBox(height: 20),
            Text(
              "No data found",
              style: TextStyle(color: Color(0xff808080)),
            )
          ],
        ),
      ),
    );
  }
}
