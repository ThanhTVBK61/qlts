import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

class InventoryNCKT{

  int idKqkk = -1;
  List<DataShow> listDataShow = [];

  InventoryNCKT.fromInventoryOffline(InventoryOffline inventoryOffline, List<DataVariantConfig> listDataVariantConfig){

    this.idKqkk = inventoryOffline.idKqkk;

    listDataShow.add(getDataShow(listDataVariantConfig, 'so_the', inventoryOffline.soThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten_the', inventoryOffline.tenThe) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_cong_trinh', inventoryOffline.loaiCongTrinh) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_du_an', inventoryOffline.maDuAn) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'loai_ts', inventoryOffline.loaiTs) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'gia_tri', inventoryOffline.giaTri) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ma_so', inventoryOffline.maSo) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'ten', inventoryOffline.ten) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'so_luong', inventoryOffline.soLuong) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_xay_dung', inventoryOffline.namXayDung) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'nam_su_dung', inventoryOffline.namSuDung) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'so_tang', inventoryOffline.soTang) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'dien_tich_san', inventoryOffline.dienTichSan) ?? DataShow());
    listDataShow.add(getDataShow(listDataVariantConfig, 'dia_diem', inventoryOffline.diaDiem) ?? DataShow());
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

  InventoryNCKT();

}
//
// int idKqkk;
// int stt;
// String groupVariant;
// String soThe;
// String tenThe;
// String loaiCongTrinh;
// String maDuAn;
// String loaiTs;
// String giaTri;
// String maSo;
// String ten;
// String soLuong;
// String namXayDung;
// String namSuDung;
// String soTang;
// String dienTichSan;
// String diaDiem;
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
// InventoryNCKT.fromMap(inventoryNCKT){
//   idKqkk = inventoryNCKT['id_kqkk'];
//   stt = inventoryNCKT['stt'];
//   groupVariant = inventoryNCKT['group_variant'];
//   soThe = inventoryNCKT['so_the'];
//   tenThe = inventoryNCKT['ten_the'];
//   loaiCongTrinh = inventoryNCKT['loai_cong_trinh'];
//   maDuAn = inventoryNCKT['ma_du_an'];
//   loaiTs = inventoryNCKT['loai_ts'];
//   giaTri = inventoryNCKT['gia_tri'];
//   maSo = inventoryNCKT['ma_so'];
//   ten = inventoryNCKT['ten'];
//   soLuong = inventoryNCKT['so_luong'];
//   namXayDung = inventoryNCKT['nam_xay_dung'];
//   namSuDung = inventoryNCKT['nam_su_dung'];
//   soTang = inventoryNCKT['so_tang'];
//   dienTichSan = inventoryNCKT['dien_tich_san'];
//   diaDiem = inventoryNCKT['dia_diem'];
//   maTinhTrangSd = inventoryNCKT['ma_tinh_trang_sd'];
//   tenTinhTrangSd = inventoryNCKT['ten_tinh_trang_sd'];
//   maDviSd = inventoryNCKT['ma_dvi_sd'];
//   tenDviSd = inventoryNCKT['ten_dvi_sd'];
//   maPhong = inventoryNCKT['ma_phong'];
//   tenPhong = inventoryNCKT['ten_phong'];
//   maCsht = inventoryNCKT['ma_csht'];
//   tenCsht = inventoryNCKT['ten_csht'];
//   maNs = inventoryNCKT['ma_ns'];
//   tenNs = inventoryNCKT['ten_ns'];
//   qrCode = inventoryNCKT['qr_code'];
//   qrCodeGiaTri = inventoryNCKT['qr_code_gtri'];
//   ghiChu = inventoryNCKT['ghi_chu'];
// }

// List<DataShow> listDataShow(List<DataVariantConfig> listDataVariantConfig){
//   List<DataShow> result = [];
//   result.add(getDataShow(listDataVariantConfig, 'so_the', soThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten_the', tenThe) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_cong_trinh', loaiCongTrinh) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_du_an', maDuAn) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'loai_ts', loaiTs) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'gia_tri', giaTri) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ma_so', maSo) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'ten', ten) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'so_luong', soLuong) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_xay_dung', namXayDung) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'nam_su_dung', namSuDung) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'so_tang', soTang) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'dien_tich_san', dienTichSan) ?? DataShow());
//   result.add(getDataShow(listDataVariantConfig, 'dia_diem', diaDiem) ?? DataShow());
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

///                     "id_kqkk": 41294,
///                     "stt": 1,
///                     "group_variant": "NCKT",
///                     "so_the": "1041",
///                     "ten_the": "Hthống ch.sét đường nguồn Dĩ An",
///                     "loai_cong_trinh": null,
///                     "ma_du_an": "42p0226",
///                     "loai_ts": "695",
///                     "gia_tri": null,
///                     "ma_so": "1041.VKT1",
///                     "ten": "Hthống ch.sét đường nguồn Dĩ An",
///                     "so_luong": "1",
///                     "nam_xay_dung": "2002",
///                     "nam_su_dung": "2002",
///                     "so_tang": null,
///                     "dien_tich_san": null,
///                     "dia_diem": null,
///                     "ma_tinh_trang_sd": "10",
///                     "ten_tinh_trang_sd": null,
///                     "ma_dvi_sd": "07205",
///                     "ten_dvi_sd": "Trung tâm VT Dĩ An",
///                     "ma_phong": null,
///                     "ten_phong": null,
///                     "ma_csht": null,
///                     "ten_csht": null,
///                     "ma_ns": null,
///                     "ten_ns": null,
///                     "qr_code": "C",
///                     "qr_code_gtri": null,
///                     "ghi_chu": null,
