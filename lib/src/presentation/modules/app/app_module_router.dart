import 'package:flutter/material.dart';

class AppModuleRouter extends StatelessWidget {
  const AppModuleRouter({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return SafeArea(
      child: Scaffold(
        body: PageView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          children: [
            Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  'Page 1',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Page 2',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Page 3',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
