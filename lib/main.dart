import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db_app/app/controller/provider/movie_db_provider.dart';
import 'package:movie_db_app/app/views/home.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();

  await FastCachedImageConfig.init(clearCacheAfter: const Duration(seconds: 10));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => MovieDbProvider()..getMovieData()..getTvData()..getNowPlayingData(),
          child: MaterialApp(
            theme: ThemeData(
                useMaterial3: true,
               ),
            home: const Home(),
          ),
        );
      },
    );
  }
}
