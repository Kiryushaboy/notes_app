import 'package:go_router/go_router.dart';
import 'package:notes_app/ui/pages/addnotes_page.dart';
import 'package:notes_app/ui/pages/changenotes_page.dart';
import 'package:notes_app/ui/pages/home_page.dart';
import 'package:notes_app/ui/pages/note_about_page.dart';
import 'package:notes_app/ui/pages/search_page.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class AppNavigator {
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.addNotes,
        builder: (context, state) => const AddNotesPage(),
      ),
      GoRoute(
        path: AppRoutes.changeNotes,
        builder: (context, state) => const ChangeNotesPage(),
      ),
      GoRoute(
        path: AppRoutes.noteAbout,
        builder: (context, state) => const NoteAboutPage(),
      ),
      GoRoute(
        path: AppRoutes.searchNotes,
        builder: (context, state) => const SearchPage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
