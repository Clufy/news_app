import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context){
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
            ListTile(
              leading:  const Icon(Icons.newspaper),
              title:  const Text('newspaper'),
              onTap: () => _usa(context),
            ),
          ]
    ),
      );
  }
}
void _usa(BuildContext context){
  Navigator.pushNamed(context, '/Usa');
}