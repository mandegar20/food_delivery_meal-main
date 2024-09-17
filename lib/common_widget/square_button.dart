import 'package:flutter/material.dart';

import '../common/color_extension.dart';

enum SquareButtonType { bgPrimary, textPrimary, secondaryText }

class SquareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final SquareButtonType type;
  final double fontSize;
  const SquareButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.fontSize = 16,
      this.type = SquareButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == SquareButtonType.bgPrimary
              ? null
              : Border.all(color: TColor.primary, width: 1),
          color: type == SquareButtonType.bgPrimary
              ? TColor.primary
              : TColor.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: type == SquareButtonType.bgPrimary
                  ? TColor.white
                  : TColor.primary,
              fontSize: fontSize,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
