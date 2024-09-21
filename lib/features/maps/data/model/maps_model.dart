import 'dart:convert';

Maps mapsFromJson(String str) => Maps.fromJson(json.decode(str));

String mapsToJson(Maps data) => json.encode(data.toJson());

class Maps {
  int status;
  List<Datum> data;

  Maps({
    required this.status,
    required this.data,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String uuid;
  String displayName;
  dynamic narrativeDescription;
  TacticalDescription? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String listViewIcon;
  String? listViewIconTall;
  String? splash;
  String? stylizedBackgroundImage;
  String? premierBackgroundImage;
  String assetPath;
  String mapUrl;
  double xMultiplier;
  double yMultiplier;
  double xScalarToAdd;
  double yScalarToAdd;
  List<Callout>? callouts;

  Datum({
    required this.uuid,
    required this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    required this.listViewIcon,
    this.listViewIconTall,
    this.splash,
    this.stylizedBackgroundImage,
    this.premierBackgroundImage,
    required this.assetPath,
    required this.mapUrl,
    required this.xMultiplier,
    required this.yMultiplier,
    required this.xScalarToAdd,
    required this.yScalarToAdd,
    this.callouts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        narrativeDescription: json["narrativeDescription"],
        tacticalDescription: json["tacticalDescription"] != null
            ? tacticalDescriptionValues.map[json["tacticalDescription"]]
            : null,
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        listViewIconTall: json["listViewIconTall"],
        splash: json["splash"],
        stylizedBackgroundImage: json["stylizedBackgroundImage"],
        premierBackgroundImage: json["premierBackgroundImage"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"]?.toDouble() ?? 0.0,
        yMultiplier: json["yMultiplier"]?.toDouble() ?? 0.0,
        xScalarToAdd: json["xScalarToAdd"]?.toDouble() ?? 0.0,
        yScalarToAdd: json["yScalarToAdd"]?.toDouble() ?? 0.0,
        callouts: json["callouts"] != null
            ? List<Callout>.from(
                json["callouts"].map((x) => Callout.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "narrativeDescription": narrativeDescription,
        "tacticalDescription": tacticalDescription != null
            ? tacticalDescriptionValues.reverse[tacticalDescription]
            : null,
        "coordinates": coordinates,
        "displayIcon": displayIcon,
        "listViewIcon": listViewIcon,
        "listViewIconTall": listViewIconTall,
        "splash": splash,
        "stylizedBackgroundImage": stylizedBackgroundImage,
        "premierBackgroundImage": premierBackgroundImage,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts != null
            ? List<dynamic>.from(callouts!.map((x) => x.toJson()))
            : [],
      };
}

class Callout {
  String regionName;
  SuperRegionName? superRegionName;
  Location location;

  Callout({
    required this.regionName,
    this.superRegionName,
    required this.location,
  });

  factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: json["superRegionName"] != null
            ? superRegionNameValues.map[json["superRegionName"]]
            : null,
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionName != null
            ? superRegionNameValues.reverse[superRegionName]
            : null,
        "location": location.toJson(),
      };
}

class Location {
  double x;
  double y;

  Location({
    required this.x,
    required this.y,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"]?.toDouble() ?? 0.0,
        y: json["y"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

enum SuperRegionName { A, ATTACKER_SIDE, B, C, DEFENDER_SIDE, MID }

final superRegionNameValues = EnumValues({
  "A": SuperRegionName.A,
  "Attacker Side": SuperRegionName.ATTACKER_SIDE,
  "B": SuperRegionName.B,
  "C": SuperRegionName.C,
  "Defender Side": SuperRegionName.DEFENDER_SIDE,
  "Mid": SuperRegionName.MID
});

enum TacticalDescription { A_B_C_SITES, A_B_SITES }

final tacticalDescriptionValues = EnumValues({
  "A/B/C Sites": TacticalDescription.A_B_C_SITES,
  "A/B Sites": TacticalDescription.A_B_SITES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
