import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/controllers/bon_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget SudahValSPCard(
    BuildContext context, int index, SudahValSPController val_bar,
    {VoidCallback? pressDetail, VoidCallback? pressDelete}) {
  int offset = Provider.of<SudahValSPController>(context, listen: false).offset;

  String NO_BUKTI = val_bar.data_SudahValSPList[index]['NO_BUKTI'] ?? "-";
  String date = val_bar.data_SudahValSPList[index]['TGL'] ?? "-";
  DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
  String TGL = DateFormat("dd-MM-yyyy").format(tempDate);
  String USRNM = val_bar.data_SudahValSPList[index]['USRNM'] ?? "-";
  String DR = val_bar.data_SudahValSPList[index]['DR'] ?? "-";
  String COBA_TGLVAL = val_bar.data_SudahValSPList[index]['COBA_TGLVAL'] ?? "-";

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
              USRNM,
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
              DR,
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
              COBA_TGLVAL,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    ),
  );
}
