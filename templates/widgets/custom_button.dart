import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color colorBack;
  final Color colorFront;

  const CustomButton({
    super.key,
    required this.title,
    required this.onPress,
    this.colorBack = Colors.blue,
    this.colorFront = Colors.white,
  });

  @override
  Widget build(BuildContext context) =>  SizedBox(
    width: double.infinity,
    height: 40,
    child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorBack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(title,style: TextStyle(color: colorFront),),
      ),
  );
}
