import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_projects/provider/home_page_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<HomePageProvider>(
                  builder: (context, provider, _) {
                    if (provider.loading) {
                      return const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else {
                      return Text(
                        provider.weather,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'You have pushed th button this many times',
                ),
                Consumer<HomePageProvider>(
                  builder: (context, provider, _) {
                    return Text(
                      provider.counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                )
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Consumer<HomePageProvider>(
                              builder: (context, provider, _) {
                            return FloatingActionButton(
                              onPressed: () => provider.getWeather(),
                              tooltip: 'get weather',
                              child: const Icon(Icons.cloud),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 60,
                          child: Consumer<HomePageProvider>(
                              builder: (context, provider, _) {
                            return FloatingActionButton(
                              onPressed: provider.changeTheme,
                              tooltip: 'change theme',
                              child: provider.light
                                  ? const Icon(Icons.dark_mode)
                                  : const Icon(Icons.light_mode),
                            );
                          }),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Consumer<HomePageProvider>(
                            builder: (context, provider, _) {
                              return provider.counter == 10
                                  ? const SizedBox.shrink()
                                  : FloatingActionButton(
                                      onPressed: provider.incrementCounter,
                                      tooltip: 'increment',
                                      child: const Icon(Icons.add),
                                    );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 60,
                          child: Consumer<HomePageProvider>(
                            builder: (context, provider, _) {
                              return provider.counter == 0
                                  ? const SizedBox.shrink()
                                  : FloatingActionButton(
                                      onPressed: provider.decrementCounter,
                                      tooltip: 'decrement',
                                      child: const Icon(Icons.remove),
                                    );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
