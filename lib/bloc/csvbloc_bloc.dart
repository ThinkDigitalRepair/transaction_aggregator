import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:csv/csv.dart';

class CsvBloc extends Bloc<CsvBlocEvent, CsvBlocState> {
  final String csvData;

  CsvBloc(this.csvData);

  @override
  CsvBlocState get initialState => InitialCsvBlocState(csvData);

  @override
  Stream<CsvBlocState> mapEventToState(
    CsvBlocEvent event,
  ) async* {
    if (event is GetRowAsListOfValues) {
      {
        List<List> rowsAsListOfValues = this.rowsAsListOfValues;
        yield RowResultBlocState(rowsAsListOfValues);
      }
    }
  }

  List<List> get rowsAsListOfValues =>
      CsvToListConverter(eol: '\n').convert(csvData);

  List<CsvRow> getIdenticalTransactions(String columnName, String value) {}
}
