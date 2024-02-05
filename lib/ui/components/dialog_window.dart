import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class DialogWindow extends StatelessWidget {
  const DialogWindow({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final int index;
  final String title, text;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        text,
        style: AppStyle.fontStyle.copyWith(
          fontSize: 14,
          color: AppColors.grey,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: () {
            context.go(AppRoutes.changeNotes, extra: index);
            model.setControllers(index);
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.edit,
            color: AppColors.purple,
          ),
          label: Text(
            LocaleKeys.edit.tr(),
            style: AppStyle.fontStyle.copyWith(
              fontSize: 16,
              color: AppColors.purple,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightPurple,
            elevation: 0,
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {
            model.deleteNote(context, index);
          },
          icon: const Icon(
            Icons.delete_forever,
            color: AppColors.red,
          ),
          label: Text(
            LocaleKeys.delete.tr(),
            style: AppStyle.fontStyle.copyWith(
              fontSize: 16,
              color: AppColors.red,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightRed,
            elevation: 0,
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.all(25),
      actionsOverflowAlignment: OverflowBarAlignment.start,
    );
  }
}
