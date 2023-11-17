import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ViewAllTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const ViewAllTitleRow({super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onView,
          child: Text(
            "مشاهده همه",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
