import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/screens/data.dart';
import 'package:bmi/screens/result.dart';
import 'package:bmi/utils/bmi_result_calculator.dart';
import 'package:bmi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  PageController pageController = PageController();
  bool calculated = false;
  final bmiRes = BMiCalculator();
  List<Widget> pages = [const DataCollectionPage(), const ResultPage()];

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void calculate() {
    bmiRes.reCalculate();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDark ? MyColors.scaffoldDark : MyColors.scaffoldLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("BMI Calculator"),
        titleTextStyle: GoogleFonts.poppins(
          color: themeProvider.isDark ? Colors.white : Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap: () => setState(() {
              themeProvider.toggleTheme();
            }),
            child: Container(
              decoration: BoxDecoration(
                color: themeProvider.isDark
                    ? MyColors.containerDark
                    : MyColors.containerLight,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 101,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.sunny,
                    size: 22,
                    weight: 5,
                    color:
                        !themeProvider.isDark ? MyColors.blue : Colors.black54,
                  ),
                  Icon(
                    Icons.dark_mode,
                    size: 22,
                    weight: 5,
                    color: themeProvider.isDark
                        ? MyColors.blue
                        : Colors.grey.shade400,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: PageView.builder(
          itemCount: pages.length,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 53),
        child: SizedBox(
          width: 320,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                calculated = !calculated;
                calculated ? changePage(1) : changePage(0);
                if (calculated) {
                  calculate();
                }
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: MyColors.blue,
              elevation: 0,
              foregroundColor: MyColors.containerLight,
              textStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            child: Text("Calculate${calculated ? " again" : ""}"),
          ),
        ),
      ),
    );
  }
}
