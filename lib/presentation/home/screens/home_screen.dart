// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloc_counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 253, 238, 192),
              ),
              // todo
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
              },
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 240, 177, 147),
              ),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(ResetEvent());
              },
              child: Text(
                '0',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 183, 253, 150),
              ),
              onPressed: () {
                context.read<CounterBloc>().add(DecrementEvent());
                // BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
              },
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counter:   ',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            // todo re -  build this widget with bloc
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return Text(
                    '0',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else if (state is CounterValueChangedState) {
                  return Text(
                    state.counter.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
