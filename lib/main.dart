import 'package:crud_firebase/controller/add_provider.dart';
import 'package:crud_firebase/controller/homedonor_provider.dart';
import 'package:crud_firebase/service/firebase_options.dart';
import 'package:crud_firebase/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => DonorProvider()),
    ChangeNotifierProvider(create: (context)=>AddProvider()),
       // ChangeNotifierProvider(create: (context)=>ProviderImage()),

    ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

