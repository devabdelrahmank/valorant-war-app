import 'package:equatable/equatable.dart';

class Chroma extends Equatable {
  final String? uuid;
  final String? displayName;
  final dynamic displayIcon;
  final String? fullRender;
  final dynamic swatch;
  final dynamic streamedVideo;
  final String? assetPath;

  const Chroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
    this.assetPath,
  });

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json['uuid'] as String?,
        displayName: json['displayName'] as String?,
        displayIcon: json['displayIcon'] as dynamic,
        fullRender: json['fullRender'] as String?,
        swatch: json['swatch'] as dynamic,
        streamedVideo: json['streamedVideo'] as dynamic,
        assetPath: json['assetPath'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'displayIcon': displayIcon,
        'fullRender': fullRender,
        'swatch': swatch,
        'streamedVideo': streamedVideo,
        'assetPath': assetPath,
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      displayIcon,
      fullRender,
      swatch,
      streamedVideo,
      assetPath,
    ];
  }
}
