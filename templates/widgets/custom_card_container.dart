import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  final Widget childContainer;
  final Color cardColor;
  final double? widthContainer;
  final bool isShadow;
  final bool isBorder;
  final double borderRadius;
  final Color borderColor;
  final VoidCallback? onTapCard;
  final double padding;
  const CustomCardContainer({
    super.key,
    required this.childContainer,
    this.cardColor = Colors.white,
    this.widthContainer,
    this.isShadow = true,
    this.isBorder = false,
    this.borderRadius = 15,
    this.borderColor = Colors.grey,
    this.onTapCard,
    this.padding = 12
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
      padding: EdgeInsets.all(padding),
      width: widthContainer,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: isBorder?Border.all(width: 1, color:borderColor.withOpacity(0.5)) :Border(),
        boxShadow: [
          BoxShadow(
            color: isShadow?Colors.black.withOpacity(0.2):Colors.black.withOpacity(0.01),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: childContainer,
    )
    );
  }
}
