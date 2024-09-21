import 'package:equatable/equatable.dart';

import 'datum.dart';

class Wepons extends Equatable {
  final int? status;
  final List<Datum>? data;

  const Wepons({this.status, this.data});

  factory Wepons.fromJson(Map<String, dynamic> json) => Wepons(
        status: json['status'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, data];
}
