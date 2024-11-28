import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_mvvm/home_view_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          HomeState homeState = ref.watch(homeViewModelProvider);
          return Column(
            children: [
              Text('이름: ${homeState.user?.name ?? ""}'),
              Text('나이: ${homeState.user?.name ?? ""}'),
              GestureDetector(
                onTap: () {
                  HomeViewModel homeViewModel =
                      ref.read(homeViewModelProvider.notifier);
                  print("클릭!");
                },
                child: Text('정보 가져오기'),
              ),
            ],
          );
        },
      ),
    );
  }
}
