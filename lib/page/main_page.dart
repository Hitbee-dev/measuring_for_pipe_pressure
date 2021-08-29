import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController saved_Q_total;
  late TextEditingController saved_D_one;

  @override
  void initState() {
    super.initState();
    this.saved_Q_total = TextEditingController();
    this.saved_D_one = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), //화면 아무데나 터치해서 내리기
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Measuring For Pipe Pressure",
            style: TextStyle(color: Colors.white),
          ),
        ),
        key: scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      inputData("Q", saved_Q_total, "total유량", "m^3/s"),
                      inputData("D1", saved_D_one, "1번 pipe 직경", "mm"),
                      inputData("γw", saved_Q_total, "물의 비중량", "N/m^3"),
                      inputData("L1", saved_D_one, "1번 pipe 길이", "m"),
                      inputData("K1", saved_Q_total, "1번 pipe 수두손실 계수", ""),
                      inputData("f if1", saved_D_one, "1번 pipe 예상 마찰계수", ""),
                      inputData("ΔZ", saved_D_one, "pipe 높이 차", "m"),
                    ],
                  ),
                  Column(
                    children: [
                      inputData("ε", saved_Q_total, "파이프 조도", "mm"),
                      inputData("D2", saved_D_one, "2번 pipe 직경", "mm"),
                      inputData("υw", saved_Q_total, "물의 점도", "m^2/s"),
                      inputData("L2", saved_D_one, "2번 pipe 길이", "m"),
                      inputData("K2", saved_Q_total, "2번 pipe 수두손실 계수", ""),
                      inputData("f if2", saved_Q_total, "2번 pipe 예상 마찰계수", ""),
                      resultButton()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputData(String name, controller, String hint, String suffix) {
    return Container(
      height: 70,
      width: 170,
      padding: EdgeInsets.only(right: 5, top: 20),
      child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            hintStyle: TextStyle(fontSize: 13),
            hintText: hint,
            suffixText: suffix,
            labelText: name,
            labelStyle:
                TextStyle(color: Colors.black, decorationColor: Colors.black),
          ),
          keyboardType:
              TextInputType.numberWithOptions(decimal: true, signed: true),
          controller: controller),
    );
  }

  Widget resultButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 70,
      width: 170,
      child: ElevatedButton(
          onPressed: () {},
          child: Text("Result", style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }
}
