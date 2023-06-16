class LogIn {
  bool? mpinExists;

  LogIn({this.mpinExists});

  LogIn.fromJson(Map<String, dynamic> json) {
    mpinExists = json['mpinExists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mpinExists'] = mpinExists;
    return data;
  }
}
