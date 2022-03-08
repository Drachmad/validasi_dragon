import 'package:admin/config/animation_custom_dialog.dart';
import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/controllers/pp_controller.dart';
import 'package:admin/screens/pp/val_pp_lbba/data_detail.dart';
import 'package:admin/screens/pp/val_pp_lbba/val_pp_lbba_card.dart';
import 'package:provider/provider.dart';

class ValPpLBBAScreen extends StatefulWidget {
  @override
  _ValPpLBBAScreenState createState() => _ValPpLBBAScreenState();
}

class _ValPpLBBAScreenState extends State<ValPpLBBAScreen> {
  @override
  void initState() {
    // var SUB = Get.parameters['SUB'];
    Provider.of<ValPpController>(context, listen: false)
        .initData('LBBA', '', '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ValPpController>(
        builder: (context, ValPpLBBA_Controller, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColorDark,
          elevation: 1,
          title: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              if (!Responsive.isDesktop(context))
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: context.read<MenuController>().controlMenu,
                ),
              Text(
                "VALIDASI PP LBBA",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: bgColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          if (ValPpLBBA_Controller.data_ValPpList.length > 0)
                            Text(
                              "Showing",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          if (ValPpLBBA_Controller.data_ValPpList.length > 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                width: 75,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      iconEnabledColor: kPrimaryLightColor,
                                      value: ValPpLBBA_Controller.limit,
                                      items: ValPpLBBA_Controller.dropdownLimit,
                                      onChanged: (value) {
                                        if (value != null) {
                                          ValPpLBBA_Controller.limit =
                                              value as int;
                                          ValPpLBBA_Controller
                                              .selectDataPaginate(
                                                  false,
                                                  ValPpLBBA_Controller
                                                      .cari.text);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 20,
                                child: TextField(
                                  controller: ValPpLBBA_Controller.cari,
                                  onChanged: (value) {
                                    Provider.of<ValPpController>(context,
                                        listen: false);
                                    Provider.of<ValPpController>(context,
                                            listen: false)
                                        .selectDataPaginate(true, value);
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Cari",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: bgColorDark,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "NO",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "No Bukti",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Tgl",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Tgl Minta",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Divisi",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Ket",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Pesan",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Flag",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: (ValPpLBBA_Controller.data_ValPpList.length > 0)
                    ? ListView.builder(
                        itemCount: ValPpLBBA_Controller.data_ValPpList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ValPpLBBACard(
                              context, index, ValPpLBBA_Controller,
                              pressDetail: () {
                            showAnimatedDialog(
                                context,
                                DataDetail(
                                    NO_BUKTI: ValPpLBBA_Controller
                                        .data_ValPpList[index]['NO_BUKTI'],
                                    controller: ValPpLBBA_Controller),
                                isFlip: true);
                          }, pressTawar: () {});
                        },
                      )
                    : Container(
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: ValPpLBBA_Controller.dataNotif,
                            readOnly: true,
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: "Loading ...",
                              hintStyle: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 14),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),

        /// paginate ///
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: bgColorDark,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (ValPpLBBA_Controller.page_index > 0) {
                      ValPpLBBA_Controller.offset -= ValPpLBBA_Controller.limit;
                      ValPpLBBA_Controller.page_index--;
                      ValPpLBBA_Controller.c_page.text =
                          (ValPpLBBA_Controller.page_index + 1).toString();
                      ValPpLBBA_Controller.selectDataPaginate(
                          false, ValPpLBBA_Controller.cari.text);
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: (ValPpLBBA_Controller.offset == 0)
                          ? bgColorDark
                          : primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Text(
                        "Previous",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: (ValPpLBBA_Controller.offset == 0)
                                ? bgColorDark
                                : kPrimaryLightColor),
                      ),
                    ),
                  ),
                ),
                pageField(),
                InkWell(
                  onTap: () {
                    if (ValPpLBBA_Controller.page_index <=
                        ValPpLBBA_Controller.pageCount - 1) {
                      ValPpLBBA_Controller.offset += ValPpLBBA_Controller.limit;
                      ValPpLBBA_Controller.page_index++;
                      ValPpLBBA_Controller.c_page.text =
                          (ValPpLBBA_Controller.page_index + 1).toString();
                      ValPpLBBA_Controller.selectDataPaginate(
                          false, ValPpLBBA_Controller.cari.text);
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: ((ValPpLBBA_Controller.pageCount -
                                  ValPpLBBA_Controller.page_index) <=
                              1)
                          ? bgColorDark
                          : primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: ((ValPpLBBA_Controller.pageCount -
                                        ValPpLBBA_Controller.page_index) <=
                                    1)
                                ? bgColorDark
                                : kPrimaryLightColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  ///paginate
  Widget pageField() {
    ValPpController pageTerima =
        Provider.of<ValPpController>(context, listen: false);
    return Container(
      width: 70,
      height: 35,
      child: TextField(
        textAlign: TextAlign.center,
        controller: pageTerima.c_page,
        readOnly: true,
        decoration: InputDecoration(
          hintText: "1",
          hintStyle: GoogleFonts.poppins(
              fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        onSubmitted: (value) {
          int index = 1;
          try {
            index = int.parse(value.trim());
          } catch (e) {
            index = 1;
          }
          if (index == 0) {
            index = 1;
          } else {
            if (index > 0) {
              index = index - 1;
            }
          }
          if (index > pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.selectDataPaginate(false, '');
          } else if (index < pageTerima.page_index) {
            pageTerima.offset = (index * pageTerima.limit);
            pageTerima.page_index = index;
            pageTerima.c_page.text = (pageTerima.page_index + 1).toString();
            pageTerima.selectDataPaginate(false, '');
          }
        },
      ),
    );
  }
}
