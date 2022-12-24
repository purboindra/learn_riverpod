import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futureprovider/state_notifier_provider/model/person_model.dart';
import 'package:futureprovider/state_notifier_provider/person_notifier.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PersonModel> person = ref.watch(personProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Notifier Provider Example',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Add Person',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: person.length,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Name is ${person[index].name}",
                        style: const TextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Age is ${person[index].age}",
                        style: const TextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Address is ${person[index].address}",
                        style: const TextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Job is ${person[index].job}",
                        style: const TextStyle(),
                      ),
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(personProvider.notifier).addPerson(
                    PersonModel(
                      name: 'Sherlock',
                      address: '221B Baker Street',
                      age: 27,
                      job: 'Detective Consultant',
                    ),
                  );
            },
            child: const Text('Add Person'),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
