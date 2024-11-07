class PostIncomeModel{
  String? account;
  String? date;
  String? amount;
  String? writeNote;

  PostIncomeModel({this.account, this.date, this.amount, this.writeNote});

  PostIncomeModel.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    date = json['date'];
    amount = json['amount'];
    writeNote = json['write_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['write_note'] = this.writeNote;
    return data;
  }

}