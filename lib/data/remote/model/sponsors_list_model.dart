class SponsorsListModel {
  List<AllSponsors>? allSponsors;

  SponsorsListModel({this.allSponsors});

  SponsorsListModel.fromJson(Map<String, dynamic> json) {
    if (json['allSponsors'] != null) {
      allSponsors = <AllSponsors>[];
      json['allSponsors'].forEach((v) {
        allSponsors!.add(AllSponsors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (allSponsors != null) {
      data['allSponsors'] = allSponsors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSponsors {
  String? sId;
  String? title;
  String? displayImgUrl;
  String? sponsorUrl;

  AllSponsors({this.sId, this.title, this.displayImgUrl, this.sponsorUrl});

  AllSponsors.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    displayImgUrl = json['display_img_url'];
    sponsorUrl = json['sponsor_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['title'] = title;
    data['display_img_url'] = displayImgUrl;
    data['sponsor_url'] = sponsorUrl;
    return data;
  }
}
