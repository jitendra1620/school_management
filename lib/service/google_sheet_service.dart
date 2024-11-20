import 'package:gsheets/gsheets.dart';
import 'package:school_management/models/CircularDataModel/circular_data_model.dart';
import 'package:school_management/models/student_data_model/student_data_model.dart';
import 'package:school_management/utils/async_storage_manager.dart';

class GoogleSheetService {
  static const _credentials = r'''


''';

  final String _spreadsheetId1 =
      '1hF4vACQW0O9Df-HEKbh0gs7O5NglkLVx5YdctAMO5oM'; //kite 'Option chain
  final String _spreadsheetId2 =
      '1A5gCVYV9LPHWCERP5O8C2Bi2scRJF5yvppBQk0HLfJw'; //user. 'School
  final GSheets _gsheets =
      GSheets(_credentials); // or OAuth credentials if using
  static final GoogleSheetService _instance = GoogleSheetService._internal();
  GoogleSheetService._internal();
  factory GoogleSheetService() => _instance;

  Worksheet? schoolWorksheet;
  Worksheet? circularsWorksheet;
  static List<StudentDM> studentDataList = [];
  static List<CircularDataModel> circularDataList = [];
  Future<void> init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId2);
    schoolWorksheet = spreadsheet.worksheetByTitle('School');
    circularsWorksheet = spreadsheet.worksheetByTitle('circulars');
    await fetchSchoolData();
    return; // Define the sheet name
  }

  Future<List<StudentDM>> fetchSchoolData() async {
    if (schoolWorksheet == null) await init();
    final rows = await schoolWorksheet!.values.map.allRows();
    studentDataList = parseStudentData(rows ?? []);
    return studentDataList;
  }

  Future<List<CircularDataModel>> fetchCircularData() async {
    if (circularsWorksheet == null) await init();
    final rows = await circularsWorksheet!.values.map.allRows();
    circularDataList = parseCircularData(rows ?? []);
    return circularDataList;
  }

  List<CircularDataModel> parseCircularData(
      List<Map<String, String>> sheetData) {
    final headersTitles = sheetData.removeAt(0);
    // Remove the header row from data
    final rows = sheetData
      ..map(
        (e) => CircularDataModel.fromJson(e),
      ).toList();

    // Map each row into a Student object
    CircularDataModel.headersTitles = headersTitles.values.toList();
    CircularDataModel.keysInGSheet = sheetData[0].keys.toList();
    return rows.map((row) {
      return CircularDataModel.fromJson(row);
    }).toList();
  }

  List<StudentDM> parseStudentData(List<Map<String, String>> sheetData) {
    final headersTitles = sheetData.removeAt(0);
    // Remove the header row from data
    final rows = sheetData
      ..map(
        (e) => StudentDM.fromJson(e),
      ).toList();

    // Map each row into a Student object
    StudentDM.headersTitles = headersTitles.values.toList();
    StudentDM.keysInGSheet = sheetData[0].keys.toList();
    return rows.map((row) {
      return StudentDM.fromJson(row);
    }).toList();
  }

  static Future<StudentDM?> getCurrentStudent() async {
    final phoneToLogin = await AsyncStorageManager()
        .get<String>(AsyncStorageKeys.mobileNumberToLogin);
    return studentDataList
        .where((element) => element.phoneToLogin == phoneToLogin)
        .firstOrNull;
  }

  updateFCMToken() async {
    final rows = await schoolWorksheet?.values.allRows() ?? [];

    // Iterate through rows and update column R for matching rows
    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];
      if (row.length > 1 && row[1] == 'ABC') {
        // Column B is index 1
        final rowIndex = i + 1; // Row indices start from 1
        const columnRIndex = 18; // Column R is the 18th column

        // Update column R for the matching row
        await schoolWorksheet!.values
            .insertValue('Updated Value', column: columnRIndex, row: rowIndex);
        print('Updated row $rowIndex in column R.');
      }
    }
  }
}

class GoogleSheetDateParser {
  static const gsDateBase = 2209161600 / 86400;
  static const gsDateFactor = 86400000;

  static double dateToGsheet(DateTime dateTime, {bool localTime = true}) {
    final offset = dateTime.millisecondsSinceEpoch / gsDateFactor;
    final shift = localTime ? dateTime.timeZoneOffset.inHours / 24 : 0;
    return gsDateBase + offset + shift;
  }

  static DateTime? dateFromGSheets(String value, {bool localTime = true}) {
    final date = double.tryParse(value);
    if (date == null) return null;
    final millis = (date - gsDateBase) * gsDateFactor;
    return DateTime.fromMillisecondsSinceEpoch(millis.toInt(),
        isUtc: localTime);
  }
}
