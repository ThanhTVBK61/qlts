import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryTCOT{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryTCOT.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'diem_dau', inventoryOffline.diemDau) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'diem_cuoi', inventoryOffline.diemCuoi) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', inventoryOffline.namDauTu) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());

    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h6', inventoryOffline.cotBeTongH6) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h6_5', inventoryOffline.cotBeTongH65) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h7', inventoryOffline.cotBeTongH7) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h8', inventoryOffline.cotBeTongH8) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_sat_l6', inventoryOffline.cotSat16) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_sat_l7', inventoryOffline.cotSat17) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h8', inventoryOffline.cotMuaDienLucH8) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h10', inventoryOffline.cotMuaDienLucH10) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h12', inventoryOffline.cotMuaDienLucH12) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_khac', inventoryOffline.loaiKhac) ?? DataShow());

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

  InventoryTCOT();
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
// String diemDau;
// String diemCuoi;
//
// String namDauTu;
// String namSuDung;
//
// String cotBeTongH6;
// String cotBeTongH65;
// String cotBeTongH7;
// String cotBeTongH8;
// String cotSat16;
// String cotSat17;
// String cotMuaDienLucH8;
// String cotMuaDienLucH10;
// String cotMuaDienLucH12;
// String loaiKhac;
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
// InventoryTCOT.fromMap(inventoryTCOT){
//   idKqkk = inventoryTCOT['id_kqkk'];
//   stt = inventoryTCOT['stt'];
//   groupVariant = inventoryTCOT['group_variant'];
//   soThe = inventoryTCOT['so_the'];
//   tenThe = inventoryTCOT['ten_the'];
//   maDuAn = inventoryTCOT['ma_du_an'];
//   loaiTs = inventoryTCOT['loai_ts'];
//   giaTri = inventoryTCOT['gia_tri'];
//   maSo = inventoryTCOT['ma_so'];
//   ten = inventoryTCOT['ten'];
//
//   diemDau = inventoryTCOT['diem_dau'];
//   diemCuoi = inventoryTCOT['diem_cuoi'];
//
//   namDauTu = inventoryTCOT['nam_dau_tu'];
//   namSuDung = inventoryTCOT['nam_su_dung'];
//
//   cotBeTongH6 = inventoryTCOT['cot_be_tong_h6'];
//   cotBeTongH65 = inventoryTCOT['cot_be_tong_h6_5'];
//   cotBeTongH7 = inventoryTCOT['cot_be_tong_h7'];
//   cotBeTongH8 = inventoryTCOT['cot_be_tong_h8'];
//   cotSat16 = inventoryTCOT['cot_sat_l6'];
//   cotSat17 = inventoryTCOT['cot_sat_l7'];
//   cotMuaDienLucH8 = inventoryTCOT['cot_mua_dien_luc_h8'];
//   cotMuaDienLucH10 = inventoryTCOT['cot_mua_dien_luc_h10'];
//   cotMuaDienLucH12 = inventoryTCOT['cot_mua_dien_luc_h12'];
//   loaiKhac = inventoryTCOT['loai_khac'];
//
//   maTinhTrangSd = inventoryTCOT['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryTCOT['ten_tinh_trang_sd'];
//   maDviSd = inventoryTCOT['ma_dvi_sd'];
//   tenDviSd = inventoryTCOT['ten_dvi_sd'];
//   maPhong = inventoryTCOT['ma_phong'];
//   tenPhong = inventoryTCOT['ten_phong'];
//   maCsht = inventoryTCOT['ma_csht'];
//   tenCsht = inventoryTCOT['ten_csht'];
//   maNs = inventoryTCOT['ma_ns'];
//   tenNs = inventoryTCOT['ten_ns'];
//   qrCode = inventoryTCOT['qr_code'];
//   qrCodeGiaTri = inventoryTCOT['qr_code_gtri'];
//   ghiChu = inventoryTCOT['ghi_chu'];
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
//   result.add(getDataShow(listDataVariantConfig, 'diem_dau' ,diemDau) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'diem_cuoi' ,diemCuoi) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'nam_dau_tu', namDauTu) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//
//   result.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h6' ,cotBeTongH6) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h6_5' ,cotBeTongH65) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h7' ,cotBeTongH7) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_be_tong_h8' ,cotBeTongH8) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_sat_l6' ,cotSat16) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_sat_l7' ,cotSat17) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h8' ,cotMuaDienLucH8) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h10' ,cotMuaDienLucH10) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'cot_mua_dien_luc_h12' ,cotMuaDienLucH12) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_khac' ,loaiKhac) ?? DataShow());
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
//
// DataShow getDataShow(List<DataVariantConfig> listDataVariantConfig, String code, String value){
//   listDataVariantConfig.forEach((dataVariantConfig){
//     if(dataVariantConfig.code == code)
//       return DataShow(name: dataVariantConfig.name, type: dataVariantConfig.type, canUpdate: dataVariantConfig.canUpdate, giaTri: value);
//
//   });
//
//   return null;
// }

/// "id_kqkk": 43946,
// "stt": 1,
// "group_variant": "TCOT",
// "so_the": "1142",
// "ten_the": "MRMCNH TĐ Dĩ AN, Tân Vạn 2002",
// "ma_du_an": "42P0215",
// "loai_ts": "423",
// "gia_tri": null,
// "ma_so": "391",
// "ten": null,
//
// "diem_dau": "DT743A",
// "diem_cuoi": "QL1K (N3 Trường MG Hoa Hồng 2)",
//
// "nam_dau_tu": "2002",
// "nam_su_dung": "2002",
//
// "cot_be_tong_h6": null,
// "cot_be_tong_h6_5": null,
// "cot_be_tong_h7": null,
// "cot_be_tong_h8": null,
// "cot_sat_l6": null,
// "cot_sat_l7": null,
// "cot_mua_dien_luc_h8": null,
// "cot_mua_dien_luc_h10": null,
// "cot_mua_dien_luc_h12": null,
// "loai_khac": null,
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
// "ghi_chu": "Đường Trần Đại Nghĩa (Các đường nhánh từ DT 743A)",
