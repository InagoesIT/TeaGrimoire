import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem extends StatelessWidget {
  final String assetName;
  final bool isSelected;
  final void Function() onTap;

  const NavBarItem({
    super.key,
    required this.assetName,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SvgPicture.asset(
              assetName,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? const Color(0xFFD4A853) : const Color(0xFF616662),
                BlendMode.srcIn,
              ),
            ),
            Text(
              assetName.split('/').last.split('.').first,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? const Color(0xFFD4A853)
                    : const Color(0xFF616662),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
