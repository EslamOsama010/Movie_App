import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/screens/home/controller.dart';
import 'package:training/screens/home/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeController(),
      child: Builder(
        builder: (context) {
          final controller = HomeController.get(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      onPressed: controller.plus,
                      child: Icon(Icons.add),
                    ),
                    BlocConsumer<HomeController, HomeStates>(
                      builder: (context, state) {
                        return Text('${controller.x}');
                      },
                      listener: (context, state) {},
                    ),
                    FloatingActionButton(
                      mini: true,
                      onPressed: controller.minus,
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
