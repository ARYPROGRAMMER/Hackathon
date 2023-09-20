import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodify/main.dart';
import 'package:page_transition/page_transition.dart';

import 'package:moodify/shape_image_positioned.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String id = 'welcome_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final double _buttonWidth = 100;

  late AnimationController _buttonScaleController;
  late Animation<double> _buttonScaleAnimation;
  void _initButtonScale() {
    _buttonScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _buttonScaleAnimation =
        Tween<double>(begin: 1, end: .9).animate(_buttonScaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _buttonWidthController.forward();
            }
          });
  }

  late AnimationController _buttonWidthController;
  late Animation<double> _buttonWidthAnimation;
  void _initButtonWidth(double screenWidth) {
    _buttonWidthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _buttonWidthAnimation = Tween<double>(begin: _buttonWidth, end: screenWidth)
        .animate(_buttonWidthController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _positionedController.forward();
        }
      });
  }

  late AnimationController _positionedController;
  late Animation<double> _positionedAnimation;
  void _initPositioned(double screenWidth) {
    _positionedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    // 160 = 20 left padding + 20 right padding + 10 left positioned + 10 right positioned + 100 button width
    _positionedAnimation = Tween<double>(begin: 10, end: screenWidth - 160)
        .animate(_positionedController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _screenScaleController.forward();
        }
      });
  }

  late AnimationController _screenScaleController;
  late Animation<double> _screenScaleAnimation;
  void _initScreenScale() {
    _screenScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _screenScaleAnimation =
        Tween<double>(begin: 1, end: 24).animate(_screenScaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const MyHomePage(),
                      type: PageTransitionType.fade));
            }
          });
  }

  @override
  void initState() {
    _initButtonScale();
    _initScreenScale();
    super.initState();
  }

  @override
  void dispose() {
    _buttonScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _initButtonWidth(screenWidth);
    _initPositioned(screenWidth);

    return CupertinoPageScaffold(
      backgroundColor: const Color(0xff95C8D8),
      child: Stack(
        children: [

        Positioned(
          top: 420,
          left:  55,
          child: const Text(
          'WELCOME BACK',
          style: TextStyle(
              color: const Color(0xFF4e4e94),
              fontSize: 40,
              fontWeight: FontWeight.bold),
      )),
       Positioned(
         top: 510,
         left: 21,
         child: Text(
          'Your Mental Health is EVERYTHING',
          style: TextStyle(
              color: const Color(0xFFAA336A),
              fontSize: 22,
              height: 1.5,
              fontFamily: "FontMain"),
      ),
       ),
          Positioned(
            top: 554,
            left: 80,
            child: Text(
              'AND WE CARE ABOUT IT',
              style: TextStyle(
                  color: const Color(0xFFAA336A),
                  fontSize: 22,
                  height: 1.5,
                  fontFamily: "FontMain2"),
            ),
          ),
          const ShapeImagePositioned(),
          const ShapeImagePositioned(top: -100),
          const ShapeImagePositioned(top: -150),
          const ShapeImagePositioned(top: -200),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 500,
                    height: 500,
                    child:Image.asset("assets/images/health3.png")
                  ),
                ),
              const SizedBox(
                height: 150,
              ),


                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AnimatedBuilder(
                    animation: _buttonScaleController,
                    builder: (_, child) => Transform.scale(
                      scale: _buttonScaleAnimation.value,
                      child: CupertinoButton(
                        onPressed: () {
                          _buttonScaleController.forward();
                        },
                        child: Stack(
                          children: [
                            AnimatedBuilder(
                              animation: _buttonWidthController,
                              builder: (_, child) => Container(
                                height: _buttonWidth,
                                width: _buttonWidthAnimation.value,
                                decoration: BoxDecoration(
                                  color: CupertinoColors.systemPurple
                                      .withOpacity(.7),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            AnimatedBuilder(
                              animation: _positionedController,
                              builder: (_, child) => Positioned(
                                top: 10,
                                left: _positionedAnimation.value,
                                child: AnimatedBuilder(
                                  animation: _screenScaleController,
                                  builder: (_, child) => Transform.scale(
                                    scale: _screenScaleAnimation.value,
                                    child: Container(
                                      height: _buttonWidth - 20,
                                      width: _buttonWidth - 20,
                                      decoration: const BoxDecoration(
                                        color: CupertinoColors.systemIndigo,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: Alignment.center,
                                      child: _screenScaleController.isDismissed
                                          ? const Icon(
                                              CupertinoIcons.chevron_forward,
                                              color: CupertinoColors.white,
                                              size: 35,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
