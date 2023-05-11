import 'package:flutter/material.dart';

import '../../core/ui/helpers/size_extensions.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;

  const BaseLayout({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final shortestSide = context.screenShortestSide;
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                minWidth: screenWidth,
                minHeight: shortestSide * .15,
                maxHeight: shortestSide * .15,
              ),
              child: Container(
                width: shortestSide * .13,
                margin: const EdgeInsets.only(
                  left: 60,
                ),
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    'assets/images/logo-home.png',
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: shortestSide * .13,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: double.infinity,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        color: Colors.grey[50]!,
                        child: body,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
