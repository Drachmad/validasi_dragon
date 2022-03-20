import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/controllers/po_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget ValPoCard(BuildContext context, int index, ValPoController val_bar,
    {VoidCallback? pressDetail}) {
  int offset = Provider.of<ValPoController>(context, listen: false).offset;

  String NO_BUKTI = val_bar.data_ValPoList[index]['NO_BUKTI'] ?? "-";
  String date = val_bar.data_ValPoList[index]['TGL'] ?? "-";
  DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
  String TGL = DateFormat("dd-MM-yyyy").format(tempDate);
  String NAMAS = val_bar.data_ValPoList[index]['NAMAS'] ?? "-";
  String KODES = val_bar.data_ValPoList[index]['KODES'] ?? "-";
  String tempTOTAL = val_bar.data_ValPoList[index]['TOTAL'] ?? "-";
  String TOTAL = NumberFormat.decimalPattern().format(double.parse(tempTOTAL));
  String COBA_VAL = val_bar.data_ValPoList[index]['COBA_VAL'] ?? "-";

  bool checked = false;

  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: bgColorDark),
          child: Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${index + offset + 1}.",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 3,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: pressDetail,
                    child: Center(
                      child: Text(
                        NO_BUKTI,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 2,
                child: Text(
                  TGL,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 2,
                child: Text(
                  NAMAS,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 2,
                child: Text(
                  KODES,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 2,
                child: Text(
                  TOTAL,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 3),
              Expanded(
                flex: 2,
                child: (COBA_VAL != '1')
                    ? Checkbox(
                        activeColor: primaryColor,
                        value: checked,
                        onChanged: (val) {
                          setState(() {
                            checked = !checked;
                          });
                          if (checked) {
                            val_bar.addItem(NO_BUKTI);
                          } else {
                            val_bar.removeItem(NO_BUKTI);
                          }
                        })
                    : SvgPicture.asset(
                        "assets/icons/circle-check-solid.svg",
                        height: 16,
                        color: primaryColor,
                      ),
              ),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      );
    },
  );
}
