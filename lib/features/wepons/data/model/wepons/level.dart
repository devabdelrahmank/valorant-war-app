import 'package:equatable/equatable.dart';

class Level extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic levelItem;
  final String? displayIcon;
  final dynamic streamedVideo;
  final String? assetPath;

  const Level({
    this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    this.assetPath,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json['uuid'] as String?,
        displayName: json['displayName'] as String?,
        levelItem: json['levelItem'] as dynamic,
        displayIcon: json['displayIcon'] as String?,
        streamedVideo: json['streamedVideo'] as dynamic,
        assetPath: json['assetPath'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'levelItem': levelItem,
        'displayIcon': displayIcon,
        'streamedVideo': streamedVideo,
        'assetPath': assetPath,
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      levelItem,
      displayIcon,
      streamedVideo,
      assetPath,
    ];
  }
}
