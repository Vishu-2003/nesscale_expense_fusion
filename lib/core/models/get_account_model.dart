class GetAccountModel {
  String? name;
  String? accountName;
  dynamic amount;
  String? space;

  GetAccountModel({this.name, this.accountName, this.amount, this.space});

  GetAccountModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountName = json['account_name'];
    amount = json['amount'];
    space = json['space'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['account_name'] = this.accountName;
    data['amount'] = this.amount;
    data['space'] = this.space;
    return data;
  }
}

