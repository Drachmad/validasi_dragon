import 'package:admin/constants.dart';
import 'package:admin/controllers/login_controller.dart';
import 'package:admin/screens/po/val_po/val_po_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
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
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryLightColor),
                ),
                Text(
                  LoginController.divisi,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryLightColor),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/menu_dashbord.svg",
                      height: 16,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "PO",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryLightColor),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/icons/angle-down-solid.svg",
                        height: 16,
                        color: primaryColor,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Badge(
                          position: BadgePosition.topEnd(top: -15, end: -10),
                          toAnimate: false,
                          badgeColor: primaryColor,
                          borderRadius: BorderRadius.circular(2),
                          badgeContent: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/menu_notification.svg",
                            height: 20,
                            color: kPrimaryLightColor,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Validasi PO"),
                      ],
                    ),
                  ),
                  value: 11,
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Validasi PO Bahan"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Jahit"),
                              ],
                            ),
                          ),
                          value: 121,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Kimia"),
                              ],
                            ),
                          ),
                          value: 122,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Packing"),
                              ],
                            ),
                          ),
                          value: 123,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Plong"),
                              ],
                            ),
                          ),
                          value: 124,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      if (value == 121) {
                        Get.offNamed('/val_po_bahan?JENIS=JAHIT');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 122) {
                        Get.offNamed('/val_po_bahan?JENIS=KIMIA');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 123) {
                        Get.offNamed('/val_po_bahan?JENIS=PACKING');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 124) {
                        Get.offNamed('/val_po_bahan?JENIS=PLONG');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Validasi PO Non Bahan"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Angkutan"),
                              ],
                            ),
                          ),
                          value: 131,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("DR1"),
                              ],
                            ),
                          ),
                          value: 132,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("DR2"),
                              ],
                            ),
                          ),
                          value: 133,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("DR3"),
                              ],
                            ),
                          ),
                          value: 134,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Umum"),
                              ],
                            ),
                          ),
                          value: 135,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Gabungan"),
                              ],
                            ),
                          ),
                          value: 136,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      if (value == 131) {
                        Get.offNamed('/val_po_nonbahan?DR=AKT');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 132) {
                        Get.offNamed('/val_po_nonbahan?DR=I');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 133) {
                        Get.offNamed('/val_po_nonbahan?DR=II');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 134) {
                        Get.offNamed('/val_po_nonbahan?DR=III');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 135) {
                        Get.offNamed('/val_po_nonbahan?DR=UMUM');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 136) {
                        Get.offNamed('/val_po_nonbahan?DR=GAB');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Badge(
                          position: BadgePosition.topEnd(top: -15, end: -10),
                          toAnimate: false,
                          badgeColor: primaryColor,
                          borderRadius: BorderRadius.circular(2),
                          badgeContent: Text(
                            '1',
                            style: TextStyle(color: Colors.white),
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/menu_notification.svg",
                            height: 20,
                            color: kPrimaryLightColor,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Import"),
                      ],
                    ),
                  ),
                  value: 14,
                ),
              ];
            },
            onSelected: (value) async {
              if (value == 11) {
                Get.offNamed('/val_po');
                Navigator.pop(context);
              } else if (value == 14) {
                Get.offNamed('/val_po_import');
                Navigator.pop(context);
              }
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/menu_dashbord.svg",
                      height: 16,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "PP",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryLightColor),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/icons/angle-down-solid.svg",
                        height: 16,
                        color: primaryColor,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("NonBahan Belum Validasi"),
                      ],
                    ),
                  ),
                  value: 21,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Order Jahit Luar"),
                      ],
                    ),
                  ),
                  value: 22,
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Non Bahan"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Non Bahan ATK"),
                              ],
                            ),
                          ),
                          value: 231,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Non Bahan Inventaris"),
                              ],
                            ),
                          ),
                          value: 232,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Non Bahan Sparepart"),
                              ],
                            ),
                          ),
                          value: 233,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Umum"),
                              ],
                            ),
                          ),
                          value: 234,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Non Bahan RTH"),
                              ],
                            ),
                          ),
                          value: 235,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      if (value == 231) {
                        Get.offNamed('/val_pp_nonbahan?SUB=ATK');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 232) {
                        Get.offNamed('/val_pp_nonbahan?SUB=INV');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 233) {
                        Get.offNamed('/val_pp_nonbahan?SUB=SP');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 234) {
                        Get.offNamed('/val_pp_nonbahan?SUB=UMUM');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 235) {
                        Get.offNamed('/val_pp_nonbahan?SUB=RTH');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Bahan"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Bahan DR1"),
                              ],
                            ),
                          ),
                          value: 241,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Bahan DR2"),
                              ],
                            ),
                          ),
                          value: 242,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Bahan DR3"),
                              ],
                            ),
                          ),
                          value: 243,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      if (value == 241) {
                        Get.offNamed('/val_pp_bahan?DR=I');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 242) {
                        Get.offNamed('/val_pp_bahan?DR=II');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else if (value == 243) {
                        Get.offNamed('/val_pp_bahan?DR=III');
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("RND"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("LBBA"),
                              ],
                            ),
                          ),
                          value: 251,
                        ),
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Cetakan"),
                              ],
                            ),
                          ),
                          value: 252,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      // if (value == 231) {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (_) => MainScreen()));
                      // }
                    },
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Pisau"),
                      ],
                    ),
                  ),
                  value: 26,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("LBBA"),
                      ],
                    ),
                  ),
                  value: 27,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Cetakan"),
                      ],
                    ),
                  ),
                  value: 28,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Cetakan Import"),
                      ],
                    ),
                  ),
                  value: 29,
                ),
              ];
            },
            onSelected: (value) async {
              // if (value == 21) {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (_) => MainScreen()));
              // }
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/menu_dashbord.svg",
                      height: 16,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Pengajuan",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryLightColor),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/icons/angle-down-solid.svg",
                        height: 16,
                        color: primaryColor,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: PopupMenuButton(
                      offset: const Offset(32, 55),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/menu_notification.svg",
                                height: 20,
                                color: kPrimaryLightColor,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text("Lembur"),
                              Expanded(
                                child: SvgPicture.asset(
                                  "assets/icons/angle-down-solid.svg",
                                  height: 16,
                                  color: primaryColor,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/menu_notification.svg",
                                    height: 20,
                                    color: kPrimaryLightColor,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text("Validasi Kabag"),
                                ],
                              ),
                            ),
                            value: 311,
                          ),
                        ];
                      },
                      onSelected: (value) async {
                        // if (value == 231) {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (_) => MainScreen()));
                        // }
                      },
                    ),
                  ),
                ),
                PopupMenuItem(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: PopupMenuButton(
                    offset: const Offset(32, 55),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/menu_notification.svg",
                              height: 20,
                              color: kPrimaryLightColor,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text("Karyawan Baru"),
                            Expanded(
                              child: SvgPicture.asset(
                                "assets/icons/angle-down-solid.svg",
                                height: 16,
                                color: primaryColor,
                                alignment: Alignment.centerRight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                  height: 20,
                                  color: kPrimaryLightColor,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("Karyawan"),
                              ],
                            ),
                          ),
                          value: 321,
                        ),
                      ];
                    },
                    onSelected: (value) async {
                      // if (value == 231) {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (_) => MainScreen()));
                      // }
                    },
                  ),
                ),
              ];
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/menu_dashbord.svg",
                      height: 16,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "BON",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryLightColor),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/icons/angle-down-solid.svg",
                        height: 16,
                        color: primaryColor,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Validasi BON"),
                      ],
                    ),
                  ),
                  value: 41,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Belum Val Sparepart"),
                      ],
                    ),
                  ),
                  value: 42,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Sudah Val Sparepart"),
                      ],
                    ),
                  ),
                  value: 43,
                ),
              ];
            },
            onSelected: (value) async {
              if (value == 43) {
                Get.offNamed('/bon_sudah_val_sp');
                Navigator.pop(context);
              }
            },
          ),
          PopupMenuButton(
            offset: const Offset(0, 50),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/menu_dashbord.svg",
                      height: 16,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Bantuan",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryLightColor),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/icons/angle-down-solid.svg",
                        height: 16,
                        color: primaryColor,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Bantuan IT"),
                      ],
                    ),
                  ),
                  value: 51,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Bantuan Teknik"),
                      ],
                    ),
                  ),
                  value: 52,
                ),
                PopupMenuItem(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/menu_notification.svg",
                          height: 20,
                          color: kPrimaryLightColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("Bantuan Umum"),
                      ],
                    ),
                  ),
                  value: 53,
                ),
              ];
            },
            onSelected: (value) async {
              // if (value == 11) {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (_) => MainScreen()));
              // }
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: primaryColor,
        height: 16,
      ),
      title: Text(
        title,
      ),
    );
  }
}
