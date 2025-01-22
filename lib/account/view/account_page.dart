import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resident_app/app/theme/theme.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountView();
  }
}

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Switch(
          value: context.select(
            (ThemeCubit cubit) => cubit.state.themeMode == ThemeMode.dark,
          ),
          onChanged: (_) {
            context.read<ThemeCubit>().switchTheme();
          },
        ),
      ],
    );
  }
}
