import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_telefonica/bloc/contactoBloc.dart';
import 'package:lista_telefonica/bloc/events/addContactoEvent.dart';
import 'package:lista_telefonica/bloc/events/contactoEvent.dart';
import 'package:lista_telefonica/bloc/states/contactoState.dart';
import 'package:lista_telefonica/model/contactoModel.dart';

class ContactoForm extends StatelessWidget {
  ContactoForm({super.key});

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  var _scaffold;
  @override
  Widget build(BuildContext context) {
    _scaffold = ScaffoldMessenger.of(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o seu nome",
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o seu email",
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite o seu número de telefone",
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  final contacto = ContactoModel(
                      id: 0,
                      name: _nameController.text,
                      emailAddress: _emailController.text,
                      numberPhone: _phoneController.text);
                  context.read<ContactoBloc>().add(AddContactoEvent(contacto));
                  Navigator.of(context).pop();
                },
                child: const Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
