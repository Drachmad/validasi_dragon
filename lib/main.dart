import 'package:admin/constants.dart';
import 'package:admin/controllers/bmpk_controller.dart';
import 'package:admin/controllers/bon_controller.dart';
import 'package:admin/controllers/harga_controller.dart';
import 'package:admin/controllers/pengajuan_controller.dart';
import 'package:admin/controllers/pp_controller.dart';
import 'package:admin/controllers/spik_controller.dart';
import 'package:admin/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'controllers/login_controller.dart';
import 'controllers/MenuController.dart';
import 'controllers/po_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Provider

  sl.registerFactory(() => LoginController());
  sl.registerFactory(() => MenuController());
  sl.registerFactory(() => ValPoController());
  sl.registerFactory(() => ValPpController());
  sl.registerFactory(() => SudahValSPController());
  sl.registerFactory(() => BMPKController());
  sl.registerFactory(() => HargaController());
  sl.registerFactory(() => PengajuanController());
  sl.registerFactory(() => SPIKController());
}

Future<void> main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then((_) =>
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => sl<LoginController>()),
          ChangeNotifierProvider(create: (context) => sl<MenuController>()),
          ChangeNotifierProvider(create: (context) => sl<ValPoController>()),
          ChangeNotifierProvider(create: (context) => sl<ValPpController>()),
          ChangeNotifierProvider(
              create: (context) => sl<SudahValSPController>()),
          ChangeNotifierProvider(create: (context) => sl<BMPKController>()),
          ChangeNotifierProvider(create: (context) => sl<HargaController>()),
          ChangeNotifierProvider(
              create: (context) => sl<PengajuanController>()),
          ChangeNotifierProvider(create: (context) => sl<SPIKController>()),
        ],
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
          fontSizeFactor: 0.8,
        ),
        canvasColor: secondaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
