import 'package:admin/constants.dart';
import 'package:admin/controllers/login_controller.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage("assets/images/logo2.png"),
                    height: 70,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    LoginController.nama_staff,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    LoginController.divisi,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
// ========================= PO ===========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "PO",
                  ),
                  children: <Widget>[
                    ListTile(
                      selectedTileColor: bgColorDark,
                      title: Text(
                        'Validasi PO',
                      ),
                      onTap: () {
                        Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Validasi PO Bahan',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Jahit'),
                          onTap: () {
                            Get.offNamed('/val_po_bahan?JENIS=JAHIT');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Kimia'),
                          onTap: () {
                            Get.offNamed('/val_po_bahan?JENIS=KIMIA');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Packing'),
                          onTap: () {
                            Get.offNamed('/val_po_bahan?JENIS=PACKING');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Plong'),
                          onTap: () {
                            Get.offNamed('/val_po_bahan?JENIS=PLONG');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Validasi PO Non Bahan',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Non Bahan DR1'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=I');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan DR2'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=II');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan DR3'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=III');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Angkutan'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=ANGKUTAN');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Umum'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=UMUM');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Gabungan'),
                          onTap: () {
                            Get.offNamed('/val_po_nonbahan?DR=GABUNGAN');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Validasi Import',
                      ),
                      onTap: () {
                        Get.offNamed('/val_po_import');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Validasi Non Bahan',
                      ),
                      onTap: () {
                        Get.offNamed('/val_po_nonbahan?DR=');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Marketing Ekspor',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('PO Marketing Ekspor'),
                          onTap: () {
                            Get.offNamed('/val_po_marketing_ekspor');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Cancel PO Marketing'),
                          onTap: () {
                            // Get.offNamed('/val_po_nonbahan?DR=II');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Bon Shipping Sample',
                          ),
                          onTap: () {
                            // Get.offNamed('/val_po');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Bon Marketing Eksport',
                          ),
                          onTap: () {
                            // Get.offNamed('/val_po');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),

// ========================= PP ===========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "PP",
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Non Bahan',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Non Bahan ATK'),
                          onTap: () {
                            Get.offNamed('/val_pp_nonbahan?SUB=ATK');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Inventaris'),
                          onTap: () {
                            Get.offNamed('/val_pp_nonbahan?SUB=INV');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Sparepart'),
                          onTap: () {
                            Get.offNamed('/val_pp_nonbahan?SUB=SP');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan Umum'),
                          onTap: () {
                            Get.offNamed('/val_pp_nonbahan?SUB=UM');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Non Bahan RTH'),
                          onTap: () {
                            Get.offNamed('/val_pp_nonbahan?SUB=RTH');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Bahan',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Bahan DR1'),
                          onTap: () {
                            Get.offNamed('/val_pp_bahan?DR=I');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Bahan DR2'),
                          onTap: () {
                            Get.offNamed('/val_pp_bahan?DR=II');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Bahan DR3'),
                          onTap: () {
                            Get.offNamed('/val_pp_bahan?DR=III');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'RND',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('LBBA'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Cetakan'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Cetakan Import'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Pisau',
                      ),
                      onTap: () {
                        Get.offNamed('/val_pp_pisau');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'LBBA',
                      ),
                      onTap: () {
                        Get.offNamed('/val_pp_lbba');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Cetakan',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_pp_cetakan');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Cetakan Import',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_pp_cetakanImport');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Non Bahan Belum Validasi',
                      ),
                      onTap: () {
                        Get.offNamed('/val_pp_nonbahan?SUB=');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Order Jahit Luar',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_pp_nonbahan');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== SPIK =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "SPIK",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Verifiksai SPIK',
                      ),
                      onTap: () {
                        Get.offNamed('/val_spik');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== HARGA =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Harga",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Pertimbangan Harga',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Kenaikan Harga',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Penawaran Harga (Mkt Ekspor)',
                      ),
                      onTap: () {
                        Get.offNamed('/penawaran_harga');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Validasi Potongan Harga',
                      ),
                      onTap: () {
                        Get.offNamed('/val_potongan_harga');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== ORDER =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Order",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Verifikasi Rekap Order',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Verifikasi Order Repacking',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== PENGAJUAN =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Pengajuan",
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Harga Borongan',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('DR 1'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('DR 2'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('DR 3'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Air Blow'),
                          onTap: () {
                            Get.offNamed('/harga_borongan?DR=AIRBLOW');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Inject DR 2'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Phylon'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Vulcanized'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Lembur',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Validasi Kabag'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Validasi Lembur Staff'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Validasi Lembur Produksi'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Karyawan Baru',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Validasi Pengajuan Staf'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Validasi Pengajuan Produksi'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Karyawan'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: Text('Karyawan Produksi'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      childrenPadding: EdgeInsets.only(left: 16),
                      title: Text(
                        'Penyesuaian Stok',
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Text('Validasi Penyesuaian Stok'),
                          onTap: () {
                            // Get.offNamed('/val_pp_rnd');
                            if (!Responsive.isDesktop(context))
                              Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),

// ======================== BAHAN =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Bahan",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Kerusakan Komponen',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Bahan / Keluar DO',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Kerusakan Komponen Produksi',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== BMPK =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "BMPK",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'BMPK',
                      ),
                      onTap: () {
                        Get.offNamed('/bmpk');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'BMPK Marketing',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== BON =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "BON",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Validasi Bon',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Belum Val Sparepart',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Sudah Val Sparepart',
                      ),
                      onTap: () {
                        Get.offNamed('/bon_sudah_val_sp');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== PENYESUAIAN =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Penyesuaian",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Validasi Factory Manager',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),

// ======================== BANTUAN =========================
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 16),
                  leading: SvgPicture.asset(
                    "assets/icons/menu_dashbord.svg",
                    height: 12,
                    color: primaryColor,
                  ),
                  title: Text(
                    "Bantuan",
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Bantuan IT',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Bantuan Teknik',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Bantuan Umum',
                      ),
                      onTap: () {
                        // Get.offNamed('/val_po');
                        if (!Responsive.isDesktop(context))
                          Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
