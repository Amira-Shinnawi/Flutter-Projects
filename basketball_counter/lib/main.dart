import 'package:basketball_counter/cubit/cubit/counter_cubit.dart';
import 'package:basketball_counter/cubit/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(PointCounter());
}

class PointCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team A',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamApoints}',
                          style: const TextStyle(
                            fontSize: 100,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'A', buttonNumber: 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 1 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'A', buttonNumber: 2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 2 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'A', buttonNumber: 3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 3 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 2,
                      endIndent: 50,
                      indent: 50,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamBpoints}',
                          style: const TextStyle(
                            fontSize: 100,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 1 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 2 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .teamIncrement(team: 'B', buttonNumber: 3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          child: const Text(
                            'Add 3 Point',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).resetPoints();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
