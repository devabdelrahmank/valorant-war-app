import 'package:equatable/equatable.dart';

class AdsStats extends Equatable {
  final double? zoomMultiplier;
  final double? fireRate;
  final double? runSpeedMultiplier;
  final int? burstCount;
  final double? firstBulletAccuracy;

  const AdsStats({
    this.zoomMultiplier,
    this.fireRate,
    this.runSpeedMultiplier,
    this.burstCount,
    this.firstBulletAccuracy,
  });

  factory AdsStats.fromJson(Map<String, dynamic> json) => AdsStats(
        zoomMultiplier: (json['zoomMultiplier'] as num?)?.toDouble(),
        fireRate: (json['fireRate'] as num?)?.toDouble(),
        runSpeedMultiplier: (json['runSpeedMultiplier'] as num?)?.toDouble(),
        burstCount: json['burstCount'] as int?,
        firstBulletAccuracy: (json['firstBulletAccuracy'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'zoomMultiplier': zoomMultiplier,
        'fireRate': fireRate,
        'runSpeedMultiplier': runSpeedMultiplier,
        'burstCount': burstCount,
        'firstBulletAccuracy': firstBulletAccuracy,
      };

  @override
  List<Object?> get props {
    return [
      zoomMultiplier,
      fireRate,
      runSpeedMultiplier,
      burstCount,
      firstBulletAccuracy,
    ];
  }
}
