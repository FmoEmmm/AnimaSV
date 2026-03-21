import 'dart:io';
import 'package:animasv/route/router.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:liquid_glass_widgets/liquid_glass_setup.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LiquidGlassWidgets.initialize();

  try {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      titleBarStyle: TitleBarStyle.hidden,
      size: Size(900, 600),

      //minimumSize: Size(300, 450),
      center: true,
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      skipTaskbar: false,
      title: "AniSV",
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      if (Platform.isMacOS) {
        print("MAC");
      } else if (Platform.isWindows) {
        await windowManager.setBackgroundColor(
          const Color.fromARGB(0, 0, 0, 0),
        );
      }

      await windowManager.show();
      await windowManager.focus();
    });
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      themeMode: ThemeMode.system,
      theme: FluentThemeData.light(),
      darkTheme: FluentThemeData.dark(),
      title: "AniSV",
      //home: WelcomePage(),
      initialRoute: "/welcome",
      routes: getRootRoutes(),
    );
  }
}
