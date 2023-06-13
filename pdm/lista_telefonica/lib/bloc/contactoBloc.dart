import 'package:bloc/bloc.dart';
import 'package:lista_telefonica/bloc/events/addContactoEvent.dart';
import 'package:lista_telefonica/bloc/events/contactoEvent.dart';
import 'package:lista_telefonica/bloc/events/loadContactosEvent.dart';
import 'package:lista_telefonica/bloc/states/contactoState.dart';
import 'package:lista_telefonica/controllers/contactoDump.dart';

class ContactoBloc extends Bloc<ContactoEvent, ContactoState> {
  ContactoBloc() : super(InitialState());

  @override
  Stream<ContactoState> mapEventToState(ContactoEvent event) async* {
    if (event is AddContactoEvent) {
      yield* _saveContacto(event);
    } else if (event is LoadContactosEvent) {
      yield* _loadContactos(event);
    }
  }

  Stream<ContactoCriado> _saveContacto(AddContactoEvent event) async* {
    final listaContactos = await ContactoDump().getContactos();
    listaContactos.add(event.model);
    final result = await ContactoDump().saveContactos(listaContactos);
    yield ContactoCriado(result);
  }

  Stream<ContactosCarregado> _loadContactos(LoadContactosEvent event) async* {
    final listaContactos = await ContactoDump().getContactos();
    final result = await ContactoDump().saveContactos(listaContactos);
    yield ContactosCarregado(result: result, list: listaContactos);
  }
}
