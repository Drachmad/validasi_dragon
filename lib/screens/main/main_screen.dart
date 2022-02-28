import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/bon/sudah_val_sp/sudah_val_sp_screen.dart';
import 'package:admin/screens/bon/val_bon/val_bon_screen.dart';
import 'package:admin/screens/po/val_po/val_po_screen.dart';
import 'package:admin/screens/po/val_po_bahan/val_po_bahan_screen.dart';
import 'package:admin/screens/po/val_po_import/val_po_import_screen.dart';
import 'package:admin/screens/po/val_po_nonbahan/val_po_nonbahan_screen.dart';
import 'package:admin/screens/pp/val_pp_bahan/val_pp_bahan_screen.dart';
import 'package:admin/screens/pp/val_pp_nonbahan/val_pp_nonbahan_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          //show snackbar
          final snack = SnackBar(
            backgroundColor: bgColor,
            content: Text(
              'Tekan Sekali Lagi Untuk Keluar',
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: GetMaterialApp(
                  theme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: bgColor,
                    textTheme: GoogleFonts.poppinsTextTheme(
                            Theme.of(context).textTheme)
                        .apply(bodyColor: Colors.white),
                    canvasColor: secondaryColor,
                  ),
                  initialRoute: '/val_po',
                  getPages: [
                    GetPage(name: '/val_po', page: () => ValPoScreen()),
                    GetPage(
                        name: '/val_po_bahan', page: () => ValPoBahanScreen()),
                    GetPage(
                        name: '/val_po_nonbahan',
                        page: () => ValPoNonBahanScreen()),
                    GetPage(
                        name: '/val_po_import',
                        page: () => ValPoImportScreen()),
                    GetPage(
                        name: '/val_pp_bahan', page: () => ValPpBahanScreen()),
                    GetPage(
                        name: '/val_pp_nonbahan',
                        page: () => ValPpNonBahanScreen()),
                    GetPage(
                        name: '/bon_sudah_val_sp',
                        page: () => SudahValSPScreen()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
