import 'package:animated_widgets_flutter/widgets/opacity_animated.dart';
 import 'package:flutter/material.dart';
import '../core/general_widgets.dart';
import 'toggle_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OpacityAnimatedWidget.tween(
            opacityEnabled: 1,
            opacityDisabled: 0,
            duration: const Duration(milliseconds: 3000),
            enabled: true,
            animationFinished: (finished) async {},
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: MediaQuery.of(context).size.width / 1.5,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset("images/start.jpg", fit: BoxFit.fill)
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppButton(
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Start", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_outlined,
                              size: 28, color: Colors.white)
                        ]),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToggleScreen()),
                          (route) => false);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
