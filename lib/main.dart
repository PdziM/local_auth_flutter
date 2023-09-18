import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/local_auth/repositories/local_auth_repository.dart';
import 'main_state.dart';
import 'presentation/home/home_view.dart';
import 'repositories/app_local_auth.dart';
import 'repositories/services.dart';
import 'utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // SERVICES
        Provider<LocalAuthService>(create: (_) => Config.localAuthService),
        Provider<AppLocalAuth>(create: (_) => Config.appLocalAuth),

        // USECASES
        Provider<LocalAuthUsecase>(create: (_) => Config.localAuthUsecase),

        ListenableProvider<MainState>(create: (_) => MainState(context))
      ],
      child: Consumer<MainState>(
        builder: (_, state, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
