import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmContainer extends StatefulWidget {
  const AlarmContainer({super.key});

  @override
  State<AlarmContainer> createState() => _AlarmContainerState();
}

class _AlarmContainerState extends State<AlarmContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "07:30",
            style: GoogleFonts.poppins(
              fontSize: 34,
              fontWeight: FontWeight.w500,
              color: const Color(0xff646E82),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    width: 35,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffFD2A22),
                          Color(0xffFE6C57),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
