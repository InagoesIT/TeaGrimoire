import 'package:flutter/widgets.dart';

class NavBarPainter extends CustomPainter {
  final double bulgeCenterX;

  NavBarPainter(this.bulgeCenterX);

  @override
  void paint(Canvas canvas, Size size) {
    var backgroundPainter = Paint()
      ..color = const Color(0xFF0D0D0D)
      ..style = PaintingStyle.fill;
    var bulgeWidth = size.width * 0.25;
    var bulgeHeight = 13.0;
    var bulgeStartX = bulgeCenterX - bulgeWidth / 2;
    var bulgeEndX = bulgeCenterX + bulgeWidth / 2;
    var shoulderOffset = bulgeWidth * 0.15;
    var peakOffset = bulgeWidth * 0.3;

    final bulgePath = _buildBulgePath(
      totalWidth: size.width,
      bulgeHeight: bulgeHeight,
      bulgeStartX: bulgeStartX,
      bulgeEndX: bulgeEndX,
      bulgeCenterX: bulgeCenterX,
      shoulderOffset: shoulderOffset,
      peakOffset: peakOffset,
    );

    final path = Path()
      ..addPath(bulgePath, Offset.zero)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, backgroundPainter);

    final highlightPath = _buildBulgePath(
      totalWidth: size.width,
      bulgeHeight: bulgeHeight,
      bulgeStartX: bulgeStartX,
      bulgeEndX: bulgeEndX,
      bulgeCenterX: bulgeCenterX,
      shoulderOffset: shoulderOffset,
      peakOffset: peakOffset,
    );

    var gradientSpread = bulgeWidth * 0.5;
    var sharpLinePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          const Color(0xFF171F20),
          const Color(0xFFD4A853),
          const Color(0xFFD4A853),
          const Color(0xFF171F20),
        ],
        stops: [
          0.0,
          (bulgeStartX - gradientSpread) / size.width,
          (bulgeEndX + gradientSpread) / size.width,
          1.0,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    canvas.drawPath(highlightPath, sharpLinePaint);
  }

  Path _buildBulgePath({
    required double totalWidth,
    required double bulgeHeight,
    required double bulgeStartX,
    required double bulgeEndX,
    required double bulgeCenterX,
    required double shoulderOffset,
    required double peakOffset,
  }) {
    return Path()
      ..moveTo(0, bulgeHeight)
      ..lineTo(bulgeStartX, bulgeHeight)
      ..cubicTo(
        bulgeStartX + shoulderOffset, bulgeHeight,
        bulgeCenterX - peakOffset, 0,
        bulgeCenterX, 0,
      )
      ..cubicTo(
        bulgeCenterX + peakOffset, 0,
        bulgeEndX - shoulderOffset, bulgeHeight,
        bulgeEndX, bulgeHeight,
      )
      ..lineTo(totalWidth, bulgeHeight);
  }

  @override
  bool shouldRepaint(NavBarPainter oldDelegate) {
    return oldDelegate.bulgeCenterX != bulgeCenterX;
  }
}
