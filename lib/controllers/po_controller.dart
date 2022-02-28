import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/model_po.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_controller.dart';

class ValPoController with ChangeNotifier {
  List data_ValPoList = [];
  List DataDetailList = [];
  bool proses = false;

  ///paginate
  TextEditingController c_page = new TextEditingController();
  TextEditingController cari = TextEditingController();
  TextEditingController dataNotif = TextEditingController();
  TextEditingController dataDetailNotif = TextEditingController();
  model_ValPo m_ValPo = model_ValPo();
  late List<DropdownMenuItem<int>> dropdownLimit;
  String FLAG = '';
  String DR = '';
  String JENIS = '';
  int totalPaging = 0;
  int offset = 0;
  int limit = 0;
  double pageCount = 1;
  int page_index = 0;

  ///paginate
  Future<void> initData(
      String paramFLAG, String paramDR, String paramJENIS) async {
    data_ValPoList = [];
    c_page.text = '1';
    FLAG = paramFLAG;
    DR = paramDR;
    JENIS = paramJENIS;
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
    data_ValPoList =
        await m_ValPo.data_ValPo_paginate(cari, FLAG, DR, JENIS, offset, limit);
    var count = await m_ValPo.count_ValPo_paginate(cari, FLAG, DR, JENIS);
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

  Future<void> Detail_ValPo(String NO_BUKTI, String paramtabel) async {
    DataDetailList = [];
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      dataDetailNotif.clear();
    });
    DataDetailList = await m_ValPo.select_ValPo_detail(NO_BUKTI, paramtabel);
    if (DataDetailList.length <= 0) {
      dataDetailNotif.text = "Tidak Ada Data";
    }
    notifyListeners();
  }

  Future update_ValPo(String NO_BUKTI) async {
    Map obj = new Map();
    obj['NO_BUKTI'] = NO_BUKTI;
    obj['COBA_VAL'] = 1;
    obj['COBA_USRVAL'] = LoginController.nama_staff;
    obj['COBA_TGLVAL'] = DateTime.now();
    await m_ValPo.update_ValPo(obj, DataDetailList.length);
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
}
