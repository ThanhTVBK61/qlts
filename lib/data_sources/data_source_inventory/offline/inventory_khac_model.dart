import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryKHAC{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryKHAC.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', inventoryOffline.namDauTu) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_tinh_trang_sd', inventoryOffline.maTinhTrangSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_tinh_trang_sd', inventoryOffline.tenTinhTrangSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_dvi_sd', inventoryOffline.maDviSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_dvi_sd', inventoryOffline.tenDviSd) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_phong', inventoryOffline.maPhong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_phong', inventoryOffline.tenPhong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_csht', inventoryOffline.maCsht) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_csht', inventoryOffline.tenCsht) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_ns', inventoryOffline.maNs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_ns', inventoryOffline.tenNs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'qr_code', inventoryOffline.qrCode) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'qr_code_gtri', inventoryOffline.qrCodeGiaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ghi_chu', inventoryOffline.ghiChu) ?? DataShow());
  }

  InventoryKHAC();

}

// int idKqkk;
// int stt;
// String groupVariant;
// String soThe;
// String tenThe;
// String maDuAn;
// String loaiTs;
// String giaTri;
// String maSo;
// String ten;
//
// String namDauTu;
// String namSuDung;
//
// String maTinhTrangSd;
// String tenTinhTrangSd;
// String maDviSd;
// String tenDviSd;
// String maPhong;
// String tenPhong;
// String maCsht;
// String tenCsht;
// String maNs;
// String tenNs;
// String qrCode;
// String qrCodeGiaTri;
// String ghiChu;
//
// InventoryKHAC.fromMap(inventoryKHAC){
//   idKqkk = inventoryKHAC['id_kqkk'];
//   stt = inventoryKHAC['stt'];
//   groupVariant = inventoryKHAC['group_variant'];
//   soThe = inventoryKHAC['so_the'];
//   tenThe = inventoryKHAC['ten_the'];
//   maDuAn = inventoryKHAC['ma_du_an'];
//   loaiTs = inventoryKHAC['loai_ts'];
//   giaTri = inventoryKHAC['gia_tri'];
//   maSo = inventoryKHAC['ma_so'];
//   ten = inventoryKHAC['ten'];
//
//   namDauTu = inventoryKHAC['nam_dau_tu'];
//   namSuDung = inventoryKHAC['nam_su_dung'];
//
//   maTinhTrangSd = inventoryKHAC['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryKHAC['ten_tinh_trang_sd'];
//   maDviSd = inventoryKHAC['ma_dvi_sd'];
//   tenDviSd = inventoryKHAC['ten_dvi_sd'];
//   maPhong = inventoryKHAC['ma_phong'];
//   tenPhong = inventoryKHAC['ten_phong'];
//   maCsht = inventoryKHAC['ma_csht'];
//   tenCsht = inventoryKHAC['ten_csht'];
//   maNs = inventoryKHAC['ma_ns'];
//   tenNs = inventoryKHAC['ten_ns'];
//   qrCode = inventoryKHAC['qr_code'];
//   qrCodeGiaTri = inventoryKHAC['qr_code_gtri'];
//   ghiChu = inventoryKHAC['ghi_chu'];
// }

// List<DataShow> listDataShow(List<DataVariantConfig> listDataVariantConfig){
//   List<DataShow> result = [];
//   result.add(getDataShow(listDataVariantConfig, 'so_the', soThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_the', tenThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_du_an', maDuAn) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_ts', loaiTs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'gia_tri', giaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_so', maSo) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten', ten) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', namDauTu) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'ma_tinh_trang_sd', maTinhTrangSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_tinh_trang_sd', tenTinhTrangSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_dvi_sd', maDviSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_dvi_sd', tenDviSd) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_phong', maPhong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_phong', tenPhong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_csht', maCsht) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_csht', tenCsht) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_ns', maNs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_ns', tenNs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'qr_code', qrCode) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'qr_code_gtri', qrCodeGiaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ghi_chu', ghiChu) ?? DataShow());
//
//   return result;
// }

// DataShow getDataShow(List<DataVariantConfig> listDataVariantConfig, String code, String value){
//   listDataVariantConfig.forEach((dataVariantConfig){
//     if(dataVariantConfig.code == code)
//       return DataShow(name: dataVariantConfig.name, type: dataVariantConfig.type, canUpdate: dataVariantConfig.canUpdate, giaTri: value);
//
//   });
//
//   return null;
// }


// "id_kqkk": 44062,
// "stt": 1,
// "group_variant": "KHAC",
// "so_the": "3021",
// "ten_the": "Trang bị 10 Shelter cho các trạm BTS - Viễn thông Bình Dương đợt 02 năm 2019",
// "ma_du_an": "072P190077",
// "loai_ts": "694",
// "gia_tri": "6500000.0",
// "ma_so": "3021.K9",
// "ten": "Hệ Thống Điện AC trong tủ + Nguồn điện cho máy nổ",
//
// "nam_dau_tu": "2019",
// "nam_su_dung": "2019",
//
// "ma_tinh_trang_sd": "10",
// "ten_tinh_trang_sd": null,
// "ma_dvi_sd": "07205",
// "ten_dvi_sd": "Trung tâm VT Dĩ An",
// "ma_phong": null,
// "ten_phong": null,
// "ma_csht": null,
// "ten_csht": null,
// "ma_ns": null,
// "ten_ns": null,
// "qr_code": "C",
// "qr_code_gtri": null,
// "ghi_chu": null,
