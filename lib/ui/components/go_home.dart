import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/routes/app_routes.dart';
import 'package:notes_app/ui/style/app_colors.dart';

class GoHome extends StatelessWidget {
  const GoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(AppRoutes.home);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.black,
      ),
    );
  }
}
