import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/utils/bmi_result_calculator.dart';
import 'package:bmi/utils/colors.dart';
import 'package:bmi/widgets/add_minus_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.title});

  final String title;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int number = 0;
  final bmiCalc = BMiCalculator();

  @override
  void initState() {
    super.initState();
    number = widget.title == "Weight" ? 65 : 25;
    if (widget.title == "Weight") {
      bmiCalc.weight = number;
    }
  }

  void count(bool add) {
    setState(() {
      add
          ? number++
          : number > 0
              ? number--
              : number;
      if (widget.title == "Weight") {
        bmiCalc.weight = number;
      }
      print(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.isDark
            ? MyColors.containerDark
            : MyColors.containerLight,
      ),
      width: MediaQuery.sizeOf(context).width / 2 - 30,
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              color: const Color(0xff8c8c8c),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "$number",
            style: GoogleFonts.poppins(
              color: themeProvider.isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 48,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AddOrMinusContainer(
                adder: false,
                count: count,
              ),
              AddOrMinusContainer(
                adder: true,
                count: count,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
