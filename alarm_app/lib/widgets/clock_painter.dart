import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final paint = Paint()
      ..color = const Color(0x91a6b4c8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw hour ticks
    for (int i = 0; i < 12; i++) {
      final angle = i * pi / 6;
      final x1 = centerX + (radius - 10) * cos(angle);
      final y1 = centerY + (radius - 10) * sin(angle);
      final x2 = centerX + (radius - 20) * cos(angle);
      final y2 = centerY + (radius - 20) * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }

    // Get the current time
    final datetime = DateTime.now();
    final hour = datetime.hour;
    final minute = datetime.minute;
    final second = datetime.second;

    // Paint for clock hands
    final handPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw hour hand (starting farther from center)
    final hourAngle = hour * 30 * pi / 180 - pi / 2;
    final hourHandStartX = centerX + (radius - 110) * cos(hourAngle);
    final hourHandStartY = centerY + (radius - 110) * sin(hourAngle);
    final hourHandEndX = centerX + (radius - 50) * cos(hourAngle);
    final hourHandEndY = centerY + (radius - 50) * sin(hourAngle);
    handPaint
      ..color = const Color(0xff646E82)
      ..strokeWidth = 3;
    canvas.drawLine(Offset(hourHandStartX, hourHandStartY),
        Offset(hourHandEndX, hourHandEndY), handPaint);

    // Draw minute hand (starting farther from center)
    final minuteAngle = minute * 6 * pi / 180 - pi / 2;
    final minuteHandStartX = centerX + (radius - 115) * cos(minuteAngle);
    final minuteHandStartY = centerY + (radius - 115) * sin(minuteAngle);
    final minuteHandEndX = centerX + (radius - 35) * cos(minuteAngle);
    final minuteHandEndY = centerY + (radius - 35) * sin(minuteAngle);
    handPaint
      ..color = const Color(0xff646E82)
      ..strokeWidth = 3;
    canvas.drawLine(Offset(minuteHandStartX, minuteHandStartY),
        Offset(minuteHandEndX, minuteHandEndY), handPaint);

    // Paint for clock hands
    final circlePaint = Paint()
      ..color = const Color(0xff646E82)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, 5, circlePaint);

    // Draw second hand (starting farther from center)
    final secondAngle = second * 6 * pi / 180 - pi / 2;
    final secondHandStartX = centerX + (radius - 120) * cos(secondAngle);
    final secondHandStartY = centerY + (radius - 120) * sin(secondAngle);
    final secondHandEndX = centerX + (radius - 22) * cos(secondAngle);
    final secondHandEndY = centerY + (radius - 22) * sin(secondAngle);
    handPaint.shader = const LinearGradient(
      colors: [Color(0xffFD251E), Color(0xffFE725C)],
    ).createShader(Rect.fromPoints(Offset(secondHandStartX, secondHandStartY),
        Offset(secondHandEndX, secondHandEndY)));
    handPaint.strokeWidth = 2;
    canvas.drawLine(Offset(secondHandStartX, secondHandStartY),
        Offset(secondHandEndX, secondHandEndY), handPaint);
// Draw second hand (starting farther from center)
    final secondThickHandStartX = centerX + (-10) * cos(secondAngle);
    final secondThickHandStartY = centerY + (-10) * sin(secondAngle);
    final secondThickHandEndX = centerX + (-30) * cos(secondAngle);
    final secondThickHandEndY = centerY + (-30) * sin(secondAngle);
    handPaint.shader = const LinearGradient(
      colors: [Color(0xffFD251E), Color(0xffFE725C)],
    ).createShader(Rect.fromPoints(
        Offset(secondThickHandStartX, secondThickHandStartY),
        Offset(secondThickHandEndX, secondThickHandEndY)));
    handPaint.strokeWidth = 4;
    canvas.drawLine(Offset(secondThickHandStartX, secondThickHandStartY),
        Offset(secondThickHandEndX, secondThickHandEndY), handPaint);
    circlePaint.color = const Color(0xffFD382D);
    circlePaint.strokeWidth = 3;
    canvas.drawCircle(center, 3, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
