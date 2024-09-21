import 'package:equatable/equatable.dart';

import 'shop_data.dart';
import 'skin.dart';
import 'weapon_stats.dart';

class Datum extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? category;
  final String? defaultSkinUuid;
  final String? displayIcon;
  final String? killStreamIcon;
  final String? assetPath;
  final WeaponStats? weaponStats;
  final ShopData? shopData;
  final List<Skin>? skins;

  const Datum({
    this.uuid,
    this.displayName,
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.killStreamIcon,
    this.assetPath,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json['uuid'] as String?,
        displayName: json['displayName'] as String?,
        category: json['category'] as String?,
        defaultSkinUuid: json['defaultSkinUuid'] as String?,
        displayIcon: json['displayIcon'] as String?,
        killStreamIcon: json['killStreamIcon'] as String?,
        assetPath: json['assetPath'] as String?,
        weaponStats: json['weaponStats'] == null
            ? null
            : WeaponStats.fromJson(json['weaponStats'] as Map<String, dynamic>),
        shopData: json['shopData'] == null
            ? null
            : ShopData.fromJson(json['shopData'] as Map<String, dynamic>),
        skins: (json['skins'] as List<dynamic>?)
            ?.map((e) => Skin.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'category': category,
        'defaultSkinUuid': defaultSkinUuid,
        'displayIcon': displayIcon,
        'killStreamIcon': killStreamIcon,
        'assetPath': assetPath,
        'weaponStats': weaponStats?.toJson(),
        'shopData': shopData?.toJson(),
        'skins': skins?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      category,
      defaultSkinUuid,
      displayIcon,
      killStreamIcon,
      assetPath,
      weaponStats,
      shopData,
      skins,
    ];
  }
}
