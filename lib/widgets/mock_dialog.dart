import 'package:flutter/material.dart';

class MockDialog extends StatelessWidget {
  final String title;
  final String content;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback? onLeftButtonTap;
  final VoidCallback? onRightButtonTap;

  const MockDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.leftButtonText,
    required this.rightButtonText,
    this.onLeftButtonTap,
    this.onRightButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(content),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onLeftButtonTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        leftButtonText,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onRightButtonTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(
                      rightButtonText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
