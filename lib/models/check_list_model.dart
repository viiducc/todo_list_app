import 'package:todo_list_app/models/quick_note.dart';

class CheckList extends QuickNote {
  final String title;
  final int color;
  final int length;
  final List<Item> item;
  CheckList(this.title, this.color, this.length, this.item);
}

// Object Item in Check List
class Item {
  final bool checked;
  final String text;
  Item(this.checked, this.text);
}
