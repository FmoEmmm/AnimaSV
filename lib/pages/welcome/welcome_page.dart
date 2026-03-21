import 'dart:io';
import 'package:animasv/module/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WindowListener {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      padding: EdgeInsets.all(0),
      content: Stack(
        children: [
          DragToMoveArea(
            child: Container(
              color: FluentTheme.of(context).micaBackgroundColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/app_icon.ico", width: 100, height: 100),
                    SizedBox(height: 20),
                    Text(
                      "Welcome ",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    FilledButton(
                      child: Text("Enter"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Platform.isWindows
              ? Positioned(top: 0, right: 0, child: WindowButtons())
              : Container(),
        ],
      ),
    );
  }
}
