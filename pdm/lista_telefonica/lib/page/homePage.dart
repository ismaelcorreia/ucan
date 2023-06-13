import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_telefonica/bloc/contactoBloc.dart';
import 'package:lista_telefonica/bloc/states/contactoState.dart';
import 'package:lista_telefonica/components/body.dart';
import 'package:lista_telefonica/components/contactoForm.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, this.title = 'Lista de contactos'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BodyAppComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContact(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _addContact(context) {
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        builder: (_) => ContactoForm());
  }
}
