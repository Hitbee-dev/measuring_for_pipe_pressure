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
  double d_p = 0;
  double h_l = 0;
  double g_a = 9.81;

  double con_Q_total = 0;
  double con_Epsilon = 0;
  double con_D_one = 0;
  double con_D_two = 0;
  double con_Gamma = 0;
  double con_Upsilon = 0;
  double con_L_one = 0;
  double con_L_two = 0;
  double con_K_one = 0;
  double con_K_two = 0;
  double con_F_one = 0;
  double con_F_two = 0;
  double con_Delta = 0;

  int counter = 0;

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
              child: Column(
                children: [
                  Row(
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
                          inputData(
                              "f if1", saved_F_one, "1번 pipe 예상 마찰계수", ""),
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
                          inputData(
                              "f if2", saved_F_two, "2번 pipe 예상 마찰계수", ""),
                          resultButton()
                        ],
                      ),
                    ],
                  ),
                  exampleButton()
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
              ResultData();
            }
          },
          child: Text("Result", style: TextStyle(fontWeight: FontWeight.bold))),
    );
  }

  Widget exampleButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: 70,
      width: 300,
      child: ElevatedButton(
          onPressed: () {
            saved_Q_total.text = "0.03";
            saved_Epsilon.text = "0.15";
            saved_D_one.text = "100";
            saved_D_two.text = "50";
            saved_Gamma.text = "9810";
            saved_Upsilon.text = "0.000001"; //1*10^-6
            saved_L_one.text = "3";
            saved_L_two.text = "7";
            saved_K_one.text = "12.4";
            saved_K_two.text = "5.59";
            saved_F_one.text = "0.020";
            saved_F_two.text = "0.025";
            saved_Delta.text = "0";
          },
          child:
              Text("Example", style: TextStyle(fontWeight: FontWeight.bold))),
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

  ResultData() {
    con_Q_total = double.parse(saved_Q_total.text);
    con_Q_total = con_Q_total * pow(10, 9);
    con_Epsilon = double.parse(saved_Epsilon.text);
    con_Upsilon = double.parse(saved_Upsilon.text);
    con_Upsilon = con_Upsilon * pow(10, 6);
    con_D_one = double.parse(saved_D_one.text);
    con_D_two = double.parse(saved_D_two.text);
    con_Gamma = double.parse(saved_Gamma.text);
    con_Gamma = con_Gamma * pow(10, -9);
    con_L_one = double.parse(saved_L_one.text);
    con_L_one = con_L_one * pow(10, 3);
    con_L_two = double.parse(saved_L_two.text);
    con_L_two = con_L_two * pow(10, 3);
    con_K_one = double.parse(saved_K_one.text);
    con_K_two = double.parse(saved_K_two.text);
    con_F_one = double.parse(saved_F_one.text);
    con_F_two = double.parse(saved_F_two.text);
    con_Delta = double.parse(saved_Delta.text);

    // function
    a_one = pow((con_D_one / 2), 2) * pi;
    a_two = pow((con_D_two / 2), 2) * pi;
    counter = 0;

    // while (counter == 0) {
    c_one = (con_F_one * con_L_one / con_D_one) + con_K_one;
    c_two = (con_F_two * con_L_two / con_D_two) + con_K_two;
    v_two = con_Q_total / (a_one * sqrt(c_two / c_one) + a_two);
    v_one = ((con_Q_total - v_two * a_two) / a_one);
    r_one = ((v_one * con_D_one) / con_Upsilon);
    r_two = ((v_two * con_D_two) / con_Upsilon);
    fr_one = -1.8 *
        log(pow(((con_Epsilon / con_D_one) / 3.7), 1.11) + (6.9 / r_one));
    fr_two = -1.8 *
        log(pow(((con_Epsilon / con_D_two) / 3.7), 1.11) + (6.9 / r_two));
    fr_one = 1 / sqrt(fr_one);
    fr_two = 1 / sqrt(fr_two);
    q_one = v_one * a_one;
    q_two = v_two * a_two;
    h_l = c_two * (pow(v_two, 2) / (2 * g_a));
    d_p = con_Gamma * c_two * (pow(v_two, 2) / (2 * g_a)) + con_Delta;

    double persent = 0.01;

    // if (fr_one == con_F_one + persent || fr_one == con_F_one - persent) {
    //   (fr_two == con_F_two + persent) ? counter = 1 : print(con_F_one);
    //   (fr_two == con_F_two - persent) ? counter = 1 : print(con_F_one);
    // } else if (fr_one == con_F_one + persent ||
    //     fr_one == con_F_one - persent) {
    //   (fr_two == con_F_two + persent) ? counter = 1 : print(con_F_one);
    //   (fr_two == con_F_two - persent) ? counter = 1 : print(con_F_one);
    // } else if (fr_two == con_F_two + persent ||
    //     fr_two == con_F_two - persent) {
    //   (fr_one == con_F_one + persent) ? counter = 1 : print(con_F_one);
    //   (fr_one == con_F_one - persent) ? counter = 1 : print(con_F_one);
    // } else if (fr_two == con_F_two + persent ||
    //     fr_two == con_F_two - persent) {
    //   (fr_one == con_F_one + persent) ? counter = 1 : print(con_F_one);
    //   (fr_one == con_F_one - persent) ? counter = 1 : print(con_F_one);
    // } else {
    //   con_F_one = con_F_one / 1.01;
    //   con_F_two = con_F_two / 1.01;
    // }

    Get.offNamed("/result",
        arguments: SettingData(a_one, a_two, c_one, c_two, v_one, v_two, r_one,
            r_two, q_one, q_two, fr_one, fr_two, d_p, h_l));
  }
}

class SettingData {
  double a_one;
  double a_two;
  double c_one;
  double c_two;
  double v_one;
  double v_two;
  double r_one;
  double r_two;
  double q_one;
  double q_two;
  double fr_one;
  double fr_two;
  double d_p;
  double h_l;

  SettingData(
      this.a_one,
      this.a_two,
      this.c_one,
      this.c_two,
      this.v_one,
      this.v_two,
      this.r_one,
      this.r_two,
      this.q_one,
      this.q_two,
      this.fr_one,
      this.fr_two,
      this.d_p,
      this.h_l);
}
