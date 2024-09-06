import 'package:calculator/providers/theme_provider.dart';
import 'package:calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.color,
    required this.text,
    required this.write,
  });

  final Color? color;
  final String text;
  final Function(String) write;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        widget.write(widget.text);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
            color:
                themeProvider.isDark ? MyColors.textDark : MyColors.textLight,
            fontSize: widget.color == Colors.transparent
                ? 24
                : widget.text == "%"
                    ? 28
                    : 34,
            fontWeight: widget.text == "+" || widget.text == "÷"
                ? FontWeight.w300
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
