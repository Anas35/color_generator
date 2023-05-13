import 'package:color_generator/src/color_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Root widget of this Application
class App extends StatefulWidget {
  /// Default Constructor
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Instance of colorGenerator that handle color generator logic
  final colorGenerator = ColorGenerator();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorGenerator,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: colorGenerator.color,
          body: child,
        );
      },
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.enter): () {
            colorGenerator.changeColor();
          },
        },
        child: InkWell(
          autofocus: true,
          onTap: () => colorGenerator.changeColor(),
          child: const Center(
            child: Text('Hello there!'),
          ),
        ),
      ),
    );
  }
}
