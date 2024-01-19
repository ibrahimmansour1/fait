part of '../views/nav_bar_screens/profile_screen.dart';

class MyAvatarSectionWidget extends StatelessWidget {
  const MyAvatarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'My Avatar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
