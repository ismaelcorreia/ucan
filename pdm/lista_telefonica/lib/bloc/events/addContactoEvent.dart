import 'package:lista_telefonica/bloc/events/contactoEvent.dart';
import 'package:lista_telefonica/model/contactoModel.dart';

class AddContactoEvent extends ContactoEvent {
  final ContactoModel model;
  AddContactoEvent(this.model);

  @override
  List<Object?> get props => [model];
}
