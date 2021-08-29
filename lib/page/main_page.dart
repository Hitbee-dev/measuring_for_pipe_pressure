import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController saved_Q_total;
  late TextEditingController saved_Epsilon;
  late TextEditingController saved_D_one;
  late TextEditingController saved_D_two;
  late TextEditingController saved_Gamma;
  late TextEditingController saved_Upsilon;
  late TextEditingController saved_L_one;
  late TextEditingController saved_L_two;
  late TextEditingController saved_K_one;
  late TextEditingController saved_K_two;
  late TextEditingController saved_F_one;
  late TextEditingController saved_F_two;
  late TextEditingController saved_Delta;

  @override
  void initState() {
    super.initState();
    this.saved_Q_total = TextEditingController();
    this.saved_Epsilon = TextEditingController();
    this.saved_D_one = TextEditingController();
    this.saved_D_one = TextEditingController();
    this.saved_D_two = TextEditingController();
    this.saved_Gamma = TextEditingController();
    this.saved_Upsilon = TextEditingController();
    this.saved_L_one = TextEditingController();
    this.saved_L_two = TextEditingController();
    this.saved_K_one = TextEditingController();
    this.saved_K_two = TextEditingController();
    this.saved_F_one = TextEditingController();
    this.saved_F_two = TextEditingController();
    this.saved_Delta = TextEditingController();
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
                      inputData("γw", saved_Gamma, "물의 비중량", "N/m^3"),
                      inputData("L1", saved_L_one, "1번 pipe 길이", "m"),
                      inputData("K1", saved_K_one, "1번 pipe 수두손실 계수", ""),
                      inputData("f if1", saved_F_one, "1번 pipe 예상 마찰계수", ""),
                      inputData("ΔZ", saved_Delta, "pipe 높이 차", "m"),
                    ],
                  ),
                  Column(
                    children: [
                      inputData("ε", saved_Epsilon, "파이프 조도", "mm"),
                      inputData("D2", saved_D_two, "2번 pipe 직경", "mm"),
                      inputData("υw", saved_Upsilon, "물의 점도", "m^2/s"),
                      inputData("L2", saved_L_two, "2번 pipe 길이", "m"),
                      inputData("K2", saved_K_two, "2번 pipe 수두손실 계수", ""),
                      inputData("f if2", saved_F_two, "2번 pipe 예상 마찰계수", ""),
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
          onPressed: () {
            if (saved_Q_total.text == "") {
              SnackPrint("Q: total유량 값을 입력 해 주세요.");
            } else if (saved_Epsilon.text == "") {
              SnackPrint("ε: 파이프 조도 값을 입력 해 주세요.");
            } else if (saved_D_one.text == "") {
              SnackPrint("D1: 1번 pipe 직경 값을 입력 해 주세요.");
            } else if (saved_D_two.text == "") {
              SnackPrint("D2: 2번 pipe 직경 값을 입력 해 주세요.");
            } else if (saved_Gamma.text == "") {
              SnackPrint("γw: 물의 비중량 값을 입력 해 주세요.");
            } else if (saved_Upsilon.text == "") {
              SnackPrint("υw: 물의 점도 값을 입력 해 주세요.");
            } else if (saved_L_one.text == "") {
              SnackPrint("L1: 1번 pipe 길이 값을 입력 해 주세요.");
            } else if (saved_L_two.text == "") {
              SnackPrint("L2: 2번 pipe 길이 값을 입력 해 주세요.");
            } else if (saved_K_one.text == "") {
              SnackPrint("K1: 1번 pipe 수두손실 계수 값을 입력 해 주세요.");
            } else if (saved_K_two.text == "") {
              SnackPrint("K2: 2번 pipe 수두손실 계수 값을 입력 해 주세요.");
            } else if (saved_F_one.text == "") {
              SnackPrint("f if1: 1번 pipe 예상 마찰계수 값을 입력 해 주세요.");
            } else if (saved_F_two.text == "") {
              SnackPrint("f if2: 2번 pipe 예상 마찰계수 값을 입력 해 주세요.");
            } else if (saved_Delta.text == "") {
              SnackPrint("ΔZ: pipe 높이 차 값을 입력 해 주세요.");
            } else {
              Get.offNamed("/result",
                  arguments: SettingData(
                      saved_Q_total.text,
                      saved_Epsilon.text,
                      saved_D_one.text,
                      saved_D_two.text,
                      saved_Gamma.text,
                      saved_Upsilon.text,
                      saved_L_one.text,
                      saved_L_two.text,
                      saved_K_one.text,
                      saved_K_two.text,
                      saved_F_one.text,
                      saved_F_two.text,
                      saved_Delta.text));
            }
          },
          child: Text("Result", style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  SnackPrint(String message) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Done',
        onPressed: () {},
      ),
    ));
  }
}

class SettingData {
  String q_total;
  String epsilon;
  String d_one;
  String d_two;
  String gamma;
  String upsilon;
  String l_one;
  String l_two;
  String k_one;
  String k_two;
  String f_one;
  String f_two;
  String delta;

  SettingData(
      this.q_total,
      this.epsilon,
      this.d_one,
      this.d_two,
      this.gamma,
      this.upsilon,
      this.l_one,
      this.l_two,
      this.k_one,
      this.k_two,
      this.f_one,
      this.f_two,
      this.delta);
}
