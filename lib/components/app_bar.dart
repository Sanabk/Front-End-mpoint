import 'package:flutter/material.dart';
import 'package:meetme/screens/account_screen.dart';

class kAppBar extends StatelessWidget implements PreferredSizeWidget {
  kAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Orbit'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.account_circle),
          tooltip: 'My Account',
          onPressed: () {
            Navigator.pushNamed(context, AccountScreen.id);
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
