class ItemSearchModel {
  String _errorDesc = '';
  String _errorCode = '';
  List<Result> _results = [];

  ItemSearchModel();

  ItemSearchModel.fromJson(Map<String, dynamic> data) {
    _errorDesc = data['ErrorDesc'];
    _errorCode = data['ErrorCode'];
    if (_errorCode == '200') {
      for (int i = 0; i < data['ObjectData'].length; i++) {
        Result _result = Result(data['ObjectData'][i]);
        _results.add(_result);
      }
    }
  }

  String get errorDesc => _errorDesc;

  String get errorCode => _errorCode;

  List<Result> get results => _results;
}

class Result {
  int _stt;
  String _maThuocTinh;
  String _tenThuocTinh;
  String _moTa;
  String _giaTri;
  String _kieuDuLieu;
  String _batBuocNhap;

  Result(result) {
    _stt = result['stt'];
    _maThuocTinh = result['ma_thuoc_tinh'];
    _tenThuocTinh = result['ten_thuoc_tinh'];
    _moTa = result['mo_ta'];
    _giaTri = result['gia_tri'];
    _kieuDuLieu = result['kieu_du_lieu'];
    _batBuocNhap = result['bat_buoc_nhap'];
  }

  int get stt => _stt;

  String get maThuocTinh => _maThuocTinh;

  String get tenThuocTinh => _tenThuocTinh;

  String get moTa => _moTa;

  String get giaTri => _giaTri;

  String get kieuDuLieu => _kieuDuLieu;

  String get batBuocNhap => _batBuocNhap;
}
