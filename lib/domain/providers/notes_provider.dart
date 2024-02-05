import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/domain/hive/hive_box.dart';
import 'package:notes_app/domain/hive/notes_data.dart';
import 'package:notes_app/ui/routes/app_routes.dart';

class NotesProvider extends ChangeNotifier {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  final scrollController = ScrollController();

  //switch
  bool isActive = false;

  onChange(bool value) {
    isActive = value;
    notifyListeners();
  }

  //добавление заметки
  Future<void> onAddNotes(BuildContext context) async {
    await HiveBoxes.notes
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заметка',
            text: noteController.text.isNotEmpty
                ? noteController.text
                : 'Описание',
          ),
        )
        // .then(
        //   (value) => scrollController
        //       .jumpTo(scrollController.position.maxScrollExtent),
        // )
        .then((value) => controllerClear())
        .then(
          (value) => context.go(AppRoutes.home),
        );
  }

  //установка значений
  void setControllers(int index) async {
    titleController.text = HiveBoxes.notes.getAt(index)?.title ?? 'Error';
    noteController.text = HiveBoxes.notes.getAt(index)?.text ?? 'Error';
  }

  //очищение контроллеров
  controllerClear() {
    titleController.clear();
    noteController.clear();
  }

  //удаление заметки
  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBoxes.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  //изменение заметки
  Future<void> onChangeNotes(BuildContext context, int index) async {
    await HiveBoxes.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text,
            text: noteController.text,
          ),
        )
        .then((value) => controllerClear())
        .then((value) => context.go(AppRoutes.home));
  }

  changeLanguage(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(
        const Locale('en'),
      );
    } else {
      context.setLocale(
        const Locale('ru'),
      );
    }
    notifyListeners();
  }
  
  
}
