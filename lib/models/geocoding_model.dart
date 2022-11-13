class GeocodingModel {
  String? name;
  double? latitude;
  double? longitude;
  String? country;

  GeocodingModel({this.name, this.latitude, this.longitude, this.country});

  GeocodingModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['country'] = this.country;
    return data;
  }
}
