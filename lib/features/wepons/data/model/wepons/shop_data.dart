import 'package:equatable/equatable.dart';

import 'grid_position.dart';

class ShopData extends Equatable {
  final int? cost;
  final String? category;
  final int? shopOrderPriority;
  final String? categoryText;
  final GridPosition? gridPosition;
  final bool? canBeTrashed;
  final dynamic image;
  final String? newImage;
  final dynamic newImage2;
  final String? assetPath;

  const ShopData({
    this.cost,
    this.category,
    this.shopOrderPriority,
    this.categoryText,
    this.gridPosition,
    this.canBeTrashed,
    this.image,
    this.newImage,
    this.newImage2,
    this.assetPath,
  });

  factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json['cost'] as int?,
        category: json['category'] as String?,
        shopOrderPriority: json['shopOrderPriority'] as int?,
        categoryText: json['categoryText'] as String?,
        gridPosition: json['gridPosition'] == null
            ? null
            : GridPosition.fromJson(
                json['gridPosition'] as Map<String, dynamic>),
        canBeTrashed: json['canBeTrashed'] as bool?,
        image: json['image'] as dynamic,
        newImage: json['newImage'] as String?,
        newImage2: json['newImage2'] as dynamic,
        assetPath: json['assetPath'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'category': category,
        'shopOrderPriority': shopOrderPriority,
        'categoryText': categoryText,
        'gridPosition': gridPosition?.toJson(),
        'canBeTrashed': canBeTrashed,
        'image': image,
        'newImage': newImage,
        'newImage2': newImage2,
        'assetPath': assetPath,
      };

  @override
  List<Object?> get props {
    return [
      cost,
      category,
      shopOrderPriority,
      categoryText,
      gridPosition,
      canBeTrashed,
      image,
      newImage,
      newImage2,
      assetPath,
    ];
  }
}
