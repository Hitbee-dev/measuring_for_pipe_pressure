import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:measuring_for_pipe_pressure/page/main_page.dart';
import 'package:measuring_for_pipe_pressure/page/result_page.dart';

void main() {
  runApp(const Measuring());
}

class Measuring extends StatelessWidget {
  const Measuring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'measuring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/",
              page: () => MainPage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/result",
              page: () => ResultPage(),
              transition: Transition.cupertinoDialog),
        ]);
  }
}
