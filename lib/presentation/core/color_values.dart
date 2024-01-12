import 'dart:ui';

class ColorValues {
  static const background = Color(0xFFFAFAFA);
  static const primary50 = Color(0xFF6A6DB0);
  static const primary30 = Color(0xFFA6A7D0);
  static const primary10 = Color(0xFFE1E2EF);
  static const grey90 = Color(0xFF131414);
  static const grey50 = Color(0xFF5F6265);
  static const grey30 = Color(0xFF9BB7C8);
  static const grey20 = Color(0xFFBFC0C1);
  static const grey10 = Color(0xFFDFE0E0);
  static const grey5 = Color(0xFFF5F5F5);
  static const text50 = Color(0xFF131414);
  static const text20 = Color(0xFF9BB7C9);
  static const info90 = Color(0xFF0B1D31);
  static const info50 = Color(0xFF3892F3);
  static const info20 = Color(0xFFAFD3FA);
  static const info10 = Color(0xFFD7E9FD);
  static const danger50 = Color(0xFFEA3829);
  static const danger30 = Color(0xFFF2887F);
  static const danger20 = Color(0xFFF7AFA9);
  static const danger10 = Color(0xFFFBD7D4);
  static const warning50 = Color(0xFFF68524);
  static const warning30 = Color(0xFFFAB67C);
  static const warning10 = Color(0xFFFDE7D3);
  static const success50 = Color(0xFF0BAC74);
  static const success40 = Color(0xFF67CD82);
  static const success30 = Color(0xFF6CCDAB);
  static const success20 = Color(0xFF9DDEC7);
  static const success10 = Color(0xFFCEEEE3);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  static Color lighten(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    return Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round()
    );
  }

  static Color darken(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    return Color.fromARGB(
        c.alpha,
        (c.red * f).round(),
        (c.green  * f).round(),
        (c.blue * f).round()
    );
  }
}
