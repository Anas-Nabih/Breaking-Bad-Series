import 'package:breaking_bad_series/res/colors.dart';
import 'package:flutter/material.dart';


class DeathScreen extends StatelessWidget {
  const DeathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double  mWidth  =MediaQuery.of(context).size.width;
    double  mHeight =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MColors.yellow,
        title: Text("Deaths"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>Container(
          height: .2 * mHeight,width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
        ) ,),
    );
  }
}
