import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_aggregator/bloc/bloc.dart';

Future main() async {
  String csvData = await rootBundle.loadString("assets/google_pay_payments"
      ".csv");
  CsvBloc csvBloc = CsvBloc(csvData);
  runApp(BlocProvider(
      bloc: csvBloc,
      child: MaterialApp(
          title: "Transaction "
              "Aggregator",
          home: Home())));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CsvBlocEvent, CsvBlocState>(
        bloc: BlocProvider.of<CsvBloc>(context),
        builder: (BuildContext context, state) {
          if (state is RowResultBlocState) {
            return Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Text(state.rowsAsListOfValues.toString()),
                ],
              ),
            );
          } else
            return Center(
              child: MaterialButton(
                  child: Text("Press me"),
                  onPressed: () {
                    BlocProvider.of<CsvBloc>(context)
                        .dispatch(GetRowAsListOfValues());
                  }),
            );
        },
      ),
    );
  }
}
