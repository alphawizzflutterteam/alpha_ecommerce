class StateModel {
  StateModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final List<StateData> data;

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<StateData>.from(
              json["data"]!.map((x) => StateData.fromJson(x))),
    );
  }
}

class StateData {
  StateData({
    required this.id,
    required this.name,
    required this.countryId,
    required this.countryCode,
    required this.fipsCode,
    required this.iso2,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.flag,
    required this.wikiDataId,
  });

  final int? id;
  final String? name;
  final int? countryId;
  final String? countryCode;
  final String? fipsCode;
  final String? iso2;
  final String? type;
  final String? latitude;
  final String? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? flag;
  final String? wikiDataId;

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json["id"],
      name: json["name"],
      countryId: json["country_id"],
      countryCode: json["country_code"],
      fipsCode: json["fips_code"],
      iso2: json["iso2"],
      type: json["type"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      flag: json["flag"],
      wikiDataId: json["wikiDataId"],
    );
  }
}
