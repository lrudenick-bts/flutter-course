import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
  
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Riverpod Counter", 
    subTitle: "Riverpod introduction", 
    link: '/counter-river', 
    icon: Icons.add_circle_outline_rounded
  ),
  MenuItem(
    title: "Buttons", 
    subTitle: "Several buttons in Flutter", 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: "Cards", 
    subTitle: "A stylized container", 
    link: '/cards', 
    icon: Icons.credit_card
  ),
  MenuItem(
    title: "Progress Indicators", 
    subTitle: "General and controlled", 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: "Snackbars & dialogs", 
    subTitle: "Screen indicators", 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),
  MenuItem(
    title: "Animations", 
    subTitle: "Animated stateful widget", 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_rounded
  ),
  MenuItem(
    title: "UI Controls + Tiles", 
    subTitle: "Several Flutter's controls", 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
  ),
  MenuItem(
    title: "App tutorial", 
    subTitle: "Little app tutorial", 
    link: '/tutorial', 
    icon: Icons.accessible_rounded
  ),
  MenuItem(
    title: "Infinite Scroll & Pull", 
    subTitle: "Infinite scroll and pull to refresh", 
    link: '/infinite', 
    icon: Icons.list_alt_rounded
  ),
  MenuItem(
    title: "Theme changer", 
    subTitle: "Change app's theme", 
    link: '/theme-changer', 
    icon: Icons.color_lens_outlined
  )
];