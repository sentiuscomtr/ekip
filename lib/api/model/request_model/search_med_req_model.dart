class SearchMedReqModel {
  late String keyword;

  SearchMedReqModel({required this.keyword});

  String read() {
    return "keyword=" + keyword;
  }
}
