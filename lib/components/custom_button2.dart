import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String? image;
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color imageColor;
  final Color textColor;

  final VoidCallback onPressed;

  const CustomButton2({
    this.image,
    required this.width,
    required this.textColor,
    required this.imageColor,
    required this.height,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null) // Add a null check condition here

            TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          Image(
            image: AssetImage(image!),
            color: imageColor,
          ),
        ],
      ),
    );
  }
}
