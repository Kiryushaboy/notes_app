import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/notes_body.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';
import 'package:notes_app/ui/style/app_style.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();

    return Scaffold(
      drawer: Drawer(
        width: 80,
        child: SafeArea(
          child: Column(
            children: [
              Switch(
                value: model.isActive,
                onChanged: (val) {
                  model.onChange(val);
                },
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                backgroundColor: AppColors.grey,
                onPressed: () {
                  model.changeLanguage(context);
                },
                child: const Icon(Icons.language),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: const OpenDrawer(),
        title: Text(LocaleKeys.notes.tr(), style: AppStyle.fontStyle),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.go(AppRoutes.searchNotes);
            },
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      body: const NotesBody(),
      floatingActionButton: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton.extended(
          heroTag: 'add-btn',
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          onPressed: () {
            context.go(AppRoutes.addNotes);
          },
          label: const Icon(
            Icons.edit_outlined,
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}

class OpenDrawer extends StatelessWidget {
  const OpenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: AppColors.grey,
      ),
    );
  }
}
