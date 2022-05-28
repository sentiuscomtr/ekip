class MessageResponseModel {
  late int date;
  late String message;
  late String sender;

  MessageResponseModel({required Map<String, dynamic> map}) {
    date = map['date'];
    message = map['message'];
    sender = map['sender'];
  }
}
