import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:resident_app/app/theme/repositories/theme_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required ThemeRepository themeRepository,
  })  : _themeRepository = themeRepository,
        super(const ThemeState());

  final ThemeRepository _themeRepository;
  static late bool _isDarkTheme;

  Future<void> getCurrentTheme() async {
    final isDarkTheme = await _themeRepository.getTheme();
    _isDarkTheme = isDarkTheme;
    emit(
      state.copyWith(themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light),
    );
  }

  Future<void> switchTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _themeRepository.setTheme(isDarkTheme: _isDarkTheme);
    emit(
      state.copyWith(
        themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
