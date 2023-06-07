class BingoItem {
  final String text;
  final bool selected;

  BingoItem(this.text, this.selected);

  @override
  String toString() => 'BingoItem{text: $text, selected: $selected}';

  BingoItem copyWith({String? text, bool? selected}) {
    return BingoItem(
      text ?? this.text,
      selected ?? this.selected,
    );
  }
}
