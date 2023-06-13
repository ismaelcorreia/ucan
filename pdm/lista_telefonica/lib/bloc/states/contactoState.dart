import 'package:equatable/equatable.dart';
import 'package:lista_telefonica/model/contactoModel.dart';

abstract class ContactoState extends Equatable {}

class ContactoCriado extends ContactoState {
  final bool result;
  ContactoCriado(this.result);

  @override
  List<Object?> get props => [result];
}

class ContactoEliminado extends ContactoState {
  final bool result;
  ContactoEliminado(this.result);

  @override
  List<Object?> get props => [result];
}

class ContactoEditado extends ContactoState {
  final bool result;
  ContactoEditado(this.result);

  @override
  List<Object?> get props => [result];
}

class ContactosCarregado extends ContactoState {
  final bool result;
  final List<ContactoModel>? list;
  ContactosCarregado({this.result = false, this.list});

  @override
  List<Object?> get props => [result, list];
}

class InitialState extends ContactoState {
  final List? list;
  InitialState({this.list});
  @override
  List<Object?> get props => [list];
}
