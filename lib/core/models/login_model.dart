class UserLoginModel {
  String? message;
  String? homePage;
  String? fullName;
  String? user;
  KeyDetails? keyDetails;

  UserLoginModel(
      {this.message, this.homePage, this.fullName, this.user, this.keyDetails});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    homePage = json['home_page'];
    fullName = json['full_name'];
    user = json['user'];
    keyDetails = json['key_details'] != null
        ? new KeyDetails.fromJson(json['key_details'])
        : null;
  }
  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      message: map['message'],
      homePage: map['home_page'],
      fullName: map['full_name'],
      user: map['user'],
      keyDetails: map['key_details'] != null
          ? KeyDetails.fromMap(map['key_details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['home_page'] = this.homePage;
    data['full_name'] = this.fullName;
    data['user'] = this.user;
    if (this.keyDetails != null) {
      data['key_details'] = this.keyDetails!.toJson();
    }
    return data;
  }
}

class KeyDetails {
  String? apiSecret;
  String? apiKey;

  KeyDetails({this.apiSecret, this.apiKey});

  KeyDetails.fromJson(Map<String, dynamic> json) {
    apiSecret = json['api_secret'];
    apiKey = json['api_key'];
  }

  factory KeyDetails.fromMap(Map<String, dynamic> map) {
    return KeyDetails(
      apiSecret: map['api_secret'],
      apiKey: map['api_key'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_secret'] = this.apiSecret;
    data['api_key'] = this.apiKey;
    return data;
  }
}
