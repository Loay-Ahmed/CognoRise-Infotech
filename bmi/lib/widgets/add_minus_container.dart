import 'package:bmi/utils/colors.dart';
import 'package:flutter/material.dart';

class AddOrMinusContainer extends StatelessWidget {
  const AddOrMinusContainer({
    super.key,
    required this.adder,
    required this.count,
  });

  final Function(bool) count;
  final bool adder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        count(adder);
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 38,
        width: 38,
        child: Icon(
          adder ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
