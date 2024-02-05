import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';

class NoteAboutPage extends StatelessWidget {
  const NoteAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final extra =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra;

    final index = extra is int ? extra : 0;

    final notes = HiveBoxes.notes.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          notes[index].title,
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          notes[index].text,
          style: AppStyle.fontStyle,
        ),
      ),
    );
  }
}
