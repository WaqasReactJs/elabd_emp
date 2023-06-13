import 'package:elabd_tms_app/screens/attendence/attendence_screen_provider.dart';
import 'package:elabd_tms_app/screens/home/home_screen_provider.dart';
import 'package:elabd_tms_app/screens/splash/splash_screen.dart';
import 'package:elabd_tms_app/screens/task_details/task_details_provider.dart';
import 'package:elabd_tms_app/services/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/select_index_controller.dart';
import 'models/shared_preferences_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencyInjection();
  runApp(const MyApp());
}

Future<void> initDependencyInjection() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferencesModel>(
      SharedPreferencesModel(sharedPreferences));
  getIt.registerSingleton<HomeScreenProvider>(HomeScreenProvider());
  getIt.registerSingleton<SelectIndexController>(SelectIndexController());
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendenceScreenProvider()),
        ChangeNotifierProvider(create: (_) => TaskDetailsProvider()),
        ChangeNotifierProvider(create: (_) => AuthServiceProvider()),
        ChangeNotifierProvider(create: (_) => HomeScreenProvider()),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
