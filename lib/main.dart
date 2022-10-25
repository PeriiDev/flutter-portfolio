import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:flutter_portfolio/exports.dart';
import 'package:flutter_portfolio/global/theme/app_theme.dart';
import 'package:flutter_portfolio/global/widgets/effects/e_animated_cursor_screen.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedro Navarro Flutter Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LayoutBuilder(
        builder: (context, constraints) {
          return Responsive.isMobile(context)
              ? const HomePage()
              : const EAnimatedCursorScreen(child: HomePage());
        },
      ),
    );
  }
}
