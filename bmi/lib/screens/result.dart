import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/utils/bmi_result_calculator.dart';
import 'package:bmi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiResult = BMiCalculator();
    final themeProvider = Provider.of<ThemeProvider>(context);
    String bmiVal = bmiResult.bmiRes.toStringAsFixed(1);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height - 215,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 140,
            child: Text(
              bmiVal,
              style: GoogleFonts.poppins(
                color: themeProvider.isDark
                    ? MyColors.containerLight
                    : Colors.black,
                fontSize: 96,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            double.parse(bmiVal) < 18.5
                ? "Underweight"
                : double.parse(bmiVal) <= 24.9
                    ? "Normal"
                    : double.parse(bmiVal) <= 29.9
                        ? "Overweight"
                        : "Obesity",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: MyColors.blue,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
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
            width: MediaQuery.sizeOf(context).width - 100,
            height: 290,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Details",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "Underweight: BMI less than 18.5",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: themeProvider.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(
                        "Normal weight: BMI 18.5 to 24.9",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: themeProvider.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(
                        "Overweight: BMI 25 to 29.9",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: themeProvider.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Text(
                        "Obesity: 30 to 40",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: themeProvider.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
