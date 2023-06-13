class VerifyReferalResponse {
  String? message;
  int? code;
  String? accessToken;

  VerifyReferalResponse({this.message, this.code, this.accessToken});

  VerifyReferalResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['code'] = code;
    data['accessToken'] = accessToken;
    return data;
  }
}

class VerifyReferalPayload {
  String? refCode;
  String? phoneNumber;

  VerifyReferalPayload({this.refCode, this.phoneNumber});

  VerifyReferalPayload.fromJson(Map<String, dynamic> json) {
    refCode = json['ref_code'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ref_code'] = refCode;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
