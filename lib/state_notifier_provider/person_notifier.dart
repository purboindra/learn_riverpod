import 'package:futureprovider/state_notifier_provider/model/person_model.dart';
import 'package:riverpod/riverpod.dart';

final personProvider =
    StateNotifierProvider<PersonNotifier, List<PersonModel>>((ref) {
  return PersonNotifier();
});

class PersonNotifier extends StateNotifier<List<PersonModel>> {
  PersonNotifier() : super([]);

  void addPerson(PersonModel personModel) {
    state = [...state, personModel];
  }
}
