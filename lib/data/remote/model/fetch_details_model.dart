class FetchDetailsResponse {
  String? message;
  User? user;

  FetchDetailsResponse({this.message, this.user});

  FetchDetailsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? phone;
  String? email;
  String? dob;
  String? name;

  User({this.phone, this.email, this.dob, this.name});

  User.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    dob = json['dob'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    data['dob'] = dob;
    data['name'] = name;
    return data;
  }
}

class FetchDetailsPayload {
  String? card91UserId;
  String? name;
  String? email;
  String? dob;

  FetchDetailsPayload({this.card91UserId, this.name, this.email, this.dob});

  FetchDetailsPayload.fromJson(Map<String, dynamic> json) {
    card91UserId = json['card91_user_id'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card91_user_id'] = card91UserId;
    data['name'] = name;
    data['email'] = email;
    data['dob'] = dob;
    return data;
  }
}
