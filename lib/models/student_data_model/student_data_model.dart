import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:school_management/service/google_sheet_service.dart';
part 'student_data_model.g.dart';

@CopyWith()
@JsonSerializable()
class StudentDM {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String mobileNumber;
  final String motherName;
  final String fatherName;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String email;
  final String className;
  final String enrollmentDate;
  final String guardianContact;
  final String photoUrl;
  final String phoneToLogin;
  final String transportationDetails;

  StudentDM( {
    required this.phoneToLogin, required this.transportationDetails,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.mobileNumber,
    required this.motherName,
    required this.fatherName,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.email,
    required this.className,
    required this.enrollmentDate,
    required this.guardianContact,
    required this.photoUrl,
  });

  factory StudentDM.fromJson(Map<String, dynamic> json) => _$StudentDMFromJson(json);

  /// Connect the generated [_$StudentDMToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StudentDMToJson(this);

  static List<String> headersTitles = [];
  static List<String> keysInGSheet = [];
  DateTime? get dateOfBirthDateTime => GoogleSheetDateParser.dateFromGSheets(dateOfBirth);
  DateTime? get enrollmentDateDateTime => GoogleSheetDateParser.dateFromGSheets(enrollmentDate);
}