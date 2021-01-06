import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryPTVT{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  ///Convert tu inventoryoffline -> inventoryptvt
  InventoryPTVT.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'so_luong', inventoryOffline.soLuong) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nuoc_sx', inventoryOffline.nuocSx) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_sx', inventoryOffline.namSx) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'model', inventoryOffline.model) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'bien_kiem_soat', inventoryOffline.bienKiemSoat) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'xi_lanh', inventoryOffline.xiLanh) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cong_suat', inventoryOffline.congSuat) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'km_su_dung', inventoryOffline.kmSuDung) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_nhien_lieu', inventoryOffline.loaiNhienLieu) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'so_may_so_khung', inventoryOffline.soKhungSoMay) ?? DataShow());

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

  InventoryPTVT();

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
// String soLuong;
//
// String nuocSx;
// String namSx;
//
// String model;
//
// String namSuDung;
//
// String bienKiemSoat;
// String xiLanh;
// String congSuat;
// String kmSuDung;
// String loaiNhienLieu;
// String soKhungSoMay;
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
//
// String ghiChu;

// InventoryPTVT.fromMap(inventoryPTVT){
//   idKqkk = inventoryPTVT['id_kqkk'];
//   stt = inventoryPTVT['stt'];
//   groupVariant = inventoryPTVT['group_variant'];
//   soThe = inventoryPTVT['so_the'];
//   tenThe = inventoryPTVT['ten_the'];
//   maDuAn = inventoryPTVT['ma_du_an'];
//   loaiTs = inventoryPTVT['loai_ts'];
//   giaTri = inventoryPTVT['gia_tri'];
//   maSo = inventoryPTVT['ma_so'];
//   ten = inventoryPTVT['ten'];
//   soLuong = inventoryPTVT['so_luong'];
//
//   nuocSx = inventoryPTVT['nuoc_sx'];
//   namSx = inventoryPTVT['nam_sx'];
//   model = inventoryPTVT['model'];
//   namSuDung = inventoryPTVT['nam_su_dung'];
//
//   bienKiemSoat = inventoryPTVT['bien_kiem_soat'];
//   xiLanh = inventoryPTVT['xi_lanh'];
//   congSuat = inventoryPTVT['cong_suat'];
//   kmSuDung = inventoryPTVT['km_su_dung'];
//   loaiNhienLieu = inventoryPTVT['loai_nhien_lieu'];
//   soKhungSoMay = inventoryPTVT['so_khung_so_may'];
//
//   maTinhTrangSd = inventoryPTVT['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryPTVT['ten_tinh_trang_sd'];
//   maDviSd = inventoryPTVT['ma_dvi_sd'];
//   tenDviSd = inventoryPTVT['ten_dvi_sd'];
//   maPhong = inventoryPTVT['ma_phong'];
//   tenPhong = inventoryPTVT['ten_phong'];
//   maCsht = inventoryPTVT['ma_csht'];
//   tenCsht = inventoryPTVT['ten_csht'];
//   maNs = inventoryPTVT['ma_ns'];
//   tenNs = inventoryPTVT['ten_ns'];
//   qrCode = inventoryPTVT['qr_code'];
//   qrCodeGiaTri = inventoryPTVT['qr_code_gtri'];
//   ghiChu = inventoryPTVT['ghi_chu'];
// }


// ///Hien thi danh sach
// List<DataShow> listDataShow(List<DataVariantConfig> listDataVariantConfig){
//   List<DataShow> result = [];
//   result.add(getDataShow(listDataVariantConfig, 'so_the', soThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_the', tenThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_du_an', maDuAn) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_ts', loaiTs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'gia_tri', giaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_so', maSo) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten', ten) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'so_luong', soLuong) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nuoc_sx', nuocSx) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_sx', namSx) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'model', model) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'bien_kiem_soat', bienKiemSoat) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'xi_lanh', xiLanh) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cong_suat', congSuat) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'km_su_dung', kmSuDung) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_nhien_lieu', loaiNhienLieu) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'so_may_so_khung', soKhungSoMay) ?? DataShow());
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
//
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

///"id_kqkk": 41356,
//                     "stt": 1,
//                     "group_variant": "PTVT",
//                     "so_the": "2064",
//                     "ten_the": "Xe Ford Di An - 61L 3521",
//                     "ma_du_an": "420883",
//                     "loai_ts": "4119",
//                     "gia_tri": "441349909.0",
//                     "ma_so": "2064.1",
//                     "ten": null,
//                     "so_luong": "1",
//                     "nuoc_sx": "Việt Nam",
//                     "nam_sx": "2008",
//                     "model": "Ranger 2AW",
//                     "nam_su_dung": "2008",
//                     "bien_kiem_soat": "61L-3521",
//                     "xi_lanh": "2499",
//                     "cong_suat": null,
//                     "km_su_dung": "125.500",
//                     "loai_nhien_lieu": null,
//                     "so_khung_so_may": null,
//                     "ma_tinh_trang_sd": "10",
//                     "ten_tinh_trang_sd": null,
//                     "ma_dvi_sd": "07205",
//                     "ten_dvi_sd": "Trung tâm VT Dĩ An",
//                     "ma_phong": null,
//                     "ten_phong": null,
//                     "ma_csht": null,
//                     "ten_csht": null,
//                     "ma_ns": null,
//                     "ten_ns": null,
//                     "qr_code": "C",
//                     "qr_code_gtri": null,
//                     "ghi_chu": null,