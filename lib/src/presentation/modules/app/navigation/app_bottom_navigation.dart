import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/presentation/Shared/widgets_builder.dart';

class AppBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.black,
      child: Row(
        children: [
          _buildNavItem(
            icon: CupertinoIcons.home,
            label: 'HOME',
            index: 0,
            context: context,
          ),
          _buildNavItem(
            icon: CupertinoIcons.square_list,
            label: 'MENÙ',
            index: 1,
            context: context,
          ),
          _buildNavItem(
            icon: CupertinoIcons.map,
            label: 'RISTORANTI',
            index: 2,
            context: context,
          ),
          _buildNavItem(
            icon: CupertinoIcons.list_dash,
            label: 'ALTRO',
            index: 3,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.red : Colors.white,
                size: 24,
              ),
              SizedBox(height: 4),
              fadedText(
                text: label,
                textColor: isSelected ? Colors.red : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
