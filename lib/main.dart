/*        Author: Mike@lpha       */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MotionController extends GetxController {
  var isButtonExpanded = false.obs;
  var isMenuVisible = false.obs;

  void toggleExpansion() {
    isButtonExpanded.value = !isButtonExpanded.value;
    if (isButtonExpanded.value) {
      isMenuVisible.value = false;
    }
  }

  void toggleMenuVisibility() {
    isMenuVisible.value = !isMenuVisible.value;
  }

  void resetExpansion() {
    isButtonExpanded.value = false;
  }
}

class MotionScreen extends StatelessWidget {
  const MotionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(MotionController());
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey,
              Colors.grey,
              Colors.deepPurpleAccent
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height,
              child: Obx(() => Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: screenSize.height * 0.14,
                    left: screenSize.width * 0.5 - 100,
                    child: GestureDetector(
                      onTap: controller.toggleExpansion,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 14.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(40.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 10.0,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          controller.isButtonExpanded.value ? "Shrink Circle" : "Expand Circle",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // Circle 1
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    top: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .4 : screenSize.width * .45)
                        : screenSize.width * .4,

                    left: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .18 : null) : null,

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .28 : screenSize.width * .76)
                          : screenSize.width * .46,
                      height: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .8 : screenSize.width * .76)
                          : screenSize.width * .46,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: controller.isButtonExpanded.value
                              ? [Colors.yellowAccent, Colors.cyanAccent]
                              : [Colors.cyanAccent, Colors.yellowAccent],
                        ),
                        borderRadius: BorderRadius.circular(controller.isButtonExpanded.value ? 40 : 80),
                      ),
                      child: controller.isButtonExpanded.value
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),

                  // Circle 2
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    top: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .52 : screenSize.width * .63)
                        : (controller.isMenuVisible.value ? screenSize.width * .52 : screenSize.width * .52),
                    left: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .52 : screenSize.width * .19)
                        : screenSize.width * .24,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .22 : screenSize.width * .47)
                          : screenSize.width * .32,
                      height: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .27 : screenSize.width * .47)
                          : screenSize.width * .32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(controller.isButtonExpanded.value
                            ? (controller.isMenuVisible.value ? 25 : 18)
                            : 80),
                        color: Colors.blue.shade400,
                      ),
                    ),
                  ),

                  // Circle 3
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    top: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .82 : 180)
                        : (controller.isMenuVisible.value ? screenSize.width * .54 : screenSize.width * .54),
                    right: controller.isButtonExpanded.value
                        ? (controller.isMenuVisible.value ? screenSize.width * .1 : screenSize.width * .12)
                        : (controller.isMenuVisible.value ? screenSize.width * .28 : screenSize.width * .28),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .18 : screenSize.width * .08)
                          : screenSize.width * .25,
                      height: controller.isButtonExpanded.value
                          ? (controller.isMenuVisible.value ? screenSize.width * .25 : screenSize.width * .1)
                          : screenSize.width * .25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.greenAccent,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Center(
                        child: Opacity(
                          opacity: controller.isButtonExpanded.value ? 0 : 1,
                          child: Text(
                            "Let's Go!",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Menu Icon
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    top: 25,
                    right: 25,
                    child: GestureDetector(
                      onTap: controller.toggleMenuVisibility,
                      child: AnimatedOpacity(
                        opacity: controller.isButtonExpanded.value ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 400),
                        child: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: MotionScreen()));
}
