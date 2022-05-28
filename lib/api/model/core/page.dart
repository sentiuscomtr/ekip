class BasePage<T> {
  List<T> content = [];
  late bool last = false;
  late bool first;
  late bool empty;
  late int totalPages;
  late int totalElements;
  late int size;
  BasePage.of();
  BasePage({required Map<String, dynamic> map}) {
    last = map["last"];
    first = map["first"];
    empty = map["empty"];
    totalPages = map["totalPages"];
    totalElements = map["totalElements"];
    size = map["size"];
    content = map['content'];
  }
}
