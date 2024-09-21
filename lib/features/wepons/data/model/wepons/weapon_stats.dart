import 'package:equatable/equatable.dart';

import 'ads_stats.dart';
import 'damage_range.dart';

class WeaponStats extends Equatable {
  final int? magazineSize;
  final double? runSpeedMultiplier;
  final double? equipTimeSeconds;
  final double? firstBulletAccuracy;
  final int? shotgunPelletCount;
  final String? wallPenetration;
  final String? feature;
  final dynamic fireMode;
  final String? altFireType;
  final AdsStats? adsStats;
  final dynamic altShotgunStats;
  final dynamic airBurstStats;
  final List<DamageRange>? damageRanges;

  const WeaponStats({
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
    this.wallPenetration,
    this.feature,
    this.fireMode,
    this.altFireType,
    this.adsStats,
    this.altShotgunStats,
    this.airBurstStats,
    this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic> json) => WeaponStats(
        magazineSize: json['magazineSize'] as int?,
        runSpeedMultiplier: (json['runSpeedMultiplier'] as num?)?.toDouble(),
        equipTimeSeconds: (json['equipTimeSeconds'] as num?)?.toDouble(),
        firstBulletAccuracy: (json['firstBulletAccuracy'] as num?)?.toDouble(),
        shotgunPelletCount: json['shotgunPelletCount'] as int?,
        wallPenetration: json['wallPenetration'] as String?,
        feature: json['feature'] as String?,
        fireMode: json['fireMode'] as dynamic,
        altFireType: json['altFireType'] as String?,
        adsStats: json['adsStats'] == null
            ? null
            : AdsStats.fromJson(json['adsStats'] as Map<String, dynamic>),
        altShotgunStats: json['altShotgunStats'] as dynamic,
        airBurstStats: json['airBurstStats'] as dynamic,
        damageRanges: (json['damageRanges'] as List<dynamic>?)
            ?.map((e) => DamageRange.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'magazineSize': magazineSize,
        'runSpeedMultiplier': runSpeedMultiplier,
        'equipTimeSeconds': equipTimeSeconds,
        'firstBulletAccuracy': firstBulletAccuracy,
        'shotgunPelletCount': shotgunPelletCount,
        'wallPenetration': wallPenetration,
        'feature': feature,
        'fireMode': fireMode,
        'altFireType': altFireType,
        'adsStats': adsStats?.toJson(),
        'altShotgunStats': altShotgunStats,
        'airBurstStats': airBurstStats,
        'damageRanges': damageRanges?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      magazineSize,
      runSpeedMultiplier,
      equipTimeSeconds,
      firstBulletAccuracy,
      shotgunPelletCount,
      wallPenetration,
      feature,
      fireMode,
      altFireType,
      adsStats,
      altShotgunStats,
      airBurstStats,
      damageRanges,
    ];
  }
}
