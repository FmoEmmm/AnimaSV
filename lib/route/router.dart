import 'package:animasv/pages/home/home_page.dart';
import 'package:animasv/pages/welcome/welcome_page.dart';
import 'package:fluent_ui/fluent_ui.dart';

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/welcome": (context) => WelcomePage(),
    "/home": (context) => HomePage(),
  };
}
