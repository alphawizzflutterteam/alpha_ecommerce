class CityModel {
  CityModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<CityData> data;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<CityData>.from(json["data"]!.map((x) => CityData.fromJson(x))),
    );
  }
}

class CityData {
  CityData({
    required this.id,
    required this.name,
    required this.stateId,
    required this.stateCode,
    required this.countryId,
    required this.countryCode,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.flag,
    required this.wikiDataId,
  });

  final int? id;
  final String? name;
  final int? stateId;
  final String? stateCode;
  final int? countryId;
  final String? countryCode;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? flag;
  final String? wikiDataId;

  factory CityData.fromJson(Map<String, dynamic> json) {
    return CityData(
      id: json["id"],
      name: json["name"],
      stateId: json["state_id"],
      stateCode: json["state_code"],
      countryId: json["country_id"],
      countryCode: json["country_code"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      flag: json["flag"],
      wikiDataId: json["wikiDataId"],
    );
  }
}
