import 'package:flutter/widgets.dart';
import 'package:tea_grimoire/nav_bar_icon.dart';
import 'package:tea_grimoire/nav_bar_painter.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  double _bulgeCenterX = 0;
  int _selectedIndex = 1;
  final List<GlobalKey> _iconKeys = List.generate(3, (_) => GlobalKey());
  final GlobalKey _barKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateBulgePosition(_selectedIndex);
    });
  }

  void _updateBulgePosition(int index) {
    final barBox = _barKey.currentContext?.findRenderObject() as RenderBox?;
    final iconBox =
        _iconKeys[_selectedIndex].currentContext?.findRenderObject()
            as RenderBox?;
    if (barBox == null || iconBox == null) return;

    final iconPosition = iconBox.localToGlobal(Offset.zero, ancestor: barBox);
    final bulgeCenterX = iconPosition.dx + iconBox.size.width / 2;
    setState(() {
      _bulgeCenterX = bulgeCenterX;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _barKey,
      height: 90,
      child: CustomPaint(
        painter: NavBarPainter(_bulgeCenterX),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarIcon(
                key: _iconKeys[0],
                assetName: 'assets/icons/quill.svg',
                isActive: _selectedIndex == 0,
              ),
              NavBarIcon(
                key: _iconKeys[1],
                assetName: 'assets/icons/tome.svg',
                isActive: _selectedIndex == 1,
              ),
              NavBarIcon(
                key: _iconKeys[2],
                assetName: 'assets/icons/profile.svg',
                isActive: _selectedIndex == 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
