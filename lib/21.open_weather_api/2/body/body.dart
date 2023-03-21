import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DustBody extends StatefulWidget {
  const DustBody(
      {Key? key,
      required this.loadSvg,
      required this.temperature,
      required this.indexImg,
      required this.indexText,
      required this.particulateMatter,
      required this.ultraParticulateMatter})
      : super(key: key);
  final SvgPicture loadSvg;
  final double temperature, particulateMatter, ultraParticulateMatter;
  final Widget indexImg, indexText;

  @override
  State<DustBody> createState() => _DustBodyState();
}

class _DustBodyState extends State<DustBody> {
  String getTime() {
    return DateFormat(' EEEE \n d MMM, yyy \n\n hh:mm:ss a').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    var style = GoogleFonts.getFont('Lato', fontSize: 15, color: Colors.white);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.orangeAccent,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 70),
              widget.loadSvg,
              const SizedBox(height: 30),
              Text('${widget.temperature.round().toString()} \u2103', style: GoogleFonts.getFont('Lato', fontSize: 25, color: Colors.white)),
              const SizedBox(height: 70),
              TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  return Text(getTime(), style: const TextStyle(color: Colors.white, fontSize: 20));
                },
              ),
              const SizedBox(height: 30),
              const Divider(thickness: 1, color: Colors.white70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('AQI(대기질 지수)', style: style),
                      const SizedBox(height: 10),
                      widget.indexImg,
                      const SizedBox(height: 10),
                      widget.indexText,
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text('미세먼지', style: style),
                      const SizedBox(height: 30),
                      Text('${widget.particulateMatter}', style: GoogleFonts.getFont('Lato', fontSize: 38, color: Colors.white)),
                      const SizedBox(height: 30),
                      Text("㎍/㎥", style: style),
                    ],
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      Text('초미세먼지', style: style),
                      const SizedBox(height: 30),
                      Text('${widget.ultraParticulateMatter}', style: GoogleFonts.getFont('Lato', fontSize: 38, color: Colors.white)),
                      const SizedBox(height: 30),
                      Text("㎍/㎥", style: style),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
