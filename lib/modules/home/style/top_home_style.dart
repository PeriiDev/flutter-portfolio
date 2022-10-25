part of '../home.dart';

class TopHomeStyle {

  
  static TextStyle styleMyNameIs = const TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontFamily: 'Robl',
    shadows: [
      BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10),
    ],
  );
  static TextStyle sAboutMeTitle = const TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: 'Robb',
    shadows: [
      BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10),
    ],
  );
  static TextStyle sAboutMe = const TextStyle(
    fontSize: 18,
    color: Color.fromARGB(255, 193, 193, 193),
    fontFamily: 'Robr',
    shadows: [
      BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10),
    ],
  );


  static const decoration = BoxDecoration(
  //borderRadius: BorderRadius.circular(100),
  borderRadius: BorderRadius.all(Radius.circular(100)),
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 182, 255, 205),
      Color.fromARGB(255, 75, 146, 117),
    ],
  ),
);

  static TextStyle style(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: Responsive.isMobile(context)
          ? 50
          : Responsive.isTablet(context)
              ? 75
              : 100,
      fontFamily: 'Robb',
    );
  }

  static TextStyle sDefault(BuildContext context) {
    return TextStyle(
        fontFamily: 'Robr',
        shadows: const [BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 10)],
        color: const Color.fromARGB(255, 226, 224, 224),
        fontSize: Responsive.isMobile(context)
            ? 14
            : Responsive.isTablet(context)
                ? 17
                : 20);
  }
}


