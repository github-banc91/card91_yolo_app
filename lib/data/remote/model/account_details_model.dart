class AccountDetails {
  Customer? customer;
  List<Cards>? cards;
  bool? mpinResetRequired;

  AccountDetails({this.customer, this.cards, this.mpinResetRequired});

  AccountDetails.fromJson(Map<String, dynamic> json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['cards'] != null) {
      cards = <Cards>[];
      json['cards'].forEach((v) {
        cards!.add(Cards.fromJson(v));
      });
    }
    mpinResetRequired = json['mpinResetRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (cards != null) {
      data['cards'] = cards!.map((v) => v.toJson()).toList();
    }
    data['mpinResetRequired'] = mpinResetRequired;
    return data;
  }
}

class Customer {
  String? createdTime;
  String? createdBy;
  String? modifiedTime;
  String? modifiedBy;
  String? id;
  String? dob;
  String? gender;
  String? mobile;
  String? email;
  String? name;
  String? nameOnCard;
  bool? invited;
  bool? firstTimeSignUp;
  bool? firstTimeLogin;
  int? saltHash;
  int? wrongMpinCount;
  int? mpinResetCount;
  String? cardHolderPaymentSideId;
  String? locale;
  String? status;

  Customer(
      {this.createdTime,
      this.createdBy,
      this.modifiedTime,
      this.modifiedBy,
      this.id,
      this.dob,
      this.gender,
      this.mobile,
      this.email,
      this.name,
      this.nameOnCard,
      this.invited,
      this.firstTimeSignUp,
      this.firstTimeLogin,
      this.saltHash,
      this.wrongMpinCount,
      this.mpinResetCount,
      this.cardHolderPaymentSideId,
      this.locale,
      this.status});

  Customer.fromJson(Map<String, dynamic> json) {
    createdTime = json['createdTime'];
    createdBy = json['createdBy'];
    modifiedTime = json['modifiedTime'];
    modifiedBy = json['modifiedBy'];
    id = json['id'];
    dob = json['dob'];
    gender = json['gender'];
    mobile = json['mobile'];
    email = json['email'];
    name = json['name'];
    nameOnCard = json['nameOnCard'];
    invited = json['invited'];
    firstTimeSignUp = json['firstTimeSignUp'];
    firstTimeLogin = json['firstTimeLogin'];
    saltHash = json['saltHash'];
    wrongMpinCount = json['wrongMpinCount'];
    mpinResetCount = json['mpinResetCount'];
    cardHolderPaymentSideId = json['cardHolderPaymentSideId'];
    locale = json['locale'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdTime'] = createdTime;
    data['createdBy'] = createdBy;
    data['modifiedTime'] = modifiedTime;
    data['modifiedBy'] = modifiedBy;
    data['id'] = id;
    data['dob'] = dob;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['email'] = email;
    data['name'] = name;
    data['nameOnCard'] = nameOnCard;
    data['invited'] = invited;
    data['firstTimeSignUp'] = firstTimeSignUp;
    data['firstTimeLogin'] = firstTimeLogin;
    data['saltHash'] = saltHash;
    data['wrongMpinCount'] = wrongMpinCount;
    data['mpinResetCount'] = mpinResetCount;
    data['cardHolderPaymentSideId'] = cardHolderPaymentSideId;
    data['locale'] = locale;
    data['status'] = status;
    return data;
  }
}

class Cards {
  String? id;
  String? status;
  String? customerId;
  String? lastFourDigits;
  String? cardMode;
  String? orgName;
  String? orgId;
  String? cardImage;
  String? network;
  String? programName;
  String? issuer;
  String? van;
  String? rootCardId;
  bool? primaryCard;
  bool? addOnCard;

  Cards(
      {this.id,
      this.status,
      this.customerId,
      this.lastFourDigits,
      this.cardMode,
      this.orgName,
      this.orgId,
      this.cardImage,
      this.network,
      this.programName,
      this.issuer,
      this.van,
      this.rootCardId,
      this.primaryCard,
      this.addOnCard});

  Cards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    customerId = json['customerId'];
    lastFourDigits = json['lastFourDigits'];
    cardMode = json['cardMode'];
    orgName = json['orgName'];
    orgId = json['orgId'];
    cardImage = json['cardImage'];
    network = json['network'];
    programName = json['programName'];
    issuer = json['issuer'];
    van = json['van'];
    rootCardId = json['rootCardId'];
    primaryCard = json['primaryCard'];
    addOnCard = json['addOnCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['customerId'] = customerId;
    data['lastFourDigits'] = lastFourDigits;
    data['cardMode'] = cardMode;
    data['orgName'] = orgName;
    data['orgId'] = orgId;
    data['cardImage'] = cardImage;
    data['network'] = network;
    data['programName'] = programName;
    data['issuer'] = issuer;
    data['van'] = van;
    data['rootCardId'] = rootCardId;
    data['primaryCard'] = primaryCard;
    data['addOnCard'] = addOnCard;
    return data;
  }
}
