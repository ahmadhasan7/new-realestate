class PropertyModel {
  String? id;
  String? user;
  String? profilePhoto;
  String? title;
  String? slug;
  String? refCode;
  String? description;
  Location? location;
  int? propertyNumber;
  int? price;
  String? plotArea;
  int? totalFloors;
  int? bedrooms;
  int? bathrooms;
  int? kitchens;
  int? livingRooms;
  String? propertyStatus;
  String? propertyType;
  String? coverPhoto;
  bool? publishedStatus;
  int? views;
  List<Null>? images;

  PropertyModel(
      {this.id,
        this.user,
        this.profilePhoto,
        this.title,
        this.slug,
        this.refCode,
        this.description,
        this.location,
        this.propertyNumber,
        this.price,
        this.plotArea,
        this.totalFloors,
        this.bedrooms,
        this.bathrooms,
        this.kitchens,
        this.livingRooms,
        this.propertyStatus,
        this.propertyType,
        this.coverPhoto,
        this.publishedStatus,
        this.views,
        this.images});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    profilePhoto = json['profile_photo'];
    title = json['title'];
    slug = json['slug'];
    refCode = json['ref_code'];
    description = json['description'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    propertyNumber = json['property_number'];
    price = json['price'];
    plotArea = json['plot_area'];
    totalFloors = json['total_floors'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    kitchens = json['kitchens'];
    livingRooms = json['living_rooms'];
    propertyStatus = json['property_status'];
    propertyType = json['property_type'];
    coverPhoto = json['cover_photo'];
    publishedStatus = json['published_status'];
    views = json['views'];
    if (json['images'] != null) {
      images = <Null>[];
      json['images'].forEach((v) {
      //  images!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['profile_photo'] = this.profilePhoto;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['ref_code'] = this.refCode;
    data['description'] = this.description;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['property_number'] = this.propertyNumber;
    data['price'] = this.price;
    data['plot_area'] = this.plotArea;
    data['total_floors'] = this.totalFloors;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['kitchens'] = this.kitchens;
    data['living_rooms'] = this.livingRooms;
    data['property_status'] = this.propertyStatus;
    data['property_type'] = this.propertyType;
    data['cover_photo'] = this.coverPhoto;
    data['published_status'] = this.publishedStatus;
    data['views'] = this.views;
    if (this.images != null) {
      //data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? city;
  String? region;
  String? street;

  Location({this.city, this.region, this.street});

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    region = json['region'];
    street = json['street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['region'] = this.region;
    data['street'] = this.street;
    return data;
  }
}