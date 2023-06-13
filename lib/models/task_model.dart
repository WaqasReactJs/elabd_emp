class TaskModel {
  String? key;
  String? value;

  TaskModel({this.key, this.value});

  TaskModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json["value"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["key"] = this.key;
    data["value"] = this.value;
    return data;
  }
}
