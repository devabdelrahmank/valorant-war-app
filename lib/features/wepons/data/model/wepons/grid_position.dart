import 'package:equatable/equatable.dart';

class GridPosition extends Equatable {
  final int? row;
  final int? column;

  const GridPosition({this.row, this.column});

  factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json['row'] as int?,
        column: json['column'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'row': row,
        'column': column,
      };

  @override
  List<Object?> get props => [row, column];
}
