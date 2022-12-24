import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futureprovider/future_provider/controller.dart';
import 'package:futureprovider/state_provider/state_provider_screen.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const StateProviderScreen(),
            ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          ),
        ),
        title: const Text('Future Provider'),
      ),
      body: ref.watch(futureUserProvider(1)).when(
            data: (data) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.data!.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(data.data![index].firstName!),
                        subtitle: Text(data.data![index].lastName!),
                        leading: ClipOval(
                          child: Image.network(
                            data.data![index].avatar!,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) {
              log('ERR ${stackTrace.toString()}');
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
