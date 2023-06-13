import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lista_telefonica/bloc/contactoBloc.dart';
import 'package:lista_telefonica/bloc/events/loadContactosEvent.dart';
import 'package:lista_telefonica/bloc/states/contactoState.dart';
import 'package:lista_telefonica/model/contactoModel.dart';

class BodyAppComponent extends StatelessWidget {
  BodyAppComponent({super.key});

  List<ContactoModel> contactoList = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    context.read<ContactoBloc>().add(LoadContactosEvent());
    return BlocListener<ContactoBloc, ContactoState>(
      listener: (context, state) {
        if (state is InitialState) {
          context.read<ContactoBloc>().add(LoadContactosEvent());
        }
        if (state is ContactoCriado) {
          if (state.result) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Contacto adicionado com sucesso'),
              ),
            );
            context.read<ContactoBloc>().add(LoadContactosEvent());
          }
        }
        if (state is ContactosCarregado) {
          contactoList = state.list!;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            BlocBuilder<ContactoBloc, ContactoState>(builder: (context, state) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: contactoList.length,
            itemBuilder: (context, index) =>
                ContactListItem(contacto: contactoList[index]),
          );
        }),
      ),
    );
  }
}

class ContactListItem extends StatelessWidget {
  final ContactoModel contacto;
  const ContactListItem({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(
              contacto.firstLetters().toUpperCase(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              SizedBox(
                width: 250,
                child: Text(contacto.name,
                    style: TextStyle(fontSize: 22, color: Colors.purple[800]),
                    textAlign: TextAlign.start),
              ),
              SizedBox(
                width: 100,
                child: Text(contacto.emailAddress,
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                    textAlign: TextAlign.start),
              ),
              SizedBox(
                width: 150,
                child: Text(contacto.numberPhone,
                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                    textAlign: TextAlign.start),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
