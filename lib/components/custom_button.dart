import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? image;
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textColor;

  final VoidCallback onPressed;

  const CustomButton({
    this.image,
    required this.width,
    required this.textColor,
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
            Image(image: AssetImage(image!)),
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
        ],
      ),
    );
  }
}
