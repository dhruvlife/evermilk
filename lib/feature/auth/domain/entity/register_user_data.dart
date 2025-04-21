class UserData {
  int? id;
  String? name;
  String? email;
  String? mobile;

  UserData({this.id, this.name, this.email, this.mobile});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['id'] = id;
    response['name'] = name;
    response['email'] = email;
    response['mobile'] = mobile;
    return response;
  }
}
