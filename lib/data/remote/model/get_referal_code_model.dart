class GetReferal {
  String? message;
  String? referralCode;
  bool? isAvailed;

  GetReferal({this.message, this.referralCode, this.isAvailed});

  GetReferal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    referralCode = json['referralCode'];
    isAvailed = json['isAvailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['referralCode'] = referralCode;
    data['isAvailed'] = isAvailed;
    return data;
  }
}
