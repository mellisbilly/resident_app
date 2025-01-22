import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resident_app/home/home.dart';

void main() {
  group('HomeCubit', () {
    HomeCubit buildCubit() => HomeCubit();

    group('constructor', () {
      test('works properly', () {
        expect(buildCubit, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildCubit().state,
          equals(const HomeState()),
        );
      });
    });

    group('setTab', () {
      blocTest<HomeCubit, HomeState>(
        'sets tab to given value',
        build: buildCubit,
        act: (cubit) => cubit.setTab(HomeTab.home),
        expect: () => [
          const HomeState(),
        ],
      );
    });
  });
}
