class SaveRecycleReqModel {
  late int medicineId;
  late int number;
  late DateTime skt;
  late RecycleType type;

  SaveRecycleReqModel(
      {required this.medicineId,
      required this.number,
      required this.skt,
      required this.type});

  toJson() {
    return {
      'medicineId': medicineId,
      'number': number,
      'skt': skt,
      'type': type.name,
    };
  }
}

enum RecycleType { CONSUME, NOT_CONSUME }
