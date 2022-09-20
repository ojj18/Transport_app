class BillingModel {
  String? billNo;
  String? date;
  String? receiverName;
  String? senderName;
  String? location;
  String? total;
  String? time;

  BillingModel(
      {this.billNo,
      this.date,
      this.receiverName,
      this.senderName,
      this.location,
      this.total,
      this.time});

  BillingModel.fromJson(Map<String, dynamic> json) {
    billNo = json['billNo'];
    date = json['date'];
    receiverName = json['receiverName'];
    senderName = json['senderName'];
    location = json['location'];
    total = json['total'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['billNo'] = billNo;
    data['date'] = date;
    data['receiverName'] = receiverName;
    data['senderName'] = senderName;
    data['location'] = location;
    data['total'] = total;
    data['time'] = time;
    return data;
  }
}
