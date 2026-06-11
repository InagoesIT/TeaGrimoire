import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParchmentCard extends StatelessWidget {
  final String title;
  final String body;
  final double width;

  const ParchmentCard({
    super.key,
    required this.title,
    required this.body,
    this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        image: const DecorationImage(
          image: AssetImage('assets/images/old_paper.avif'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0xFFF0DEB0), BlendMode.multiply),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8B5E2A).withValues(alpha: 0.5),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: GoogleFonts.cinzel(
                  fontSize: 13,
                  letterSpacing: 2.5,
                  color: const Color(0xFF1A0800),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const _ParchmentDivider(),
              const SizedBox(height: 10),
              Text(
                body,
                textAlign: TextAlign.center,
                style: GoogleFonts.imFellEnglish(
                  fontSize: 13,
                  height: 1.6,
                  color: const Color(0xFF2C1205),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParchmentDivider extends StatelessWidget {
  const _ParchmentDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Color(0xFF4A2C0A), thickness: 0.8),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '✦',
            style: TextStyle(color: const Color(0xFF3D2208), fontSize: 8),
          ),
        ),
        const Expanded(
          child: Divider(color: Color(0xFF4A2C0A), thickness: 0.8),
        ),
      ],
    );
  }
}
