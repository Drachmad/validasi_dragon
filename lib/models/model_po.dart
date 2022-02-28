import 'package:dio/dio.dart';
import 'dart:convert';

class model_ValPo {
  ///paginate
  Future count_ValPo_paginate(
      String key_cari, String FLAG, String DR, String JENIS) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pembelian.php?count_po_paginate",
      data: {"cari": key_cari, "FLAG": FLAG, "DR": DR, "JENIS": JENIS},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  /// paginate
  Future<List> data_ValPo_paginate(String cari, String FLAG, String DR,
      String JENIS, int paramoffset, int paramlimit) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pembelian.php?po_paginate",
      data: {
        "cari": cari,
        "FLAG": FLAG,
        "DR": DR,
        "JENIS": JENIS,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  ///SELECT DETAIL
  Future<List> select_ValPo_detail(String NO_BUKTI, String paramtabel) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pembelian.php?select_detail",
      data: {"NO_BUKTI": NO_BUKTI, "TABEL": paramtabel},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  Future update_ValPo(Map data_insert, int jumlahData) async {
    try {
      ///DATA HEADER
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      await Dio().post(
        "http://nurrachmadwidyanto.web.id/val_pembelian.php?update_header_ValPo",
        data: {
          "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
          "COBA_VAL": data_insert['COBA_VAL'].toString(),
          "COBA_USRVAL": data_insert['COBA_USRVAL'].toString(),
          "COBA_TGLVAL": data_insert['COBA_TGLVAL'].toString()
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      ///DATA DETAIL
      for (int i = 0; i < jumlahData; i++) {
        Dio().options.contentType = Headers.formUrlEncodedContentType;
        await Dio().post(
          "http://nurrachmadwidyanto.web.id/val_pembelian.php?update_detail_ValPo",
          data: {
            "NO_BUKTI": data_insert['NO_BUKTI'].toString(),
            "COBA_VAL": data_insert['COBA_VAL'].toString(),
            "COBA_USRVAL": data_insert['COBA_USRVAL'].toString(),
            "COBA_TGLVAL": data_insert['COBA_TGLVAL'].toString()
          },
          options: Options(contentType: Headers.formUrlEncodedContentType),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
