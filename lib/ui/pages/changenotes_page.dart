import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/form_widget.dart';
import 'package:notes_app/ui/components/go_home.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotesPage extends StatelessWidget {
  const ChangeNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    final index = extra is int ? extra : 0;

    final model = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(LocaleKeys.changeNote.tr(), style: AppStyle.fontStyle),
        centerTitle: true,
        leading: const GoHome(),
      ),
      body: FormWidget(
        btnText: LocaleKeys.change.tr(),
        func: () {
          model.onChangeNotes(context, index);
        },
      ),
    );
  }
}
