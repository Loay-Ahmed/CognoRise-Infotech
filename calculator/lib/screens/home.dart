import 'package:calculator/utils/calculator.dart';
import 'package:calculator/utils/colors.dart';
import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userEquation = "0";
  List<String> results = [];
  String calcEquation = "0";
  bool calculated = false;

  @override
  void initState() {
    super.initState();
  }

  void clearScreen() {
    setState(() {
      userEquation = "0";
      calcEquation = "0";
      results.clear();
      calculated = false;
    });
  }

  void writeNumber(String num) {
    setState(() {
      print(calcEquation);
      print(userEquation);
      if (num == ".") {
        print("found");
        List<String> numbers = calcEquation.split(" ");
        if (!numbers[numbers.length - 1].contains(".") &&
            (userEquation[userEquation.length - 1] != "%" &&
                userEquation[userEquation.length - 1] != "✕" &&
                userEquation[userEquation.length - 1] != "÷" &&
                userEquation[userEquation.length - 1] != "—" &&
                userEquation[userEquation.length - 1] != "+")) {
          numbers[numbers.length - 1] = numbers[numbers.length - 1] + ".";
        }
        userEquation = numbers.join("");
        calcEquation = numbers.join(" ");
      } else if (calculated &&
          (num != "%" &&
              num != "✕" &&
              num != "÷" &&
              num != "—" &&
              num != "+" &&
              num != ".")) {
        print("first if");

        userEquation = num;
        calcEquation = num;
      } else if ((userEquation[userEquation.length - 1] == "%" ||
              userEquation[userEquation.length - 1] == "✕" ||
              userEquation[userEquation.length - 1] == "÷" ||
              userEquation[userEquation.length - 1] == "—" ||
              userEquation[userEquation.length - 1] == "+" ||
              userEquation[userEquation.length - 1] == ".") &&
          (num == "%" ||
              num == "✕" ||
              num == "÷" ||
              num == "—" ||
              num == "+")) {
        print("second if");
        if (userEquation[userEquation.length - 1] != ".") {
          userEquation = userEquation.substring(0, userEquation.length - 1);
          userEquation += num;
          calcEquation = calcEquation.substring(0, calcEquation.length - 3);
          calcEquation += " $num ";
        }
      } else {
        userEquation += num;
        calcEquation +=
            num == "%" || num == "✕" || num == "÷" || num == "—" || num == "+"
                ? " $num "
                : num;
      }
      calculated = false;
      print(calcEquation);
      print(userEquation);
      if (num != "%" && num != "✕" && num != "÷" && num != "—" && num != "+") {
        List<String> numbers = calcEquation.split(" ");
        if ((userEquation[userEquation.length - 2] != "%" &&
                userEquation[userEquation.length - 2] != "✕" &&
                userEquation[userEquation.length - 2] != "÷" &&
                userEquation[userEquation.length - 2] != "—" &&
                userEquation[userEquation.length - 2] != "+") &&
            numbers[numbers.length - 1][0] == "0" &&
            numbers[numbers.length - 1][1] != ".") {
          numbers[numbers.length - 1] =
              numbers[numbers.length - 1].substring(1);
        }

        userEquation = numbers.join("");
        calcEquation = numbers.join(" ");
      }
    });
    print(calcEquation);
    print(userEquation);
  }

  void evaluate() {
    print(calcEquation);
    print(userEquation);
    if (calcEquation[calcEquation.length - 1] == " ") return;
    results = results.reversed.toList();
    results.add(userEquation);
    userEquation = Calculator().calculatePostFix(calcEquation);
    double eq = double.parse(userEquation);
    userEquation = eq - eq.truncate() > 0
        ? userEquation.length > 9
            ? eq.toStringAsPrecision(15)
            : eq.toString()
        : eq.truncate().toString();
    calcEquation = userEquation;
    setState(() {
      calculated = true;
      results = results.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDark ? MyColors.scaffoldDark : MyColors.scaffoldLight,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height / 3 + 40,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    reverse: true,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        results[index],
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: themeProvider.isDark
                              ? MyColors.secondaryTextDark
                              : MyColors.secondaryTextLight,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: userEquation.length > 14
                      ? 35
                      : userEquation.length > 10
                          ? 18
                          : 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Text(
                    userEquation,
                    style: GoogleFonts.roboto(
                      color: themeProvider.isDark
                          ? MyColors.textDark
                          : MyColors.textLight,
                      fontSize: userEquation.length > 14
                          ? 24
                          : userEquation.length > 10
                              ? 36
                              : 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: themeProvider.isDark
                    ? MyColors.containerDark
                    : MyColors.containerLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            themeProvider.toggleTheme();
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 2,
                              color: themeProvider.isDark
                                  ? MyColors.buttonDark
                                  : MyColors.buttonLight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return MyColors.gradient.createShader(bounds);
                            },
                            child: Icon(
                              themeProvider.isDark
                                  ? Icons.wb_sunny_outlined
                                  : Icons.dark_mode_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "7",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        write: writeNumber,
                        text: "4",
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "1",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: ".",
                        write: writeNumber,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        color: themeProvider.isDark
                            ? MyColors.buttonDark
                            : MyColors.buttonLight,
                        text: "%",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "8",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "5",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "2",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "0",
                        write: writeNumber,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        color: themeProvider.isDark
                            ? MyColors.buttonDark
                            : MyColors.buttonLight,
                        text: "÷",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "9",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "6",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: Colors.transparent,
                        text: "3",
                        write: writeNumber,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (calcEquation[calcEquation.length - 1] == " ") {
                              calcEquation = calcEquation.substring(
                                  0, calcEquation.length - 3);
                            } else {
                              calcEquation = calcEquation.substring(
                                  0, calcEquation.length - 1);
                            }
                            userEquation = userEquation.substring(
                                0, userEquation.length - 1);
                            if (userEquation.isEmpty) userEquation = "0";
                            if (calcEquation.isEmpty) calcEquation = "0";
                          });
                        },
                        onDoubleTap: clearScreen,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          alignment: Alignment.center,
                          child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return MyColors.gradient.createShader(bounds);
                              },
                              child: const Icon(
                                Icons.backspace_outlined,
                                size: 30,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        color: themeProvider.isDark
                            ? MyColors.buttonDark
                            : MyColors.buttonLight,
                        text: "✕",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: themeProvider.isDark
                            ? MyColors.buttonDark
                            : MyColors.buttonLight,
                        text: "—",
                        write: writeNumber,
                      ),
                      CustomButton(
                        color: themeProvider.isDark
                            ? MyColors.buttonDark
                            : MyColors.buttonLight,
                        text: "+",
                        write: writeNumber,
                      ),
                      GestureDetector(
                        onTap: () {
                          evaluate();
                        },
                        child: Container(
                          width: 70,
                          height: 155,
                          decoration: BoxDecoration(
                            gradient: MyColors.gradient,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x66f73c57),
                                spreadRadius: 2,
                                offset: Offset(0, 8),
                                blurRadius: 24,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            CupertinoIcons.equal,
                            size: 35,
                            color: MyColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
