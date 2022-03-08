import 'package:admin/constants.dart';
import 'package:admin/controllers/spik_controller.dart';
import 'package:admin/responsive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    // Provider.of<SPIKController>(context, listen: false)
    //     .Detail_Pengajuan(widget.NO_BUKTI, 'ppd');
    // Provider.of<SPIKController>(context, listen: false)
    //     .Data_Image(widget.NO_BUKTI, 'pp');
    print(widget.NO_BUKTI);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SPIKController>(
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
        title: Text("DETAIL SPIK",
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
}
