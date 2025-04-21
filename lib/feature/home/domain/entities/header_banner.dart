

class Banners {
  int? id;
  String? name;
  String? imageUrl;
  String? section;
  String? link;

  Banners({this.id, this.name, this.imageUrl, this.section, this.link});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    section = json['section'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['section'] = section;
    data['link'] = link;
    return data;
  }
}
