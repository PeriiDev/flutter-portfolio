import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawler extends StatelessWidget {
  const CustomDrawler({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            //buildDrawerHeader(context),
            //LIST ITEMS
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Wrap(
                    //runSpacing: 2,
                    children: buildDrawerItems(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildDrawerItems(BuildContext context) {
  final menuItems = [
    const ListTile(leading: Icon(Icons.home), title: Text("Home")),
    const ListTile(
      leading: Icon(FontAwesomeIcons.youtube),
      title: Text("Youtube"),
      // onTap: () => {Navigator.pushNamed(context, "sport")},
    ),
    const ListTile(leading: Icon(FontAwesomeIcons.fileContract), title: Text("Hire me")),
  ];
  return menuItems;
}
