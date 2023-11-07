import 'package:bright_me/bloc/auth/auth_bloc.dart';
import 'package:bright_me/bloc/cart/cart_bloc.dart';
import 'package:bright_me/bloc/detection/detection_bloc.dart';

import 'package:bright_me/bloc/product/product_bloc.dart';
import 'package:bright_me/bloc/user/user_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/route.dart';
import 'package:bright_me/pages/app_page.dart';
import 'package:bright_me/pages/onboarding/onboarding_page.dart';
import 'firebase_options.dart';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(HasLoginEvent())),
        BlocProvider(create: (context) => UserBloc()..add(FetchUserEvent())),
        BlocProvider(
            create: (context) => ProductBloc()..add(FetchListAllProduct())),
        BlocProvider(create: (context) => DetectionBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Poppins",
            scaffoldBackgroundColor: whiteColor,
          ),
          onGenerateRoute: RouteGenarator.generateRoute,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const AppPages();
              }
              return const OnboardingPage();
            },
          )),
    );
  }
}
