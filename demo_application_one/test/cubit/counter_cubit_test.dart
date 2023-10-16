import 'package:bloc_test/bloc_test.dart';
import 'package:demo_application_one/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CounterCubit? counterCubit;
  group('CounterCubit', () {
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit?.close();
    });

    test("initial value should be 0", () {
      expect(counterCubit?.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>("counter should be increment by 1", 
    build: () => counterCubit!,
    act:(cubit) => counterCubit?.increament(),
    expect:() => [CounterState(counterValue: 1)]);

 blocTest<CounterCubit, CounterState>("counter should be increment by 1", 
    build: () => counterCubit!,
    act:(cubit) => counterCubit?.decreament(),
    expect:() => [CounterState(counterValue: -1)]);


  });
}
