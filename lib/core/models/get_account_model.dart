class GetAccountModel {
  String? name;
  dynamic accountName;
  dynamic amount;

  GetAccountModel({this.name, this.accountName, this.amount});

  GetAccountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountName = json['account_name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['account_name'] = this.accountName;
    data['amount'] = this.amount;
    return data;
  }
}

