import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Center(
        child: FaIcon(
          FontAwesomeIcons.barsStaggered,
          color: Colors.black,
          size: 20,
        ),
      ),
      actions: [
        Center(
          child: Text(
            'online'.toUpperCase(),
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff4567F6),
            onPressed: () {},
            child: const FaIcon(Icons.podcasts),
          ),
        ),
        const SizedBox(width: 18)
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
