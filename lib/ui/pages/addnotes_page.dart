import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/form_widget.dart';
import 'package:notes_app/ui/components/go_home.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class AddNotesPage extends StatelessWidget {
  const AddNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(LocaleKeys.addNotes.tr(), style: AppStyle.fontStyle),
        centerTitle: true,
        leading: const GoHome(),
      ),
      body: FormWidget(
        btnText: LocaleKeys.add.tr(),
        func: () {
          model.onAddNotes(context);
        },
      ),
    );
  }
}
