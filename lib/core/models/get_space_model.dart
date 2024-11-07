class GetSpaceModel {
  String? name;
  dynamic spaceName;

  GetSpaceModel({this.name, this.spaceName});

  GetSpaceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    spaceName = json['space_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['space_name'] = this.spaceName;
    return data;
  }
}

