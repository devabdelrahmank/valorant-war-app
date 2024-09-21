import 'package:equatable/equatable.dart';

import 'chroma.dart';
import 'level.dart';

class Skin extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final dynamic wallpaper;
  final String? assetPath;
  final List<Chroma>? chromas;
  final List<Level>? levels;

  const Skin({
    this.uuid,
    this.displayName,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    this.assetPath,
    this.chromas,
    this.levels,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json['uuid'] as String?,
        displayName: json['displayName'] as String?,
        themeUuid: json['themeUuid'] as String?,
        contentTierUuid: json['contentTierUuid'] as String?,
        displayIcon: json['displayIcon'] as String?,
        wallpaper: json['wallpaper'] as dynamic,
        assetPath: json['assetPath'] as String?,
        chromas: (json['chromas'] as List<dynamic>?)
            ?.map((e) => Chroma.fromJson(e as Map<String, dynamic>))
            .toList(),
        levels: (json['levels'] as List<dynamic>?)
            ?.map((e) => Level.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'themeUuid': themeUuid,
        'contentTierUuid': contentTierUuid,
        'displayIcon': displayIcon,
        'wallpaper': wallpaper,
        'assetPath': assetPath,
        'chromas': chromas?.map((e) => e.toJson()).toList(),
        'levels': levels?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      themeUuid,
      contentTierUuid,
      displayIcon,
      wallpaper,
      assetPath,
      chromas,
      levels,
    ];
  }
}
