import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  final String assetName;
  final bool isActive;

  const NavBarIcon({super.key, required this.assetName, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return
    // Transform.translate(
    //   offset: Offset(0, isActive ? -5 : 0),
    //   child:
    SizedBox(
      child: Column(
        children: [
          SvgPicture.asset(
            assetName,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? const Color(0xFFD4A853) : const Color(0xFF616662),
              BlendMode.srcIn,
            ),
          ),
          Text(
            assetName.split('/').last.split('.').first,
            style: TextStyle(
              fontSize: 12,
              color: isActive
                  ? const Color(0xFFD4A853)
                  : const Color(0xFF616662),
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
