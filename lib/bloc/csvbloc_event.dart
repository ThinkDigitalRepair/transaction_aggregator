import 'package:meta/meta.dart';

@immutable
abstract class CsvBlocEvent {}

class GetRowAsListOfValues extends CsvBlocEvent {}
