import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/model_spik.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_controller.dart';

class SPIKController with ChangeNotifier {
  List data_SPIKList = [];
  List DataDetailList = [];
  List DataImage = [];
  bool proses = false;

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
  TextEditingController dataNotif = TextEditingController();
  TextEditingController dataDetailNotif = TextEditingController();
  model_SPIK m_SPIK = model_SPIK();
  late List<DropdownMenuItem<int>> dropdownLimit;
  String FLAG = '';
  String DR = '';
  String SUB = '';
  int totalPaging = 0;
  int offset = 0;
  int limit = 0;
  double pageCount = 1;
  int page_index = 0;

  ///paginate
  Future<void> initData(
      String paramFLAG, String paramDR, String paramSUB) async {
    data_SPIKList = [];
    c_page.text = '1';
    FLAG = paramFLAG;
    DR = paramDR;
    SUB = paramSUB;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      dataNotif.clear();
    });
    limitPaging();
    await selectDataPaginate(true, '');
    // initFilterSupplier();
  }

  ///paginate
  Future<void> selectDataPaginate(bool reload, cari) async {
    if (reload) {
      offset = 0;
      page_index = 0;
    }
    data_SPIKList =
        await m_SPIK.data_SPIK_paginate(cari, FLAG, DR, SUB, offset, limit);
    var count = await m_SPIK.count_SPIK_paginate(cari, FLAG, DR, SUB);
    totalPaging = int.tryParse(count[0]['COUNT(*)'].toString()) ?? 0;
    if (totalPaging == 0) {
      dataNotif.text = "Tidak ada Data";
    }
    pageCount = totalPaging / limit;
    notifyListeners();
  }

  ///paginate
  void limitPaging() {
    dropdownLimit = [];
    dropdownLimit.add(DropdownMenuItem(
      child: Text('10', style: TextStyle(fontSize: 10)),
      value: 10,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('25', style: TextStyle(fontSize: 10)),
      value: 25,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('50', style: TextStyle(fontSize: 10)),
      value: 50,
    ));
    dropdownLimit.add(DropdownMenuItem(
      child: Text('100', style: TextStyle(fontSize: 10)),
      value: 100,
    ));
    limit = dropdownLimit[0].value!;
  }

  Future<void> Detail_SPIK(String NO_BUKTI, String paramtabel) async {
    DataDetailList = [];
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      dataDetailNotif.clear();
    });
    DataDetailList = await m_SPIK.select_SPIK_detail(NO_BUKTI, paramtabel);
    if (DataDetailList.length <= 0) {
      dataDetailNotif.text = "Tidak Ada Data";
    }
    notifyListeners();
  }

  Future update_SPIK(String NO_BUKTI) async {
    Map obj = new Map();
    obj['NO_BUKTI'] = NO_BUKTI;
    obj['COBA_VAL'] = 1;
    obj['COBA_USRVAL'] = LoginController.nama_staff;
    obj['COBA_TGLVAL'] = DateTime.now();
    await m_SPIK.update_SPIK(obj, DataDetailList.length);
    Fluttertoast.showToast(
        msg: "Validasi Sukses",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: secondaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
    notifyListeners();
    await selectDataPaginate(true, '');
  }

  Future Data_Image(String NO_BUKTI, String paramtabel) async {
    DataDetailList = [];
    DataImage = await m_SPIK.select_Image(NO_BUKTI, paramtabel);
    notifyListeners();
  }
}
