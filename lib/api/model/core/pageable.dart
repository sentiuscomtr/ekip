class Pageable {
  int? size = 10;
  int? page = 0;
  String? sort;
  SortType? sortType;
  Pageable({this.size, this.page, this.sort, this.sortType});
  String read() {
    String to = "";
    to = to + "size=" + size.toString();

    to = to + "&" + "page=" + page.toString();

    if (sort != null) {
      to = to + "&" + "sort=" + sort!;
      switch (sortType) {
        case SortType.asc:
          {
            to = to + ",ASC";
          }
          break;
        case SortType.desc:
          to = to + ",DESC";
          break;
        default:
          to + ",ASC";
      }
    }
    return to;
  }
}

enum SortType { asc, desc }
