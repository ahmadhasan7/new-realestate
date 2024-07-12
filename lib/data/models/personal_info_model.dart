class PersonalInfoModel {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phoneNumber;
  String? aboutMe;
  String? profilePhoto;
  String? city;
  bool? isBuyer;
  bool? isSeller;
  bool? isAgent;
  Null? rating;
  int? numReviews;
  String? fullName;
  List<Null>? preferredLocations;

  PersonalInfoModel(
      {this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.phoneNumber,
        this.aboutMe,
        this.profilePhoto,
        this.city,
        this.isBuyer,
        this.isSeller,
        this.isAgent,
        this.rating,
        this.numReviews,
        this.fullName,
        this.preferredLocations});

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    aboutMe = json['about_me'];
    profilePhoto = json['profile_photo'];
    city = json['city'];
    isBuyer = json['is_buyer'];
    isSeller = json['is_seller'];
    isAgent = json['is_agent'];
    rating = json['rating'];
    numReviews = json['num_reviews'];
    fullName = json['full_name'];
    if (json['preferred_locations'] != null) {
      preferredLocations = <Null>[];
      json['preferred_locations'].forEach((v) {
       // preferredLocations!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['about_me'] = this.aboutMe;
    data['profile_photo'] = this.profilePhoto;
    data['city'] = this.city;
    data['is_buyer'] = this.isBuyer;
    data['is_seller'] = this.isSeller;
    data['is_agent'] = this.isAgent;
    data['rating'] = this.rating;
    data['num_reviews'] = this.numReviews;
    data['full_name'] = this.fullName;
    if (this.preferredLocations != null) {
      //data['preferred_locations'] =
         // this.preferredLocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}