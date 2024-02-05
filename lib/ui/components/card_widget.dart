import 'package:flutter/material.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.title = '',
    this.text = '',
    this.date = '',
    this.isActive = false,
  });

  final String title, text, date;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: AppColors.black.withOpacity(0.3),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                backgroundColor:
                    isActive ? Colors.yellow.withOpacity(0.3) : null,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              date,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.lightGrey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                color: AppColors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
