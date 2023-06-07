import 'package:bingo/models/bingo_item.dart';
import 'package:bingo/storage/bingo_items.dart';
import 'package:bingo/storage/storage.dart';
import 'package:rxdart/subjects.dart';

class BingoProvider {
  static final BingoProvider _singleton = BingoProvider._internal();

  factory BingoProvider() {
    return _singleton;
  }

  Future<void> init() async {
    List<String> checkedItems = await BingoStorage().getItems();
    List<BingoItem> items = allItems
        .map((e) => BingoItem(e, checkedItems.contains(e) ? true : false))
        .toList();
    _setItems(items);
  }

  final BehaviorSubject<List<BingoItem>> _bingoItems =
      BehaviorSubject<List<BingoItem>>();

  Stream<List<BingoItem>> get bingoItems => _bingoItems.stream;

  List<BingoItem> get items => _bingoItems.value;
  void _setItems(List<BingoItem> items) => _bingoItems.add(items);

  void toggle (String text) {
    List<BingoItem> items = _bingoItems.value;
    int index = items.indexWhere((element) => element.text == text);
    items[index] = items[index].copyWith(selected: !items[index].selected);
    _setItems(items);
    BingoStorage().setItems(items.where((element) => element.selected).map((e) => e.text).toList());
  }

  BingoProvider._internal();
}
