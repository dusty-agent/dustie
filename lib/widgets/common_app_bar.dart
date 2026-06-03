import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      toolbarHeight: 72,

      elevation: 0,

      titleSpacing: 16,

      title: Row(
        children: [
          /// Dustie avatar
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(21)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              child: Image.asset(
                'assets/images/dustie-person.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// title + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Dustie',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 2),

                Text(
                  'A quiet companion for unfinished thoughts.',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline),
          tooltip: 'About Dustie',
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}
