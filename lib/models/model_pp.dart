import 'package:dio/dio.dart';
import 'dart:convert';

class model_ValPp {
  ///paginate
  Future count_ValPp_paginate(
      String key_cari, String FLAG, String DR, String SUB) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?count_pp_paginate",
      data: {"cari": key_cari, "FLAG": FLAG, "DR": DR, "SUB": SUB},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  /// paginate
  Future<List> data_ValPp_paginate(String cari, String FLAG, String DR,
      String SUB, int paramoffset, int paramlimit) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?pp_paginate",
      data: {
        "cari": cari,
        "FLAG": FLAG,
        "DR": DR,
        "SUB": SUB,
        "offset": paramoffset.toString(),
        "limit": paramlimit.toString()
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  ///SELECT DETAIL
  Future<List> select_ValPp_detail(String NO_BUKTI, String paramtabel) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?select_detail",
      data: {"NO_BUKTI": NO_BUKTI, "TABEL": paramtabel},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }

  Future update_ValPp(Map data_insert, int jumlahData) async {
    try {
      ///DATA HEADER
      Dio().options.contentType = Headers.formUrlEncodedContentType;
      await Dio().post(
        "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?update_header_ValPp",
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
          "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?update_detail_ValPp",
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

  ///SELECT DETAIL
  Future<List> select_Image(String NO_BUKTI, String paramtabel) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/val_pp_pembelian.php?select_image",
      data: {"NO_BUKTI": NO_BUKTI, "TABEL": paramtabel},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }
}
