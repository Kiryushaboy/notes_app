import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

abstract class HiveBoxes {
  static final notes = Hive.box<NotesData>('notes');
}
