import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomCurvedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomCurvedAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF5AC8FA),
      foregroundColor: Colors.white,
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: ClipPath(
        clipper: MultipleRoundedCurveClipper(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //height: preferredSize.height,
        ),
      ),
    );
  }
}
