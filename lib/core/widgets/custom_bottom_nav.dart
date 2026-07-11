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
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(
            index: 0,
            icon: Icons.home,
            text: "Home",
          ),

          _item(
            index: 1,
            icon: Icons.star,
            text: "Features",
          ),

          _item(
            index: 2,
            icon: Icons.groups_outlined,
            text: "Community",
          ),

          _item(
            index: 3,
            icon: Icons.favorite_border,
            text: "Favourite",
          ),

          _item(
            index: 4,
            icon: Icons.settings_outlined,
            text: "Settings",
          ),
        ],
      ),
    );
  }

  Widget _item({
    required int index,
    required IconData icon,
    required String text,
  }) {
    final bool selected = currentIndex == index;

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
            color: selected ? Colors.red : Colors.grey,
          ),

          const SizedBox(height: 4),

          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.red : Colors.grey,
              fontWeight:
              selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}