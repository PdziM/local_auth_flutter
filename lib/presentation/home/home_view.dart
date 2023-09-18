import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums/supported_device.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer<HomeState>(
        builder: (_, state, __) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: ListView(
                padding: const EdgeInsets.only(top: 30),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.supportedDevice == SupportedDevice.unknown)
                        const CircularProgressIndicator()
                      else if (state.supportedDevice ==
                          SupportedDevice.supported)
                        const Text('Dispositivo Suportado!')
                      else
                        const Text('Dispositivo não Suportado!'),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: state.authentication,
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Authenticate'),
                              ],
                            ),
                          ),
                          if (state.authenticated) ...[
                            Text('USER ESTÁ AUTENTICADO!')
                          ]
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
