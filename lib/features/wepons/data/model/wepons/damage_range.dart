import 'package:equatable/equatable.dart';

class DamageRange extends Equatable {
  final int? rangeStartMeters;
  final int? rangeEndMeters;
  final double? headDamage;
  final int? bodyDamage;
  final double? legDamage;

  const DamageRange({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        rangeStartMeters: json['rangeStartMeters'] as int?,
        rangeEndMeters: json['rangeEndMeters'] as int?,
        headDamage: (json['headDamage'] as num?)?.toDouble(),
        bodyDamage: json['bodyDamage'] as int?,
        legDamage: (json['legDamage'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'rangeStartMeters': rangeStartMeters,
        'rangeEndMeters': rangeEndMeters,
        'headDamage': headDamage,
        'bodyDamage': bodyDamage,
        'legDamage': legDamage,
      };

  @override
  List<Object?> get props {
    return [
      rangeStartMeters,
      rangeEndMeters,
      headDamage,
      bodyDamage,
      legDamage,
    ];
  }
}
