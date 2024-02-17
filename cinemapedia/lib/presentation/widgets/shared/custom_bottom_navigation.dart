import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});


  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      selectedItemColor: colors.primary,
      elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_max)
          ),
          BottomNavigationBarItem(
            label: 'Popular',
            icon: Icon(Icons.thumbs_up_down_outlined)
          ),
          BottomNavigationBarItem(
            label: 'Favourites',
            icon: Icon(Icons.favorite_outline)
          )
        ]
      );
  }
}
