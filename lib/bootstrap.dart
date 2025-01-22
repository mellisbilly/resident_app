import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:property_repository/property_repository.dart';
import 'package:resident_app/app/theme/theme.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(
            themeRepository: ThemeRepository(),
          )..getCurrentTheme(),
        ),
        RepositoryProvider.value(
          value: PropertyRepository(
            propertyApiClient: PropertyApiClient(
              baseUrl: 'https://sensorium.uat.homelync.io',
              userToken:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdE5hbWUiOiJCaWxseSIsImxhc3ROYW1lIjoiTWVsbGlzIiwiZW1haWwiOiJiaWxseUBob21lbGluay5jbyIsIm5hbWUiOiJCaWxseSBNZWxsaXMiLCJjbGFpbXMiOlt7ImtleSI6ImdpdmVuX25hbWUiLCJ2YWx1ZSI6IkJpbGx5In0seyJrZXkiOiJmYW1pbHlfbmFtZSIsInZhbHVlIjoiTWVsbGlzIn0seyJrZXkiOiJlbWFpbCIsInZhbHVlIjoiYmlsbHlAaG9tZWxpbmsuY28ifSx7ImtleSI6ImVtYWlsX3ZlcmlmaWVkIiwidmFsdWUiOnRydWV9LHsia2V5Ijoic3ViIiwidmFsdWUiOiJhdXRoMHw2NzBlMmY5NTQ2ZjY3ZDdiYjY0Yzc0MjIifSx7ImtleSI6ImFwaTpsYW5kbG9yZCIsInZhbHVlIjoiYWljb19ob21lbGlua19kZW1vIn0seyJrZXkiOiJ1c2VySWQiLCJ2YWx1ZSI6IjExMWNiYzIxLTViMzgtNDczYy04YjYzLTEzYzk4Yzg1OTkxNCJ9XSwic3ViIjoiYmlsbHlAaG9tZWxpbmsuY28iLCJpc3MiOiJob21lbHluYy1hdXRoIiwiaWF0IjoxNzM3NTUxMTAwLCJqdGkiOiIxYzU1MTZiMi04ZWJhLTRiODUtODBjYS1lYmZlNDJhYjhjNzIiLCJhdWQiOiJkYXNoYm9hcmQiLCJ1c2VybmFtZSI6ImJpbGx5X3VhdCIsInNjb3BlcyI6WyJhcGk6bGFuZGxvcmQiLCJhcGk6bGFuZGxvcmQiXSwiZXhwIjoxNzM3NzIzOTAwfQ.YrdhZHNpY3uxEnELC5vYogZOilZ8C7YB86drfOYIZ4g',
              propertyReference: 'AICO_HOMELINK_DEMO_Office_demo_002',
            ),
          ),
        ),
      ],
      child: await builder(),
    ),
  );
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
