// To parse this JSON data, do
//
//     final cradHolderData = cradHolderDataFromJson(jsonString);

import 'dart:convert';

class CradHolderData {
  final String? id;
  final String? cardHolderId;
  final String? cardHolderName;
  final String? cardHolderMobile;
  final String? cardHolderEmail;
  final String? cardHolderStatus;
  final String? kycType;
  final String? kycStatus;
  final String? cardType;
  final String? cardLast4Digits;
  final String? cardStatus;
  final String? issuerProgram;
  final String? issuerCode;
  final String? cardProgramId;
  final String? cardProgramName;
  final String? orgName;
  final String? orgDisplayName;
  final String? rootCardId;
  final DateTime? createdTime;
  final DeliveryAddress? deliveryAddress;
  final dynamic extraCardRefId;
  final dynamic extraCardRefDesc;
  final dynamic extraCardHolderRefId;
  final dynamic extraCardHolderRefDesc;
  final String? createdBy;
  final bool? favourite;

  CradHolderData({
    this.id,
    this.cardHolderId,
    this.cardHolderName,
    this.cardHolderMobile,
    this.cardHolderEmail,
    this.cardHolderStatus,
    this.kycType,
    this.kycStatus,
    this.cardType,
    this.cardLast4Digits,
    this.cardStatus,
    this.issuerProgram,
    this.issuerCode,
    this.cardProgramId,
    this.cardProgramName,
    this.orgName,
    this.orgDisplayName,
    this.rootCardId,
    this.createdTime,
    this.deliveryAddress,
    this.extraCardRefId,
    this.extraCardRefDesc,
    this.extraCardHolderRefId,
    this.extraCardHolderRefDesc,
    this.createdBy,
    this.favourite,
  });

  factory CradHolderData.fromRawJson(String str) =>
      CradHolderData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CradHolderData.fromJson(Map<String, dynamic> json) => CradHolderData(
        id: json["id"],
        cardHolderId: json["cardHolderId"],
        cardHolderName: json["cardHolderName"],
        cardHolderMobile: json["cardHolderMobile"],
        cardHolderEmail: json["cardHolderEmail"],
        cardHolderStatus: json["cardHolderStatus"],
        kycType: json["kycType"],
        kycStatus: json["kycStatus"],
        cardType: json["cardType"],
        cardLast4Digits: json["cardLast4digits"],
        cardStatus: json["cardStatus"],
        issuerProgram: json["issuerProgram"],
        issuerCode: json["issuerCode"],
        cardProgramId: json["cardProgramId"],
        cardProgramName: json["cardProgramName"],
        orgName: json["orgName"],
        orgDisplayName: json["orgDisplayName"],
        rootCardId: json["rootCardId"],
        createdTime: json["createdTime"] == null
            ? null
            : DateTime.parse(json["createdTime"]),
        deliveryAddress: json["deliveryAddress"] == null
            ? null
            : DeliveryAddress.fromJson(json["deliveryAddress"]),
        extraCardRefId: json["extraCardRefId"],
        extraCardRefDesc: json["extraCardRefDesc"],
        extraCardHolderRefId: json["extraCardHolderRefId"],
        extraCardHolderRefDesc: json["extraCardHolderRefDesc"],
        createdBy: json["createdBy"],
        favourite: json["favourite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cardHolderId": cardHolderId,
        "cardHolderName": cardHolderName,
        "cardHolderMobile": cardHolderMobile,
        "cardHolderEmail": cardHolderEmail,
        "cardHolderStatus": cardHolderStatus,
        "kycType": kycType,
        "kycStatus": kycStatus,
        "cardType": cardType,
        "cardLast4digits": cardLast4Digits,
        "cardStatus": cardStatus,
        "issuerProgram": issuerProgram,
        "issuerCode": issuerCode,
        "cardProgramId": cardProgramId,
        "cardProgramName": cardProgramName,
        "orgName": orgName,
        "orgDisplayName": orgDisplayName,
        "rootCardId": rootCardId,
        "createdTime": createdTime?.toIso8601String(),
        "deliveryAddress": deliveryAddress?.toJson(),
        "extraCardRefId": extraCardRefId,
        "extraCardRefDesc": extraCardRefDesc,
        "extraCardHolderRefId": extraCardHolderRefId,
        "extraCardHolderRefDesc": extraCardHolderRefDesc,
        "createdBy": createdBy,
        "favourite": favourite,
      };
}

class DeliveryAddress {
  final String? address1;
  final String? address2;
  final String? landmark;
  final String? city;
  final String? countryIsoCode;
  final String? pincode;
  final String? state;

  DeliveryAddress({
    this.address1,
    this.address2,
    this.landmark,
    this.city,
    this.countryIsoCode,
    this.pincode,
    this.state,
  });

  factory DeliveryAddress.fromRawJson(String str) =>
      DeliveryAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        address1: json["address1"],
        address2: json["address2"],
        landmark: json["landmark"],
        city: json["city"],
        countryIsoCode: json["countryISOCode"],
        pincode: json["pincode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "landmark": landmark,
        "city": city,
        "countryISOCode": countryIsoCode,
        "pincode": pincode,
        "state": state,
      };
}
