class BloodDonorInfo {
  String? donorName, bloodType;
  String? long, lat;
  String? phoneNumber;

  BloodDonorInfo({
    required this.bloodType,
    required this.donorName,
    required this.lat,
    required this.long,
    required this.phoneNumber,
  });

  BloodDonorInfo.fromJson(json) {
    bloodType = json['blood_type'];
    donorName = json['donor_name'];
    phoneNumber = json['phone_number'];
    lat = json['lat'];
    long = json['long'];
  }
  Map<String, dynamic> toJson() => {
        'blood_type': bloodType,
        'donor_name': donorName,
        'phone_number': phoneNumber,
        'lat': lat,
        'long': long,
      };
}
