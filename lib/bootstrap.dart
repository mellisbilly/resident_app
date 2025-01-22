import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:property_api_client/property_api_client.dart';
import 'package:property_repository/property_repository.dart';
import 'package:resident_app/app/theme/theme.dart';

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
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaXJzdE5hbWUiOiJNaXRjaCIsImxhc3ROYW1lIjoiRm9yZCIsImVtYWlsIjoic2FtQGhvbWVseW5jLmlvIiwibmFtZSI6Ik1pdGNoIEZvcmQiLCJjbGFpbXMiOlt7ImtleSI6ImdpdmVuX25hbWUiLCJ2YWx1ZSI6Ik1pdGNoIn0seyJrZXkiOiJmYW1pbHlfbmFtZSIsInZhbHVlIjoiRm9yZCJ9LHsia2V5IjoiZW1haWwiLCJ2YWx1ZSI6InNhbUBob21lbHluYy5pbyJ9LHsia2V5IjoiZW1haWxfdmVyaWZpZWQiLCJ2YWx1ZSI6dHJ1ZX0seyJrZXkiOiJzdWIiLCJ2YWx1ZSI6ImF1dGgwfDg5NDBlOWM1LTRlNGUtNGZlMy1iMDQxLTFlYzA4MzI2NmVkZCJ9LHsia2V5IjoidXNlcklkIiwidmFsdWUiOiI1NTE2ZjcxOS1iODZhLTExZWYtYTJmNC0wYTZjNzg4YTVjODIifSx7ImtleSI6ImFwaTphZG1pbiIsInZhbHVlIjoiYWljb19ob21lbGlua19kZW1vIn1dLCJzdWIiOiJzYW1AaG9tZWx5bmMuaW8iLCJpc3MiOiJob21lbHluYy1hdXRoIiwiaWF0IjoxNzM3MzY3NjEyLCJqdGkiOiJmYjE4MzlkMy0zNjRjLTQ3MmQtYjk3YS1jMmQ3N2Q0MmU3YzciLCJhdWQiOiJkYXNoYm9hcmQiLCJ1c2VybmFtZSI6InRsYSIsInNjb3BlcyI6WyJhcGk6YWRtaW4iLCJhcGk6YWRtaW4iLCJhcGk6YWRtaW4iXSwiZXhwIjoxNzM3NTQwNDEyfQ.oAlQFCpAF_XjMeExg3pGnrkfCX0tDNMuYLOTJXxVUPU',
              propertyReference: 'AICO_HOMELINK_DEMO_Office_demo_002',
            ),
          ),
        ),
      ],
      child: await builder(),
    ),
  );
}
