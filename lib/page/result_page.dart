import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double a_one = 0;
  double a_two = 0;
  double c_one = 0;
  double c_two = 0;
  double v_one = 0;
  double v_two = 0;
  double r_one = 0;
  double r_two = 0;
  double q_one = 0;
  double q_two = 0;
  double fr_one = 0;
  double fr_two = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), //화면 아무데나 터치해서 내리기
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Result",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    resultText(
                        "A",
                        "1",
                        ":",
                        " ${((Get.arguments as SettingData).a_one).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "A",
                        "2",
                        ":",
                        " ${((Get.arguments as SettingData).a_two).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "C",
                        "1",
                        ":",
                        " ${((Get.arguments as SettingData).c_one).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "C",
                        "2",
                        ":",
                        " ${((Get.arguments as SettingData).c_two).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "ΔP",
                        "",
                        ":",
                        " ${((Get.arguments as SettingData).d_p).toStringAsFixed(3)}",
                        "kPa"),
                    resultText(
                        "h",
                        "L",
                        ":",
                        " ${((Get.arguments as SettingData).h_l).toStringAsFixed(3)}",
                        "m"),
                    resultText(
                        "V",
                        "1",
                        ":",
                        " ${((Get.arguments as SettingData).v_one / 1000).toStringAsFixed(3)}",
                        "m/s"),
                    resultText(
                        "V",
                        "2",
                        ":",
                        " ${((Get.arguments as SettingData).v_two / 1000).toStringAsFixed(3)}",
                        "m/s"),
                    resultText(
                        "Q",
                        "1",
                        ":",
                        " ${((Get.arguments as SettingData).q_one).toStringAsFixed(3)}",
                        "m^3/s"),
                    resultText(
                        "Q",
                        "2",
                        ":",
                        " ${((Get.arguments as SettingData).q_two).toStringAsFixed(3)}",
                        "m^3/s"),
                    resultText(
                        "Re",
                        "1",
                        ":",
                        " ${((Get.arguments as SettingData).r_one).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "Re",
                        "2",
                        ":",
                        " ${((Get.arguments as SettingData).r_two).toStringAsFixed(3)}",
                        ""),
                    resultText(
                        "f",
                        "real_1",
                        ":",
                        " ${((Get.arguments as SettingData).fr_one).toStringAsFixed(10)}",
                        ""),
                    resultText(
                        "f",
                        "feal_2",
                        ":",
                        " ${((Get.arguments as SettingData).fr_two).toStringAsFixed(10)}",
                        ""),
                    backButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget resultText(String result_f, String result_m, String result_b,
      String result_data, String result_u) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(result_f, style: TextStyle(fontSize: 22)),
        Text(result_m, style: TextStyle(fontSize: 14)),
        Text(result_b, style: TextStyle(fontSize: 25)),
        Text(result_data, style: TextStyle(fontSize: 20)),
        Text(result_u, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget backButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 70,
      width: 170,
      child: ElevatedButton(
          onPressed: () {
            Get.offNamed("/");
          },
          child: Text("Back", style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
