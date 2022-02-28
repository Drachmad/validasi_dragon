import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/controllers/pp_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Widget ValPpNonBahanCard(
    BuildContext context, int index, ValPpController val_bar,
    {VoidCallback? pressDetail, VoidCallback? pressTawar}) {
  int offset = Provider.of<ValPpController>(context, listen: false).offset;

  String NO_BUKTI = val_bar.data_ValPpList[index]['NO_BUKTI'] ?? "-";
  String date = val_bar.data_ValPpList[index]['TGL'] ?? "-";
  DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
  String TGL = DateFormat("dd-MM-yyyy").format(tempDate);
  String DR = val_bar.data_ValPpList[index]['DR'] ?? "-";
  String tempTOTAL_QTY = val_bar.data_ValPpList[index]['TOTAL_QTY'] ?? "-";
  String TOTAL_QTY =
      NumberFormat.decimalPattern().format(double.parse(tempTOTAL_QTY));
  String USRNM = val_bar.data_ValPpList[index]['USRNM'] ?? "-";
  String COBA_VAL = val_bar.data_ValPpList[index]['COBA_VAL'] ?? "-";

  final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Validasi'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Yakin Ingin Memvalidasi?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Validasi'),
              onPressed: () {
                val_bar.update_ValPp(NO_BUKTI);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              TOTAL_QTY,
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
            child: (COBA_VAL != '1')
                ? Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        _showMyDialog();
                      },
                      child: Center(
                        child: Text(
                          "Val",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    ),
  );
}
