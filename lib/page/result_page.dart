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
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget resultButton() {
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
