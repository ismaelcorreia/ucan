import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_telefonica/bloc/contactoBloc.dart';
import 'package:lista_telefonica/views/mainApp.dart';

void main() async {
  // Make sure you define your database name
  // await ConnectionFactory.openConnection('phone_database');
  runApp(
    BlocProvider(
      create: ((context) => ContactoBloc()),
      child: const MainApp(),
    ),
  );
}
