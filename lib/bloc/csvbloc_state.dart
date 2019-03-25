import 'package:meta/meta.dart';

@immutable
abstract class CsvBlocState {
  final String csvData;
  final List results;

  CsvBlocState({@required this.csvData, @required this.results});

  CsvBlocState copyWith();
}

class InitialCsvBlocState extends CsvBlocState {
  InitialCsvBlocState(String csvData) : super(csvData: csvData, results: null);

  @override
  CsvBlocState copyWith() => null;
}

class RowResultBlocState extends CsvBlocState {
  final CsvTable csvTable;

  RowResultBlocState(this.csvTable);

  @override
  CsvBlocState copyWith({List rowsAsListOfValues}) =>
      RowResultBlocState(rowsAsListOfValues ?? this.rowsAsListOfValues);
}

class CsvRow {}

class CsvTable {
  List<String> headers;
  List<List> data;

  CsvTable(List<List<dynamic>> data) {
    this.headers = data[0];
    this.data = data.getRange(1, data.length);
  }
}
