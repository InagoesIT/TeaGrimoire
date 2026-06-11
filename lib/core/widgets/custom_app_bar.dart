import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: _BackButton()),
            Text(
              'Tea Grimoire',
              style: GoogleFonts.cinzel(
                fontSize: 20,
                color: const Color(0xFFE0C097),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE0C097), width: 0.8),
      ),
      width: 32,
      height: 32,
      child: cupertino.Icon(
        cupertino.CupertinoIcons.back,
        color: Color(0xFFE0C097),
        size: 24,
      ),
    );
  }
}
