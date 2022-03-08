import 'package:dio/dio.dart';
import 'dart:convert';

class model_SudahValSP {
  ///paginate
  Future count_SudahValSP_paginate(String key_cari) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_bon_pembelian.php?count_sudah_val_sp_paginate",
      data: {"cari": key_cari},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  /// paginate
  Future<List> data_SudahValSP_paginate(
      String cari, int paramoffset, int paramlimit) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_bon_pembelian.php?sudah_val_sp_paginate",
      data: {
        "cari": cari,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  ///SELECT DETAIL
  Future<List> select_SudahValSP_detail(
      String NO_BUKTI, String paramtabel) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_bon_pembelian.php?select_detail",
      data: {"NO_BUKTI": NO_BUKTI, "TABEL": paramtabel},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }
}
