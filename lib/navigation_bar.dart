import 'package:flutter/widgets.dart';
import 'package:tea_grimoire/nav_bar_icon.dart';
import 'package:tea_grimoire/nav_bar_painter.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  final List<GlobalKey> _iconKeys = List.generate(3, (_) => GlobalKey());
  final GlobalKey _barKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<double> _bulgeAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateBulgePosition(_selectedIndex);
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );
    _bulgeAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  void _updateBulgePosition(int index) {
    final barBox = _barKey.currentContext?.findRenderObject() as RenderBox?;
    final iconBox =
        _iconKeys[index].currentContext?.findRenderObject() as RenderBox?;
    if (barBox == null || iconBox == null) return;

    final iconPosition = iconBox.localToGlobal(Offset.zero, ancestor: barBox);
    final newBulgeCenterX = iconPosition.dx + iconBox.size.width / 2;

    _bulgeAnimation =
        Tween<double>(
          begin: _bulgeAnimation.value,
          end: newBulgeCenterX,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward(from: 0);

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _barKey,
      height: 90,
      child: AnimatedBuilder(
        animation: _bulgeAnimation,
        builder: (context, _) => CustomPaint(
          painter: NavBarPainter(_bulgeAnimation.value),
          child: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  key: _iconKeys[0],
                  assetName: 'assets/icons/quill.svg',
                  isSelected: _selectedIndex == 0,
                  onTap: () => _updateBulgePosition(0),
                ),
                NavBarIcon(
                  key: _iconKeys[1],
                  assetName: 'assets/icons/tome.svg',
                  isSelected: _selectedIndex == 1,
                  onTap: () => _updateBulgePosition(1),
                ),
                NavBarIcon(
                  key: _iconKeys[2],
                  assetName: 'assets/icons/profile.svg',
                  isSelected: _selectedIndex == 2,
                  onTap: () => _updateBulgePosition(2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
