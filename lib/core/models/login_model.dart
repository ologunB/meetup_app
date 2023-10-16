class LoginModel {
  UserModel? user;
  String? token;

  LoginModel({this.user, this.token});

  LoginModel.fromJson(dynamic json) {
    user = json['user'] == null ? null : UserModel.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class UserModel {
  String? sId;
  String? phoneNumber;
  bool? isVerified;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? address;
  String? ageGroup;
  String? churchLocation;
  String? city;
  String? dateOfBirth;
  String? email;
  String? firstName;
  String? gender;
  String? lastName;
  String? state;
  String? zip;
  RevImage? profileImage;
  String? bio;
  String? tShirtSize;

  UserModel({
    this.sId,
    this.phoneNumber,
    this.isVerified,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.address,
    this.ageGroup,
    this.churchLocation,
    this.city,
    this.dateOfBirth,
    this.email,
    this.firstName,
    this.gender,
    this.lastName,
    this.state,
    this.zip,
    this.profileImage,
    this.bio,
    this.tShirtSize,
  });

  UserModel.fromJson(dynamic json) {
    sId = json['_id'];
    phoneNumber = json['phone_number'];
    isVerified = json['is_verified'];
    role = json['role'];
    tShirtSize = json['t_shirt_size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    address = json['address'];
    ageGroup = json['age_group'];
    churchLocation = json['church_location'];
    city = json['city'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    firstName = json['first_name'];
    gender = json['gender'];
    lastName = json['last_name'];
    state = json['state'];
    zip = json['zip'];
    bio = json['bio'];
    profileImage = json['profile_image'] == null
        ? null
        : RevImage.fromJson(json['profile_image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profileImage != null) {
      data['profile_image'] = profileImage!.toJson();
    }
    data['_id'] = sId;
    data['t_shirt_size'] = tShirtSize;
    data['bio'] = bio;
    data['phone_number'] = phoneNumber;
    data['is_verified'] = isVerified;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['address'] = address;
    data['age_group'] = ageGroup;
    data['church_location'] = churchLocation;
    data['city'] = city;
    data['date_of_birth'] = dateOfBirth;
    data['email'] = email;
    data['first_name'] = firstName;
    data['gender'] = gender;
    data['last_name'] = lastName;
    data['state'] = state;
    data['zip'] = zip;
    return data;
  }
}

class RevImage {
  String? publicId;
  String? url;

  RevImage({this.publicId, this.url});

  RevImage.fromJson(dynamic json) {
    publicId = json['public_id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['public_id'] = publicId;
    data['url'] = url;
    return data;
  }
}
