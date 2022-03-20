import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin/models/model_po.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_controller.dart';

class ValPoController with ChangeNotifier {
  List<String> indexVal = <String>[];

  addItem(String val) {
    indexVal.add(val);
    print(indexVal);
  }

  removeItem(String val) {
    indexVal.removeWhere((data) => data == val);
    print(indexVal);
  }

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
    indexVal = [];
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
    notifyListeners();
    await selectDataPaginate(true, '');
  }

  Future<void> showMyDialog(BuildContext context) async {
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
                for (int x = 0; x < indexVal.length; x++) {
                  update_ValPo(indexVal[x]);
                }
                indexVal = [];
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
