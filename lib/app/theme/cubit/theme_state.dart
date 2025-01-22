part of 'theme_cubit.dart';

enum ThemeStatus { initial, loading, success, failure }

final class ThemeState extends Equatable {
  const ThemeState({
    this.status = ThemeStatus.initial,
    this.themeMode = ThemeMode.system,
  });

  final ThemeStatus status;
  final ThemeMode themeMode;

  ThemeState copyWith({
    ThemeStatus? status,
    ThemeMode? themeMode,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object> get props => [status, themeMode];
}
