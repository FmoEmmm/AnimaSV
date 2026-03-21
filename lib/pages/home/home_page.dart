import 'dart:io';
import 'package:animasv/module/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    FilledButton(
                      child: Text("Home"),
                      onPressed: () {
                        Navigator.pop(context);
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
