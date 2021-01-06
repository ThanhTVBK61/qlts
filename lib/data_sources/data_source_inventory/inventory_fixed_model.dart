///{
///     "ErrorCode": "200",
///     "ErrorDesc": "Thành công",
///     "ObjectData": [
///         {
///             "id": 2,
///             "so_phieu": "BDG000000/CSKK/20/00001",
///             "ten": "BDG chốt sổ lần 1",
///             "ngay_ky": "08/12/2020",
///             "ngay_bat_dau": "08/12/2020",
///             "ngay_ket_thuc": "08/12/2020"
///         }
///     ]
/// }
class InventoryFixedModel {
  String _errorCode;
  String _errorDesc;
  List<InventoryFixed> _listInventoryFixed = [];

  InventoryFixedModel.fromJson(Map<String, dynamic> data) {
    _errorCode = data['ErrorCode'];
    _errorDesc = data['ErrorDesc'];
    if (_errorCode == '200') {
      for (int i = 0; i < data['ObjectData'].length; i++) {
        InventoryFixed _inventory = InventoryFixed(data['ObjectData'][i]);
        _listInventoryFixed.add(_inventory);
      }
    }
  }

  String get errorCode => _errorCode;

  String get errorDesc => _errorDesc;

  List<InventoryFixed> get listInventoryFixed => _listInventoryFixed;
}

class InventoryFixed{
  int _id;
  String _soPhieu;
  String _ten;
  String _ngayKy;
  String _ngayBatDau;
  String _ngayKetThuc;

  InventoryFixed(inventoryFixed) {
    _id = inventoryFixed['id'];
    _soPhieu = inventoryFixed['so_phieu'];
    _ten = inventoryFixed['ten'];
    _ngayKy = inventoryFixed['ngay_ky'];
    _ngayBatDau = inventoryFixed['ngay_bat_dau'];
    _ngayKetThuc = inventoryFixed['ngay_ket_thuc'];
  }

  @override
  String toString() {
    return 'id: $_id, so_phieu: $_soPhieu, ten: $_ten, ngay_ky: $_ngayKy, ngay bat dau: $_ngayBatDau, ngay ket thuc: $_ngayKetThuc';
  }

  String get ngayKetThuc => _ngayKetThuc;

  String get ngayBatDau => _ngayBatDau;

  String get ngayKy => _ngayKy;

  String get ten => _ten;

  String get soPhieu => _soPhieu;

  int get id => _id;
}