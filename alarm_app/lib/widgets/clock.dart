import 'dart:async';

import 'package:flutter/material.dart';

import 'clock_painter.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffffffff),
            Color(0xffBAC3CF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(166, 180, 200, 0.45),
            blurRadius: 92,
            spreadRadius: -32,
            offset: Offset(19, 25),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.53),
            blurRadius: 61,
            spreadRadius: 0,
            offset: Offset(-20, -20),
          ),
          BoxShadow(
            color: Color.fromRGBO(166, 180, 200, 0.57),
            blurRadius: 12,
            spreadRadius: -6,
            offset: Offset(13, 14),
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: MediaQuery.sizeOf(context).width / 2 + 10,
          height: MediaQuery.sizeOf(context).width / 2 + 10,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffE6E9EF),
                Color(0xffEEF0F5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffA5B1C3),
                    Color(0xffFEFEFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-12, -12),
                        spreadRadius: 0,
                        blurRadius: 30,
                        color: Color(0x33ffffff),
                      ),

                      // BoxShadow(
                      //   offset: Offset(10, 11),
                      //   spreadRadius: -1,
                      //   blurRadius: 30,
                      //   color: Color(0xb5a6b4c8),
                      // ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffbec7d6),
                        Color(0xfffafbfd),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CustomPaint(
                    painter: ClockPainter(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
