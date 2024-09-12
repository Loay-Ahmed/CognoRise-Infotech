import 'package:alarm_app/provider/theme_provider.dart';
import 'package:alarm_app/utils/colors.dart';
import 'package:alarm_app/widgets/alarm_container.dart';
import 'package:alarm_app/widgets/clock.dart';
import 'package:alarm_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: themeProvider.isDark
              ? MyColors.scaffoldDark
              : MyColors.scaffoldLight,
        ),
        padding: const EdgeInsets.only(
          top: 35,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 3,
              alignment: Alignment.center,
              child: const Clock(),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffffffff),
                      Color(0xffEEF0F5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
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
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 2 / 3,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Alarms",
                              style: GoogleFonts.poppins(
                                  height: 3.3,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff646E82)),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2 + 25,
                            ),
                            Text(
                              "...",
                              style: GoogleFonts.poppins(
                                  height: 0.1,
                                  fontSize: 27,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff646E82)),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return const CustomContainer(
                                  child: AlarmContainer());
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 30,
                              );
                            },
                          ),
                        ),
                        CustomContainer(
                          child: Container(
                            width: 190,
                            height: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [Color(0xffEEF0F5), Color(0xffE6E9EF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Add New",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff646E82),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//               child: SizedBox(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [

//                     CustomContainer(
//                       child: Container(
//                         width: MediaQuery.sizeOf(context).width,
//                         height: MediaQuery.sizeOf(context).height * 2 / 3 - 135,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             children: [
//                               CustomContainer(
//                                 child: AlarmContainer(),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
