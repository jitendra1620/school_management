import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:school_management/service/google_sheet_service.dart';
part 'circular_data_model.g.dart';

@CopyWith()
@JsonSerializable()
class CircularDataModel {
  final String id;
  final String dateCircular;
  final String title;
  final String description;
  final String coverImage;
  final String driveFolderAddress;
  final String htmlDetail;

  CircularDataModel( {
    required this.id,
    required this.dateCircular,
    required this.title,
    required this.description,
    required this.coverImage,
    required this.driveFolderAddress,
    required this.htmlDetail,
  });

  factory CircularDataModel.fromJson(Map<String, dynamic> json) => _$CircularDataModelFromJson(json);

  /// Connect the generated [_$StudentDMToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CircularDataModelToJson(this);

  static List<String> headersTitles = [];
  static List<String> keysInGSheet = [];
  DateTime? get dateCircularDateTime => GoogleSheetDateParser.dateFromGSheets(dateCircular);
}
