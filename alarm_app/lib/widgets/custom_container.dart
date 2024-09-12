import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xffBAC3CF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.53),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(-5, -5),
            ),
            BoxShadow(
              color: Color.fromRGBO(166, 180, 200, 0.57),
              blurRadius: 12,
              spreadRadius: -6,
              offset: Offset(13, 14),
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: child,
      ),
    );
  }
}
