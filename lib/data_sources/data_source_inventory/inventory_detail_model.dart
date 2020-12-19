/// "ErrorCode": "200",
/// "ErrorDesc": "Thành công",
/// "SoThe": "3058",
/// "IdChiTiet": "3058.MM2",
/// "MaNhomThuocTinh": "MMTB",
/// "ObjectData": [
/// {
/// "stt": 1,
/// "ma_thuoc_tinh": "so_the",
/// "ten_thuoc_tinh": "Số thẻ (*)",
/// "mo_ta": "Text: Số thẻ sinh trên IMS có cấu trúc theo quy định",
/// "gia_tri": "3058",
///"kieu_du_lieu": "text",
/// "bat_buoc_nhap": "true"
/// },
class InventoryDetailModel {
  String _errorCode;
  String _errorDesc;
  String _soThe;
  String _idChiTiet;
  String _maNhomThuocTinh;
  List<InventoryDetail> _listInventoryDetail = [];

  InventoryDetailModel.fromJson(Map<String, dynamic> data) {
    _errorCode = data['ErrorCode'];
    _errorDesc = data['ErrorDesc'];
    if (_errorCode == '200') {
      _soThe = data['SoThe'];
      _idChiTiet = data['IdChiTiet'];
      _maNhomThuocTinh = data['MaNhomThuocTinh'];
      for (int i = 0; i < data['ObjectData'].length; i++) {
        InventoryDetail _inventoryDetail =
            InventoryDetail(data['ObjectData'][i]);
        _listInventoryDetail.add(_inventoryDetail);
      }
    }
  }

  String get errorCode => _errorCode;

  String get errorDesc => _errorDesc;

  String get soThe => _soThe;

  String get idChiTiet => _idChiTiet;

  String get maNhomThuocTinh => _maNhomThuocTinh;

  List get listInventoryDetail => _listInventoryDetail;
}

class InventoryDetail {
  int _stt;
  String _maThuocTinh;
  String _tenThuocTinh;
  String _moTa;
  String _giaTri;
  String _kieuDuLieu;
  String _batBuocNhap;

  InventoryDetail(inventoryDetail) {
    _stt = inventoryDetail['stt'];
    _maThuocTinh = inventoryDetail['ma_thuoc_tinh'];
    _tenThuocTinh = inventoryDetail['ten_thuoc_tinh'];
    _moTa = inventoryDetail['mo_ta'];
    _giaTri = inventoryDetail['gia_tri'];
    _kieuDuLieu = inventoryDetail['kieu_du_lieu'];
    _batBuocNhap = inventoryDetail['bat_buoc_nhap'];
  }

  @override
  String toString() {
    return 'stt: $_stt, ma_thuoc_tinh: $_maThuocTinh, ten_thuoc_tinh: $_tenThuocTinh, mo_ta: $_moTa, gia_tri: $_giaTri, kieu_du_lieu: $_kieuDuLieu, bat_buoc_nhap: $_batBuocNhap';
  }

  int get stt => _stt;

  String get maThuocTinh => _maThuocTinh;

  String get tenThuocTinh => _tenThuocTinh;

  String get moTa => _moTa;

  String get giaTri => _giaTri;

  String get kieuDuLieu => _kieuDuLieu;

  String get batBuocNhap => _batBuocNhap;
}
