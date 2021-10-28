import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardButton extends StatelessWidget {
  const DashBoardButton({Key? key, required this.texto1, required this.texto2})
      : super(key: key);

  final String texto1;
  final String texto2;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF2BE22),
      borderRadius: BorderRadius.circular(10),
      elevation: 8,
      child: SizedBox(
        width: 163,
        height: 110,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(texto1,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.robotoMono(
                    color: Colors.black,
                    textStyle: const TextStyle(fontSize: 12),
                  )),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(texto2,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.robotoMono(
                    color: const Color(0xFFD94A4A),
                    fontWeight: FontWeight.bold,
                    textStyle: const TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
