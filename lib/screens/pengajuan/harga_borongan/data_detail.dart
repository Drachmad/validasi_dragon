import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:admin/controllers/pengajuan_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DataDetail extends StatefulWidget {
  var NO_BUKTI;
  var controller;

  DataDetail({this.NO_BUKTI, this.controller});

  @override
  _DataDetailState createState() => _DataDetailState();
}

class _DataDetailState extends State<DataDetail> {
  late int index_terpilih;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<PengajuanController>(context, listen: false)
        .Detail_Pengajuan(widget.NO_BUKTI, 'ppd');
    Provider.of<PengajuanController>(context, listen: false)
        .Data_Image(widget.NO_BUKTI, 'pp');
    print(widget.NO_BUKTI);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PengajuanController>(
        builder: (context, data_detailController, child) {
      var image = "http://nurrachmadwidyanto.web.id/friend2.jpg";
      print(data_detailController.DataImage.length);
      if (data_detailController.DataImage.length > 0) {
        if (data_detailController.DataImage[0]["IMG_URL"] != null) {
          image = data_detailController.DataImage[0]["IMG_URL"].toString();
        }
      }
      print(image);
      return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text("DETAIL HARGA BORONGAN",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center),
        backgroundColor: bgColor,
        scrollable: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Text(
                  "Kembali",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
        content: Scrollbar(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height + 400,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: bgColorDark,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Artikel",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Inject",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Emboss",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "P. Sewing",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "P. Cat Spray",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Cat Kuas/Spray",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "P. Flocking",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Flocking",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Assembling",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Comp",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Giling",
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: (data_detailController.DataDetailList.length > 0)
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            itemCount:
                                data_detailController.DataDetailList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return DetailCard(index);
                            },
                          )
                        : Container(
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller:
                                    data_detailController.dataDetailNotif,
                                readOnly: true,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Loading . . .",
                                  hintStyle: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
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
                  ),
                  Padding(
                    padding: (Responsive.isMobile(context))
                        ? EdgeInsets.symmetric(horizontal: 16)
                        : EdgeInsets.symmetric(horizontal: 128),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }

  Widget DetailCard(int index) {
    var data_detail = Provider.of<PengajuanController>(context, listen: false)
        .DataDetailList[index];
    return Container(
      color: secondaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    // onTap: (){pressDetail()},
                    child: Center(
                      child: Text(
                        // Artikel,
                        "-",
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['KET'].toString(),
                  // Inject,
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // NumberFormat.decimalPattern()
                  //     .format(double.parse(data_detail['QTY'])),
                  // Emboss
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // P. Sewing
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // P. Cat Spray
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // Cat Kuas/Spray
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // P.Flocking
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // FLocking
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // Assembling
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // Comp
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  // data_detail['JTEMPO'],
                  // Giling
                  "-",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
