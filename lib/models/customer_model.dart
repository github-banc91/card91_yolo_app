// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

class Customer {
  final CustomerClass? customer;
  final List<Card>? cards;
  final bool? mpinResetRequired;

  Customer({
    this.customer,
    this.cards,
    this.mpinResetRequired,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customer: json["customer"] == null
            ? null
            : CustomerClass.fromJson(json["customer"]),
        cards: json["cards"] == null
            ? []
            : List<Card>.from(json["cards"]!.map((x) => Card.fromJson(x))),
        mpinResetRequired: json["mpinResetRequired"],
      );
}

class Card {
  final String? id;
  final String? status;
  final String? customerId;
  final String? lastFourDigits;
  final String? cardMode;
  final String? orgName;
  final String? orgId;
  final dynamic cardImage;
  final String? network;
  final String? programName;
  final String? issuer;
  final dynamic van;
  final String? rootCardId;
  final bool? addOnCard;
  final bool? primaryCard;

  Card({
    this.id,
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
    this.addOnCard,
    this.primaryCard,
  });
  factory Card.fromJson(Map<String, dynamic> json) => Card(
        id: json["id"],
        status: json["status"],
        customerId: json["customerId"],
        lastFourDigits: json["lastFourDigits"],
        cardMode: json["cardMode"],
        orgName: json["orgName"],
        orgId: json["orgId"],
        cardImage: json["cardImage"],
        network: json["network"],
        programName: json["programName"],
        issuer: json["issuer"],
        van: json["van"],
        rootCardId: json["rootCardId"],
        addOnCard: json["addOnCard"],
        primaryCard: json["primaryCard"],
      );
}

class CustomerClass {
  final String? createdTime;
  final String? createdBy;
  final dynamic modifiedTime;
  final dynamic modifiedBy;
  final String? id;
  final dynamic dob;
  final dynamic gender;
  final String? mobile;
  final String? email;
  final String? name;
  final String? nameOnCard;
  final bool? invited;
  final bool? firstTimeSignUp;
  final bool? firstTimeLogin;
  final int? saltHash;
  final int? wrongMpinCount;
  final int? mpinResetCount;
  final String? cardHolderPaymentSideId;
  final dynamic locale;
  final String? status;

  CustomerClass({
    this.createdTime,
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
    this.status,
  });

  factory CustomerClass.fromJson(Map<String, dynamic> json) => CustomerClass(
        createdTime: json["createdTime"],
        createdBy: json["createdBy"],
        modifiedTime: json["modifiedTime"],
        modifiedBy: json["modifiedBy"],
        id: json["id"],
        dob: json["dob"],
        gender: json["gender"],
        mobile: json["mobile"],
        email: json["email"],
        name: json["name"],
        nameOnCard: json["nameOnCard"],
        invited: json["invited"],
        firstTimeSignUp: json["firstTimeSignUp"],
        firstTimeLogin: json["firstTimeLogin"],
        saltHash: json["saltHash"],
        wrongMpinCount: json["wrongMpinCount"],
        mpinResetCount: json["mpinResetCount"],
        cardHolderPaymentSideId: json["cardHolderPaymentSideId"],
        locale: json["locale"],
        status: json["status"],
      );
}
