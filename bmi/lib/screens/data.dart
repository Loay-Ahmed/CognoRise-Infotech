import 'package:bmi/providers/theme_provider.dart';
import 'package:bmi/utils/colors.dart';
import 'package:bmi/widgets/counter.dart';
import 'package:bmi/widgets/height_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataCollectionPage extends StatefulWidget {
  const DataCollectionPage({super.key});

  @override
  State<DataCollectionPage> createState() => _DataCollectionPageState();
}

class _DataCollectionPageState extends State<DataCollectionPage> {
  List<bool> selection = [true, false];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height - 215,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            height: 42,
            child: ToggleButtons(
              onPressed: (_) {
                setState(() {
                  selection[0] = !selection[0];
                  selection[1] = !selection[1];
                });
                setState(() {});
              },
              borderRadius: BorderRadius.circular(40),
              selectedColor: Colors.white,
              fillColor: MyColors.blue,
              color: MyColors.blue,
              // disabledColor: Colors.white,
              isSelected: selection,
              borderColor: themeProvider.isDark
                  ? MyColors.scaffoldDark
                  : MyColors.scaffoldLight,
              selectedBorderColor: themeProvider.isDark
                  ? MyColors.scaffoldDark
                  : MyColors.scaffoldLight,
              constraints: const BoxConstraints.expand(width: 183, height: 40),
              children: const [
                Text("Male"),
                Text("Female"),
              ],
            ),
          ),
          const SizedBox(
            height: 65,
          ),
          const Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Counter(title: "Weight"),
                  Counter(title: "Age"),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              HeightBar(),
            ],
          ),
        ],
      ),
    );
  }
}
