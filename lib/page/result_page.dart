import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    resultText("Δ", "P", ":"),
                    resultText("h", "L", ":"),
                    resultText("f", "real_1", ":"),
                    resultText("f", "feal_2", ":"),
                    resultText("V", "1", ":"),
                    resultText("V", "2", ":"),
                    resultText("Q", "1", ":"),
                    resultText("Q", "2", ":"),
                    backButton()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget resultText(String result_f, String result_m, String result_b) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(result_f, style: TextStyle(fontSize: 22)),
        Text(result_m, style: TextStyle(fontSize: 14)),
        Text(result_b, style: TextStyle(fontSize: 25)),
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
