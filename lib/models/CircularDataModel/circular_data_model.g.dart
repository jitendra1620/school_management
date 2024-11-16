// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circular_data_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CircularDataModelCWProxy {
  CircularDataModel id(String id);

  CircularDataModel dateCircular(String dateCircular);

  CircularDataModel title(String title);

  CircularDataModel description(String description);

  CircularDataModel coverImage(String coverImage);

  CircularDataModel driveFolderAddress(String driveFolderAddress);

  CircularDataModel htmlDetail(String htmlDetail);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CircularDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CircularDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CircularDataModel call({
    String? id,
    String? dateCircular,
    String? title,
    String? description,
    String? coverImage,
    String? driveFolderAddress,
    String? htmlDetail,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCircularDataModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCircularDataModel.copyWith.fieldName(...)`
class _$CircularDataModelCWProxyImpl implements _$CircularDataModelCWProxy {
  const _$CircularDataModelCWProxyImpl(this._value);

  final CircularDataModel _value;

  @override
  CircularDataModel id(String id) => this(id: id);

  @override
  CircularDataModel dateCircular(String dateCircular) =>
      this(dateCircular: dateCircular);

  @override
  CircularDataModel title(String title) => this(title: title);

  @override
  CircularDataModel description(String description) =>
      this(description: description);

  @override
  CircularDataModel coverImage(String coverImage) =>
      this(coverImage: coverImage);

  @override
  CircularDataModel driveFolderAddress(String driveFolderAddress) =>
      this(driveFolderAddress: driveFolderAddress);

  @override
  CircularDataModel htmlDetail(String htmlDetail) =>
      this(htmlDetail: htmlDetail);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CircularDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CircularDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  CircularDataModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? dateCircular = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? coverImage = const $CopyWithPlaceholder(),
    Object? driveFolderAddress = const $CopyWithPlaceholder(),
    Object? htmlDetail = const $CopyWithPlaceholder(),
  }) {
    return CircularDataModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      dateCircular:
          dateCircular == const $CopyWithPlaceholder() || dateCircular == null
              ? _value.dateCircular
              // ignore: cast_nullable_to_non_nullable
              : dateCircular as String,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      coverImage:
          coverImage == const $CopyWithPlaceholder() || coverImage == null
              ? _value.coverImage
              // ignore: cast_nullable_to_non_nullable
              : coverImage as String,
      driveFolderAddress: driveFolderAddress == const $CopyWithPlaceholder() ||
              driveFolderAddress == null
          ? _value.driveFolderAddress
          // ignore: cast_nullable_to_non_nullable
          : driveFolderAddress as String,
      htmlDetail:
          htmlDetail == const $CopyWithPlaceholder() || htmlDetail == null
              ? _value.htmlDetail
              // ignore: cast_nullable_to_non_nullable
              : htmlDetail as String,
    );
  }
}

extension $CircularDataModelCopyWith on CircularDataModel {
  /// Returns a callable class that can be used as follows: `instanceOfCircularDataModel.copyWith(...)` or like so:`instanceOfCircularDataModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CircularDataModelCWProxy get copyWith =>
      _$CircularDataModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircularDataModel _$CircularDataModelFromJson(Map<String, dynamic> json) =>
    CircularDataModel(
      id: json['id'] as String,
      dateCircular: json['dateCircular'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      coverImage: json['coverImage'] as String,
      driveFolderAddress: json['driveFolderAddress'] as String,
      htmlDetail: json['htmlDetail'] as String,
    );

Map<String, dynamic> _$CircularDataModelToJson(CircularDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateCircular': instance.dateCircular,
      'title': instance.title,
      'description': instance.description,
      'coverImage': instance.coverImage,
      'driveFolderAddress': instance.driveFolderAddress,
      'htmlDetail': instance.htmlDetail,
    };
