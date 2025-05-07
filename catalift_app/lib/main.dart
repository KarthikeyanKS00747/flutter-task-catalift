import 'package:catalift_app/viewmodels/mentor_viewmodel.dart';
import 'package:flutter/material.dart';
import 'router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MentorViewModel())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        child: MaterialApp.router(
          
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          routerConfig: router,
        ),
      ),
    );
  }
}
