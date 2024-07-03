import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Listtile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textcolor;

  const Listtile(
      {super.key,
      required this.title,
      required this.leadingIcon,
      required this.onPress,
      this.endIcon = true,
      this.textcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color.fromARGB(255, 250, 88, 60).withOpacity(0.1)),
          child: Icon(leadingIcon, color: Color.fromARGB(255, 250, 88, 60))),
      title: Text(
        title,
        style: TextStyle(
            color: textcolor, fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: Icon(LineAwesomeIcons.angle_right_solid,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}
