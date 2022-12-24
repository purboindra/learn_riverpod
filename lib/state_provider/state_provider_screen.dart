import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futureprovider/future_provider/future_provider_screen.dart';

// OUR DEFAULT VALUE
final numberProvider = StateProvider<int>((ref) {
  return 0;
});

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // CREATE OUR VALUE
    int numberVal = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FutureProviderScreen(),
          )),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: const Text(
          'State Provider Example',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'State Provider Increment Example',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              numberVal.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(numberProvider.notifier).state++;
                },
                child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}
