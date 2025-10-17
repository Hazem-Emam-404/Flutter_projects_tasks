import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  AppBottomNav({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.list,
                color: index == 0 ? Color(0xFF4CAF50) : Color(0xFF2196F3),
              ),
              onPressed: () => onTap(0),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.autorenew,
                color: index == 1 ? Color(0xFF4CAF50) : Color(0xFF2196F3),
              ),
              onPressed: () => onTap(1),
            ),
          ),
          Expanded(child: SizedBox()),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.check_circle,
                color: index == 2 ? Color(0xFF4CAF50) : Color(0xFF2196F3),
              ),
              onPressed: () => onTap(2),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.add, color: Color(0xFF2196F3)),
              onPressed: () => onTap(0),
            ),
          ),
        ],
      ),
    );
  }
}
