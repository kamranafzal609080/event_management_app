import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: isDark ? theme.scaffoldBackgroundColor : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.white12 : const Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(context, index: 0, icon: Icons.home, text: "Home"),
          _item(context, index: 1, icon: Icons.star, text: "Features"),
          _item(context, index: 2, icon: Icons.groups_outlined, text: "Community"),
          _item(context, index: 3, icon: Icons.favorite_border, text: "Favourite"),
          _item(context, index: 4, icon: Icons.settings_outlined, text: "Settings"),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, {
    required int index,
    required IconData icon,
    required String text,
  }) {
    final bool selected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: selected ? Colors.red : (isDark ? Colors.white60 : Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.red : (isDark ? Colors.white60 : Colors.grey),
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
