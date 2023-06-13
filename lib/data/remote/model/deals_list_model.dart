class DealsPage {
  List<Deals>? deals;

  DealsPage({this.deals});

  DealsPage.fromJson(Map<String, dynamic> json) {
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(Deals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (deals != null) {
      data['deals'] = deals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Deals {
  int? dealId;
  String? brandName;
  String? brandDescription;
  String? brandLogoUrl;
  String? category;
  String? description;
  String? displayImgUrl;
  List<String>? detailPageBannerImgsUrl;
  List<String>? keyPoints;
  List<String>? termsAndConditions;
  List<String>? faq;
  bool? isExpired;
  bool? isAvailed;
  String? startDate;
  String? expiryDate;
  String? activateOfferPageUrl;
  String? couponCode;

  Deals(
      {this.dealId,
      this.brandName,
      this.brandDescription,
      this.brandLogoUrl,
      this.category,
      this.description,
      this.displayImgUrl,
      this.detailPageBannerImgsUrl,
      this.keyPoints,
      this.termsAndConditions,
      this.faq,
      this.isExpired,
      this.isAvailed,
      this.startDate,
      this.expiryDate,
      this.activateOfferPageUrl,
      this.couponCode});

  Deals.fromJson(Map<String, dynamic> json) {
    dealId = json['deal_id'];
    brandName = json['brand_name'];
    brandDescription = json['brand_description'];
    brandLogoUrl = json['brand_logo_url'];
    category = json['category'];
    description = json['description'];
    displayImgUrl = json['display_img_url'];
    detailPageBannerImgsUrl =
        json['detail_page_banner_imgs_url'].cast<String>();
    keyPoints = json['key_points'].cast<String>();
    termsAndConditions = json['terms_and_conditions'].cast<String>();
    faq = json['faq'].cast<String>();
    isExpired = json['is_expired'];
    isAvailed = json['is_availed'];
    startDate = json['start_date'];
    expiryDate = json['expiry_date'];
    activateOfferPageUrl = json['activate_offer_page_url'];
    couponCode = json['coupon_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deal_id'] = dealId;
    data['brand_name'] = brandName;
    data['brand_description'] = brandDescription;
    data['brand_logo_url'] = brandLogoUrl;
    data['category'] = category;
    data['description'] = description;
    data['display_img_url'] = displayImgUrl;
    data['detail_page_banner_imgs_url'] = detailPageBannerImgsUrl;
    data['key_points'] = keyPoints;
    data['terms_and_conditions'] = termsAndConditions;
    data['faq'] = faq;
    data['is_expired'] = isExpired;
    data['is_availed'] = isAvailed;
    data['start_date'] = startDate;
    data['expiry_date'] = expiryDate;
    data['activate_offer_page_url'] = activateOfferPageUrl;
    data['coupon_code'] = couponCode;
    return data;
  }
}
