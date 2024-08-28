import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/utils/bmi_result_calculator.dart';
import 'package:bmi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeightBar extends StatefulWidget {
  const HeightBar({super.key});

  @override
  State<HeightBar> createState() => _HeightBarState();
}

class _HeightBarState extends State<HeightBar> {
  double val = 150;

  final bmiCalc = BMiCalculator();

  @override
  void initState() {
    super.initState();
    bmiCalc.height = val.round();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.isDark
            ? MyColors.containerDark
            : MyColors.containerLight,
      ),
      width: 466,
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Height: ",
                style: GoogleFonts.poppins(
                  color: const Color(0xff8c8c8c),
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${val.round()}",
                style: GoogleFonts.poppins(
                  color: themeProvider.isDark
                      ? Colors.white
                      : MyColors.containerDark,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              activeTrackColor: MyColors.blue,
              thumbColor: MyColors.containerLight,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
              inactiveTrackColor: const Color(0xff4f4f4f),
            ),
            child: Slider(
              value: val,
              min: 100,
              max: 200,
              divisions: 100,
              onChanged: (value) {
                setState(() {
                  val = value;
                  bmiCalc.height = value.round();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
