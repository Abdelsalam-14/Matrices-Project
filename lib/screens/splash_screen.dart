import 'package:animated_widgets_flutter/widgets/opacity_animated.dart';
import 'package:flutter/material.dart';
import 'toggle_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: OpacityAnimatedWidget.tween(
            opacityEnabled: 1,
            opacityDisabled: 0,
            duration: const Duration(milliseconds: 3000),
            enabled: true,
            animationFinished: (finished) async {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const ToggleScreen()),
                  (route) => false);
            },
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("images/start.jpg", fit: BoxFit.fill),
            ),
          ),
        ),
      ],
    );
  }
}
