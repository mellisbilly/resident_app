import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resident_app/app/theme/theme.dart';
import 'package:resident_app/home/home.dart';
import 'package:resident_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO(billy): add theme cubit and dark theme.
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.select((ThemeCubit cubit) => cubit.state.themeMode), 
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
