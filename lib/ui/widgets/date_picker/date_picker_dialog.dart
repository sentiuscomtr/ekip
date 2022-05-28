import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeInputContainer extends StatelessWidget {
  late String text;
  late BuildContext renderContext;
  late ValueChanged<DateTime> changed;
  DateTimeInputContainer(
      {Key? key,
      required this.renderContext,
      required this.text,
      required this.changed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWith = MediaQuery.of(context).size.width;
    var screenPix = screenWith * screenHeight / 1000;
    return InkWell(
        onTap: () {
          showSheet(context, child: buildDatePicker(), onClicked: () {
            Navigator.pop(context);
          });
        },
        child: Container(
            padding: EdgeInsets.all(screenPix / 30),
            alignment: Alignment.centerLeft,
            height: screenHeight / 17,
            width: screenWith / 1.2,
            decoration: BoxDecoration(
                color: Color(0xffF0F2F1),
                borderRadius: BorderRadius.circular(screenPix / 50)),
            child: Row(children: [
              Text(text,
                  style: TextStyle(
                      fontSize: screenPix / 16,
                      color: const Color(0xff717171))),
              const Spacer(),
              Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.date_range))
            ])));
  }

  void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) => CupertinoActionSheet(
                  actions: [
                    child,
                  ],
                  cancelButton: CupertinoActionSheetAction(
                      child: const Text('Seç'), onPressed: onClicked)));

  void showSnackBar(BuildContext context, String text) {
    final snackBar =
        SnackBar(content: Text(text, style: const TextStyle(fontSize: 24)));

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Widget buildDatePicker() => SizedBox(
      height: 150,
      child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          minimumYear: 1930,
          initialDateTime: initalDateTime(),
          maximumYear: DateTime.now().year + 20,
          onDateTimeChanged: changed));

  DateTime initalDateTime() {
    DateTime dateTime = DateTime(DateTime.now().year - 4);
    return dateTime;
  }
}
