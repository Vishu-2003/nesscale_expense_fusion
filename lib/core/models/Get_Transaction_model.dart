class GetTransactionModel {
  final dynamic name;
  final dynamic account;
  final dynamic date;
  final dynamic amount;
  final dynamic writeNote;
  final dynamic space;
  final dynamic type; // 'expense' or 'income'

  GetTransactionModel({
    required this.name,
    required this.account,
    required this.date,
    required this.amount,
    required this.writeNote,
    required this.space,
    required this.type,
  });

  // Factory method to create a Transaction object from JSON
  factory GetTransactionModel.fromJson(Map<String, dynamic> json, String type) {
    return GetTransactionModel(
      name: json['name'] as String,
      account: json['account'] as String,
      date: json['date'] as String,
      amount: (json['amount'] is int)
          ? json['amount'] as int
          : (json['amount'] as double).toInt(),
      writeNote: json['write_note'] as String,
      space: json['space'] as String,
      type: type,
    );
  }

  // Method to convert a Transaction object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'account': account,
      'date': date,
      'amount': amount,
      'write_note': writeNote,
      'space': space,
      'type': type,
    };
  }
  @override
  String toString() {
    return 'GetTransactionModel(name: $name, account: $account, date: $date, amount: $amount, writeNote: $writeNote, space: $space, type: $type)';
  }
}
List<GetTransactionModel> parseTransactions(Map<String, dynamic> data) {
  List<GetTransactionModel> transactions = [];
  for (var expense in data['expenses_transaction']) {
    transactions.add(GetTransactionModel.fromJson(expense, 'expense'));
  }
  for (var income in data['income_transaction']) {
    transactions.add(GetTransactionModel.fromJson(income, 'income'));
  }
  return transactions;
}
