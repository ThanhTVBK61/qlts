///"ErrorCode": "200",
///     "ErrorDesc": "Thành công",
///     "ObjectData": [
///         {
///             "id": 3,
///             "so_phieu": "HNI000000/ĐKK/20/00001",
///             "ten": "HNI - Kiểm kê tháng 12/2020",
///             "ngay_ky": "08/12/2020",
///             "ngay_bat_dau": "08/12/2020",
///             "ngay_ket_thuc": "08/12/2020",
///             "tai_du_lieu_offline": 0,
///             "upload_du_lieu": 0
///         },

class InventoryModel {
  String _errorCode;
  String _errorDesc;
  List<Inventory> _listInventory = [];

  InventoryModel.fromJson(Map<String, dynamic> data) {
    _errorCode = data['ErrorCode'];
    _errorDesc = data['ErrorDesc'];
    if (_errorCode == '200') {
      for (int i = 0; i < data['ObjectData'].length; i++) {
        Inventory _inventory = Inventory(data['ObjectData'][i]);
        _listInventory.add(_inventory);
      }
    }
  }

  String get errorCode => _errorCode;

  String get errorDesc => _errorDesc;

  List<Inventory> get listInventory => _listInventory;
}

class Inventory {
  int _id;
  String _soPhieu;
  String _ten;
  String _ngayKy;
  String _ngayBatDau;
  String _ngayKetThuc;
  int _taiDuLieuOffline;
  int _upLoadDuLieu;

  Inventory(inventory) {
    _id = inventory['id'];
    _soPhieu = inventory['so_phieu'];
    _ten = inventory['ten'];
    _ngayKy = inventory['ngay_ky'];
    _ngayBatDau = inventory['ngay_bat_dau'];
    _ngayKetThuc = inventory['ngay_ket_thuc'];
    _taiDuLieuOffline = inventory['tai_du_lieu_offline'];
    _upLoadDuLieu = inventory['upload_du_lieu'];
  }

  @override
  String toString() {
    return 'id: $_id, so_phieu: $_soPhieu, ten: $_ten, ngay_ky: $_ngayKy, ngay bat dau: $_ngayBatDau, ngay ket thuc: $ngayKetThuc, tai du lieu offline: $_taiDuLieuOffline, upload du lieu: $_upLoadDuLieu';
  }

  int get id => _id;

  String get soPhieu => _soPhieu;

  String get ten => _ten;

  String get ngayKy => _ngayKy;

  String get ngayBatDau => _ngayBatDau;

  String get ngayKetThuc => _ngayKetThuc;

  int get taiDuLieuOffline => _taiDuLieuOffline;

  int get upLoadDuLieu => _upLoadDuLieu;
}
