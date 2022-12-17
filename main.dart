import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/metrics.dart';
import 'widgets/app_button.dart';

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

/// Providers are declared globally and specify how to create a state
final counterProvider = StateProvider((z) {
  return 0;
});

final isTextProvider = StateProvider((w) {
  return false;
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, x) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer(
              builder: (context, y, _) {
                final count = y.watch(counterProvider);
                final output = y.watch(isTextProvider);
                return Column(
                  children: [
                    spacer,
                    output
                        ? ElevatedButton(onPressed: () {}, child: Text('Add'))
                        : Text(
                            '$count',
                          ),
                    Text(
                      '$output',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x.read(counterProvider.notifier).state++;

          x.read(isTextProvider.notifier).state =
              !x.read(isTextProvider.notifier).state;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
